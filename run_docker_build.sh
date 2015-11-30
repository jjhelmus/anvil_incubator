#!/usr/bin/env bash

unset LANG
conda clean --lock

# update conda
conda update --yes conda

# install build tools
conda install --yes conda-build jinja2 anaconda-client

# debugging
conda info
ls
pwd
ls -la /recipe
which python
which conda

# build packages
conda build -q -c jjhelmus --python 2.7 --numpy 1.10 /io/recipe
#conda build -q -c jjhelmus --python 3.3 --numpy 1.9 /io/recipe
#conda build -q -c jjhelmus --python 3.4 --numpy 1.10 /io/recipe
#conda build -q -c jjhelmus --python 3.5 --numpy 1.10 /io/recipe

# upload packages
cp /opt/conda/conda-bld/*/*.tar.bz2 .
ls *.tar.bz2
#anaconda -t $TOKEN upload *.tar.bz2
