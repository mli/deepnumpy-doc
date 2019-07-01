Recurrent Layers
====================================

Recurrent neural network layers are provided in the following two modules:
``mxnet.gluon.rnn`` and ``mxnet.gluon.contrib.rnn``.


.. currentmodule:: mxnet.gluon

Recurrent Cells
----------------

.. autosummary::
    :toctree: generated

    rnn.LSTMCell
    rnn.GRUCell
    rnn.RecurrentCell
    rnn.SequentialRNNCell
    rnn.BidirectionalCell
    rnn.DropoutCell
    rnn.ZoneoutCell
    rnn.ResidualCell
    contrib.rnn.Conv1DRNNCell
    contrib.rnn.Conv2DRNNCell
    contrib.rnn.Conv3DRNNCell
    contrib.rnn.Conv1DLSTMCell
    contrib.rnn.Conv2DLSTMCell
    contrib.rnn.Conv3DLSTMCell
    contrib.rnn.Conv1DGRUCell
    contrib.rnn.Conv2DGRUCell
    contrib.rnn.Conv3DGRUCell
    contrib.rnn.VariationalDropoutCell
    contrib.rnn.LSTMPCell

Recurrent Layers
----------------

.. autosummary::
    :toctree: generated


    rnn.RNN
    rnn.LSTM
    rnn.GRU
