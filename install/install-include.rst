.. role:: title
.. role:: opt
   :class: option
.. role:: act
   :class: active option

We have preview pip package available.  These packages
haven't uploaded into Pypi server yet, so we need to select various options
manually.

.. container:: install

    .. container:: opt-group

       :title:`OS:`
       :opt:`Linux`
       :opt:`macOS`
       :opt:`Windows`

    .. container:: opt-group

       :title:`Backend:`
       :act:`Native`
       :opt:`CUDA`
       :opt:`MKL-DNN`
       :opt:`CUDA + MKL-DNN`

       .. raw:: html

          <div class="mdl-tooltip" data-mdl-for="native">Build-in backend for CPU.</div>
          <div class="mdl-tooltip" data-mdl-for="cuda">Required to run on Nvidia GPUs.</div>
          <div class="mdl-tooltip" data-mdl-for="mkl-dnn">Accelerate Intel CPU performance.</div>
          <div class="mdl-tooltip" data-mdl-for="cuda-mkl-dnn">Enable both Nvidia CPUs and Inter CPU acceleration.</div>

    .. admonition:: Prerequisites:

       - Requires `pip >= 9. <https://pip.pypa.io/en/stable/installing/>`_ for Python 3.

       .. container:: cuda cuda-mkl-dnn

          - Requires `CUDA
            <https://developer.nvidia.com/cuda-toolkit-archive>`_.
            Supported versions include 8.0, 9.0, and 9.2.
          - Hint: `cuDNN <https://developer.nvidia.com/cudnn>`_ is already
            included in the MXNet binary, so you don't need to install it.

       .. container:: mkl-dnn cuda-mkl-dnn

          - Hint: `MKL-DNN <https://01.org/mkl-dnn>`_ is already included in
            the MXNet binary, so you don't need to install it.
          - For detailed information on MKL and MKL-DNN,
            refer to the `MKLDNN_README <https://mxnet.incubator.apache.org/versions/master/tutorials/mkldnn/MKLDNN_README.html>`_.

    .. admonition:: Command:

       .. container:: macos

          .. container:: native

             .. code-block:: bash

                # For python 3.7
                pip install https://apache-mxnet.s3-accelerate.amazonaws.com/dist/python/numpy/latest/mxnet-1.5.0-cp37-cp37m-macosx_10_11_x86_64.whl
                # For python 3.6
                pip install https://apache-mxnet.s3-accelerate.amazonaws.com/dist/python/numpy/latest/mxnet-1.5.0-cp36-cp36m-macosx_10_11_x86_64.whl

          .. container:: mkl-dnn

             .. code-block:: bash

                # For python 3.7
                pip install https://apache-mxnet.s3-accelerate.amazonaws.com/dist/python/numpy/latest/mxnet_mkl-1.5.0-cp37-cp37m-macosx_10_11_x86_64.whl
                # For python 3.6
                pip install https://apache-mxnet.s3-accelerate.amazonaws.com/dist/python/numpy/latest/mxnet_mkl-1.5.0-cp36-cp36m-macosx_10_11_x86_64.whl

       .. container:: linux

          .. container:: native

             .. code-block:: bash

                pip install https://apache-mxnet.s3-accelerate.amazonaws.com/dist/python/numpy/latest/mxnet-1.5.0-py2.py3-none-manylinux1_x86_64.whl
                
          .. container:: mkl-dnn

             .. code-block:: bash

                pip install https://apache-mxnet.s3-accelerate.amazonaws.com/dist/python/numpy/latest/mxnet_mkl-1.5.0-py2.py3-none-manylinux1_x86_64.whl

          .. container:: cuda

             .. code-block:: bash

                # Here we assume CUDA 10.0 is installed.
                pip install https://apache-mxnet.s3-accelerate.amazonaws.com/dist/python/numpy/latest/mxnet_cu100-1.5.0-py2.py3-none-manylinux1_x86_64.whl

          .. container:: cuda-mkl-dnn

              .. code-block:: bash

                 # Here we assume CUDA 10.1 is installed.
                 pip install https://apache-mxnet.s3-accelerate.amazonaws.com/dist/python/numpy/latest/mxnet_cu101mkl-1.5.0-py2.py3-none-manylinux1_x86_64.whl

       .. container:: windows

          Not supported yet.


.. raw:: html

   <style>.disabled { display: none; }</style>
