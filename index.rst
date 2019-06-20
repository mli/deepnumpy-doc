Apache MXNet (incubating) Documents
====================================

.. toctree::
   :maxdepth: 1
   :hidden:

   api/index


.. a warning, will remove it later

.. container:: new-site

   .. note::

      This is a preview of Apache MXNet (incubating)'s new **numpy-like**
      interface. It only contains the API documents, please check MXNet's main
      website for more documents.

.. raw:: html

   <style>.note {max-width: 756px;}</style>


Install
-------

.. Ignore prerequisites to make the index page concise, which will be shown at
   the install page

.. raw:: html

   <style>.admonition-prerequisite {display: none;}</style>

.. include:: install/install-include.rst


API Documents
---------

This API section details functions, modules, and objects included in MXNet,
describing what they are and what they do. The APIs are grouped into the
following categories:

.. container:: cards

   .. card::
      :title: np module
      :link: np/routines.html

      Numpy-like module to manipulate multi-dimensional arrays.

..
   .. card::
      :title: npx module
      :link: npx/index.html

      The extension module to np for deep learning related operators.

   .. card::
      :title: gluon module
      :link: gluon/index.html

      Imperative APIs to load data, construct and train neural networks.

   .. card::
      :title: Gluon-related modules
      :link: gluon-related/index.html

      Modules, including context and optimizer, that can be used with Gluon.


.. toctree::
   :maxdepth: 1
   :hidden:

   np/routines
   ..
      numpy-extension/index
   ..
      gluon/index
   ..
      gluon-related/index
