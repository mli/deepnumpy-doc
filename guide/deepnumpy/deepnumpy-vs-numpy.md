# DeepNumPy versus NumPy
:label:`deepnumpy_vs_numpy`

This tutorial lists some known difference between `mxnet.np` and `numpy`. It aims for a quick guideline for NumPy users to use MXNet's numpy-like API. 

```{.python .input}
import numpy as onp  # o means original
from mxnet import np, npx
npx.set_np()  # Configue MXNet to be numpy-like
```

## Missing Operators

A large amount of operators in numpy has not been supported in MXNet yet (working on it). You can find those missing operators in :ref:`reference`, which are displayed in gray blocks instead of having links to their documents. 

In addition, an operator may do not contain all arguments available in numpy, such as MXNet does not support stride. You need to check the operator document for more details. 

## Extra Functionalities 

The `mxnet.np` module aims to mimic numpy.  Most extra functionalities that enhance numpy for deep learning usages are available on other modules, such as `npx` for operators used in deep learning and `autograd` for automatic differentiation. We may still slightly modify the `np` module API. One notable change is GPU support. Creating routines accepts a `ctx` argument:

```{.python .input}
gpu = npx.gpu() if npx.num_gpus() > 0 else npx.cpu()
a = np.array(1, ctx=gpu)
b = np.random.uniform(ctx=gpu)
(a, b.context)
```

Methods to move data across devices. 

```{.python .input}
a.copyto(npx.cpu()), b.as_in_context(npx.cpu())
```

## Default Data Types

Numpy in default uses 64-bit floating numbers or 64-bit integers. 

```{.python .input}
onp.array([1,2]).dtype, onp.array([1.2,2.3]).dtype
```

MXNet uses 32-bit floating points as the default date type. It's the default data type for deep learning.

```{.python .input}
np.array([1,2]).dtype, np.array([1.2,2.3]).dtype
```

## Scalars

Numpy as has classes for scalars, whose base class is 'numpy.generic'. The returns of selecting an element and reduce operators are scalars. 

```{.python .input}
a = onp.array([1,2])
type(a[0]), type(a.sum())
```

A scalar is almost identical to a 0-rank tensor (TODO, there may be subtle difference), but it has a different class, so we can check their data type with `isinstance` 

```{.python .input}
b = a[0]
(b.ndim, b.size, isinstance(b, onp.generic), isinstance(b, onp.integer),
 isinstance(b, onp.int64), isinstance(b, onp.ndarray))
```

MXNet returns 0-rank `ndarray` for scalars. (TODO, may consider to add scalar classes later.) 

```{.python .input}
a = np.array([1,2])
type(a[0]), type(a.sum())
```

```{.python .input}
b = a[0]
b.ndim, b.size, isinstance(b, np.ndarray)
```

## Save

The `save` method in `mxnet.np` save data into a binary format that's not compatible with numpy's format, e.g., it contains the device information. (TODO, needs more discussion here.). 

```{.python .input}
a = np.array(1, ctx=gpu)
np.save('a', a)
np.load('a')
```

## Matplotlib

Sometimes MXNet's ndarray cannot used by other libraries that accepts numpy inputs, such as matplotlib. The best practice is converting it to numpy with `asnumpy()`.

```{.python .input}
%matplotlib inline
import matplotlib.pyplot as plt

plt.plot(np.array([1,2]).asnumpy());
```
