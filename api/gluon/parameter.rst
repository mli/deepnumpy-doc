Parameters
=================

Neural network parameters are often ndarrays. A ndarray, such as the weight of a
dense layer, is presented as a ``Parameter`` object in Gluon. Then
``ParameterDict`` is used store multiple ``Parameter``'s.


.. currentmodule:: mxnet.gluon

.. autosummary::
   :toctree: .

   Parameter
   ParameterDict


.. admonition:: Example

   Import modules and construct a MLP.

   >>> from mxnet import np, npx
   >>> from mxnet.gluon import nn
   >>> npx.set_np()

   >>> net = nn.Sequential()
   >>> net.add(nn.Dense(10, activation='relu'),
   ...         nn.Dense(2))


   Access the weight of the first layer (uninitialized yet)

   >>> print(net[0].weight)
   Parameter dense0_weight (shape=(10, -1), dtype=float32)

   Get all parameters

   >>> print(net.collect_params())
   sequential0_ (
     Parameter dense0_weight (shape=(10, -1), dtype=float32)
     Parameter dense0_bias (shape=(10,), dtype=float32)
     Parameter dense1_weight (shape=(2, -1), dtype=float32)
     Parameter dense1_bias (shape=(2,), dtype=float32)
   )

We can

.. currentmodule:: mxnet

.. autosummary::
   :toctree: .

   initializer
