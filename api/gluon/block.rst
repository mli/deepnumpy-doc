Block objects
==================

.. currentmodule:: mxnet.gluon

A neural network is often constructed block by block. A block could be a single
function, e.g. sigmoid, a layer with parameters, e.g. a dense layer, or a
combination of multiple layers and functions. The `Block` object in the Gluon
package is the base object for such a block.


.. admonition:: Example

   Define a model that has a dense layer and return the summed results:

   >>> from mxnet import np, npx, gluon
   >>> npx.set_np()
   >>> class MyModel(gluon.Block):
   ...    def __init__(self, **kwargs):
   ...        super(MyModel, self).__init__(**kwargs)
   ...        self.dense = gluon.nn.Dense(10)
   ...    def forward(self, x):
   ...        return self.dense(x).sum()

   Initialize this model:

   >>> model = MyModel()
   >>> model.initialize()

   Feed in a random input to print the forward output:

   >>> x = np.random.uniform(size=(10,2))
   >>> print(model(x))
   -0.5192252

.. autosummary::
   :toctree: generated/

   Block

.. note::

   ``Block`` can be accessed by either ``mxnet.gluon.Block`` and
   ``mxnet.gluon.nn.Block``. Similar for ``HybridBlock`` and ``SymbolBlock``.


Running computations
--------------------------

.. autosummary::
   :toctree: generated/

   Block.forward
   Block.__call__

Handling parameters
-------------------------

.. autosummary::
   :toctree: generated/


   Block.initialize
   Block.save_parameters
   Block.load_parameters
   Block.collect_params
   Block.cast
   Block.apply


Summarization
------------------

.. autosummary::
   :toctree: generated/

   Block.summary

Advanced APIs for customization
----------------------------------------


.. autosummary::
   :toctree: generated/

   Block.name_scope
   Block.register_child
   Block.register_forward_hook
   Block.register_forward_pre_hook

Attributes
------------------

.. autosummary::
   :toctree: generated/

   Block.name
   Block.params
   Block.prefix


.. warning::

   The following two APIs are deprecated since `v1.2.1
   <https://github.com/apache/incubator-mxnet/releases/tag/1.2.1>`_.

   .. autosummary::
       :toctree: generated/

       Block.save_params
       Block.load_params

Hybridizable block
-----------------------

.. autosummary::
   :toctree: generated/

   HybridBlock

``HybridBlock`` is a subclass of ``Block`` that provides two additional
functions

.. autosummary::
   :toctree: generated/

   HybridBlock.hybridize
   HybridBlock.hybrid_forward


Block construction with Symbol
--------------------------------------

.. autosummary::
   :toctree: generated/

   SymbolBlock
