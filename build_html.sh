#!/bin/bash

d2lbook build rst
sphinx-autogen _build/rst/**/*.rst
d2lbook build html
