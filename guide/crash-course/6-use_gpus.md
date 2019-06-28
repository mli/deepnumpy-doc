# Use GPUs

We often use GPUs to train and deploy neural networks, because it offers significant more computation power compared to CPUs. In this tutorial we will introduce how to use GPUs with MXNet.

First, make sure you have at least one Nvidia GPU in your machine and CUDA
properly installed. Other GPUs such as AMD and Intel GPUs are not supported
yet. Then be sure you have installed the GPU-enabled version of MXNet.

Let's check the number GPUs are available.

```{.python .input  n=2}
from mxnet import np, npx, gluon, autograd
from mxnet.gluon import nn
import time
npx.set_np()

npx.num_gpus()
```

## Allocate data to a GPU

You may notice that MXNet's ndarray is very similar to Numpy. One major difference is MXNet's ndarray has a `context` attribute that specifies which device this array is on. By default, it is on `npx.cpu()`. Now we will change it to the first GPU. You can use `npx.gpu()` or `npx.gpu(0)` to indicate the first GPU.

```{.python .input  n=10}
gpu = npx.gpu() if npx.num_gpus() > 0 else npx.cpu()
x = np.ones((3,4), ctx=gpu)
x
```

For a CPU, MXNet will allocate data on main memory, and try to use all CPU cores as possible, even if there is more than one CPU socket. While if there are multiple GPUs, MXNet needs to specify which GPUs the NDArray will be allocated.

Let's assume there is a least one more GPU. We can create another NDArray and assign it there. (If you only have one GPU, then you will see an error). Here we copy `x` to the second GPU, `npx.gpu(1)`:

```{.python .input  n=11}
gpu_1 = npx.gpu(1) if npx.num_gpus() > 1 else npx.cpu()
x.copyto(gpu_1)
```

MXNet needs users to explicitly move data between devices. But several operators such as `print`, and `asnumpy`, will implicitly move data to main memory.

## Run an operation on a GPU

To perform an operation on a particular GPU, we only need to guarantee that the inputs of this operation are already on that GPU. The output will be allocated on the same GPU as well. Almost all operators in the `np` and `npx` module support running on a GPU.

```{.python .input  n=21}
y = np.random.uniform(size=(3,4), ctx=gpu)
x + y
```

Remember that if the inputs are not on the same GPU, you will see an error.

## Run a neural network on a GPU

Similarly, to run a neural network on a GPU, we only need to copy/move the input data and parameters to the GPU. Let's reuse the previously defined LeNet.

```{.python .input  n=16}
net = nn.Sequential()
net.add(nn.Conv2D(channels=6, kernel_size=5, activation='relu'),
        nn.MaxPool2D(pool_size=2, strides=2),
        nn.Conv2D(channels=16, kernel_size=3, activation='relu'),
        nn.MaxPool2D(pool_size=2, strides=2),
        nn.Dense(120, activation="relu"),
        nn.Dense(84, activation="relu"),
        nn.Dense(10))
```

And then load the saved parameters into GPU 0 directly, or use `net.collect_params().reset_ctx` to change the device.

```{.python .input  n=20}
net.load_parameters('net.params', ctx=gpu)
```

Now create input data on GPU 0. The forward function will then run on GPU 0.

```{.python .input  n=22}
# x = np.random.uniform(size=(1,1,28,28), ctx=gpu)
# net(x) FIXME
```

## [Advanced] Multi-GPU training

Finally, we show how to use multiple GPUs to jointly train a neural network through data parallelism. Let's assume there are *n* GPUs. We split each data batch into *n* parts, and then each GPU will run the forward and backward passes using one part of the data.

Let's first copy the data definitions and the transform function from the [previous tutorial](predict.md).

```{.python .input}
batch_size = 256
transformer = gluon.data.vision.transforms.Compose([
    gluon.data.vision.transforms.ToTensor(),
    gluon.data.vision.transforms.Normalize(0.13, 0.31)])
train_data = gluon.data.DataLoader(
    gluon.data.vision.datasets.FashionMNIST(train=True).transform_first(
        transformer), batch_size, shuffle=True, num_workers=4)
valid_data = gluon.data.DataLoader(
    gluon.data.vision.datasets.FashionMNIST(train=False).transform_first(
        transformer), batch_size, shuffle=False, num_workers=4)
```

The training loop is quite similar to what we introduced before. The major differences are highlighted in the following code.

```{.python .input}
# Diff 1: Use two GPUs for training.
devices = [gpu, gpu_1]
# Diff 2: reinitialize the parameters and place them on multiple GPUs
net.collect_params().initialize(force_reinit=True, ctx=devices)
# Loss and trainer are the same as before
softmax_cross_entropy = gluon.loss.SoftmaxCrossEntropyLoss()
trainer = gluon.Trainer(net.collect_params(), 'sgd', {'learning_rate': 0.1})
for epoch in range(10):
    train_loss = 0.
    tic = time.time()
    for data, label in train_data:
        # Diff 3: split batch and load into corresponding devices
        data_list = gluon.utils.split_and_load(data, devices)
        label_list = gluon.utils.split_and_load(label, devices)
        # Diff 4: run forward and backward on each devices.
        # MXNet will automatically run them in parallel
        with autograd.record():
            losses = [softmax_cross_entropy(net(X), y)
                      for X, y in zip(data_list, label_list)]
        for l in losses:
            l.backward()
        trainer.step(batch_size)
        # Diff 5: sum losses over all devices. Here float will copy data
        # into CPU.
        train_loss += sum([float(l.sum()) for l in losses])
    print("Epoch %d: loss %.3f, in %.1f sec" % (
        epoch, train_loss/len(train_data)/batch_size, time.time()-tic))
```
