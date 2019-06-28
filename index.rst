Apache MXNet (incubating) Documents
====================================

:Date: |today|

.. a warning, will remove it later

.. container:: new-site

   .. note::

      This is a preview of Apache MXNet (incubating)'s new **numpy-like**
      interface. It only contains the API documents, please check MXNet's main
      website for more documents.

.. raw:: html

   <style>.note {max-width: 756px;}</style>


Installation
---------------

.. Ignore prerequisites to make the index page concise, which will be shown at
   the install page

.. raw:: html

   <style>.admonition-prerequisite {display: none;}</style>

.. include:: install/install-include.rst


Guidelines
-------------

This guide section is intended as an introductory overview of MXNet's modules
for manipulating multi-dimensional arrays, loading data, contructing and
training neural networks.

.. container:: cards

   .. card::
      :title: Crash Course
      :link: guide/crash-course/index.html

      A 60-min crash course to train and predict with a convolutional neural
      network.

   .. card::
      :title: DeepNumPy
      :link: guide/deepnumpy/index.html

      Manipulate multi-dimensional arrays with the numpy-like interface.

   .. card::
      :title: Gluon
      :link: guide/gluon/index.html

      Load data, contrusct and train neural networks with Gluon.


API Documents
------------------

This API section details functions, modules, and objects included in MXNet,
describing what they are and what they do. The APIs are grouped into the
following categories:

.. container:: cards

   .. card::
      :title: DeepNumPy
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
