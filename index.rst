Apache MXNet (incubating) documents
====================================

:Date: |today|

.. a warning, will remove it later

.. container:: new-site

   .. note::

      This is a preview of the Apache MXNet (incubating) new **NumPy-like**
      interface. It only contains a subset of documents. For more information, see the MXNet 
      main website.

.. raw:: html

   <style>.note {max-width: 782px;}</style>


Installation
---------------

.. Ignore prerequisites to make the index page concise, which will be shown at
   the install page

.. raw:: html

   <style>.admonition-prerequisite {display: none;}</style>

.. include:: install/install-include.rst


Guidelines
-------------

This guide section is intended as an introductory overview of MXNet modules
for manipulating multi-dimensional arrays, loading data, constructing and
training neural networks.

.. container:: cards

   .. card::
      :title: Crash Course
      :link: guide/crash-course/index.html

      A crash course to train and predict with a convolutional neural
      network.

   .. card::
      :title: NP on MXNet
      :link: guide/deepnumpy/index.html

      Manipulate multi-dimensional arrays with the NumPy-like interface.

   .. card::
      :title: Gluon
      :link: guide/gluon/index.html

      Load data, construct and train neural networks with Gluon.


API Documents
------------------

This API section details functions, modules, and objects included in MXNet,
describing what they are and what they do. The APIs are grouped into the
following categories:

.. container:: cards

   .. card::
      :title: NP on MXNet
      :link: api/deepnumpy/index.html

      API documents for ``mxnet.np`` and ``mxnet.npx``.

   .. card::
      :title: Gluon
      :link: api/gluon/index.html

      API documents for ``mxnet.gluon`` and other related modules.

.. toctree::
   :maxdepth: 1
   :hidden:

   guide/index
   api/index
