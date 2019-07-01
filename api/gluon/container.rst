Container objects
=====================

Besides constructing neural networks through creating a subclass of ``Block``,
Gluon provides containers to facilitate the construction.


.. admonition:: Example

   Import modules

   >>> from mxnet import np, npx
   >>> from mxnet.gluon import nn
   >>> npx.set_np()

   Construct a MLP

   >>> net = nn.Sequential()
   >>> net.add(nn.Dense(10, activation='relu'),
   ...         nn.Dense(2))

   Initialize the network and run forward

   >>> net.initialize()
   >>> x = np.random.uniform(size=(4, 20))
   >>> print(net(x))
   [[-0.01270512  0.01225275]
    [-0.01303939  0.01191816]
    [-0.01165176  0.00252366]
    [-0.02191715  0.01045103]]

.. currentmodule:: mxnet.gluon

.. autosummary::
    :toctree: generated/

    nn.Sequential
    nn.HybridSequential


.. autosummary::
    :toctree: generated/

    contrib.nn.Concurrent
    contrib.nn.HybridConcurrent
