Array manipulation routines
***************************

.. currentmodule:: mxnet.np

Basic operations
================
.. autosummary::
   :toctree: generated/

::

    copyto

Changing array shape
====================
.. autosummary::
   :toctree: generated/


   reshape

::

   ravel
   ndarray.flat
   ndarray.flatten

Transpose-like operations
=========================
.. autosummary::
   :toctree: generated/

   swapaxes
   ndarray.T
   transpose

::

   moveaxis
   rollaxis

Changing number of dimensions
=============================
.. autosummary::
   :toctree: generated/

   expand_dims
   squeeze

::

   atleast_1d
   atleast_2d
   atleast_3d
   broadcast
   broadcast_to
   broadcast_arrays

Changing kind of array
======================
.. autosummary::
   :toctree: generated/

::

   asarray
   asanyarray
   asmatrix
   asfarray
   asfortranarray
   ascontiguousarray
   asarray_chkfinite
   asscalar
   require

Joining arrays
==============
.. autosummary::
   :toctree: generated/

   concatenate
   stack

::

   column_stack
   dstack
   hstack
   vstack
   block

Splitting arrays
================
.. autosummary::
   :toctree: generated/

   split

::

   array_split
   dsplit
   hsplit
   vsplit

Tiling arrays
=============
.. autosummary::
   :toctree: generated/

   tile
   repeat

Adding and removing elements
============================
.. autosummary::
   :toctree: generated/

::

   delete
   insert
   append
   resize
   trim_zeros
   unique

Rearranging elements
====================
.. autosummary::
   :toctree: generated/

   reshape

::

   flip
   fliplr
   flipud
   roll
   rot90
