Gluon reference
=====================

The Gluon library in Apache MXNet provides a clear, concise, and simple API for deep learning.
It makes it easy to prototype, build, and train deep learning models without sacrificing training speed.

.. note::

   The exmaples in API documents haven't fully updated yet, e.g.

   - Most examples use ndarrays defined in ``mxnet.nd``. We can replace it by
     the ndarrays in ``mxnet.np`` if running ``npx.set_np()`` before.

   - Some examples may put codes under the naming scope by ``with
     self.name_scope()``. It's optional since version 1.2.

.. toctree::
   :maxdepth: 2

   creation
   parameter
   initilization
   loss
   training
   data
   modelzoo
   utils
