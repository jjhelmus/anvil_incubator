#!/usr/bin/env bash

set -e

# Activate Holy Build Box environment.
source /hbb_exe/activate

# install Miniconda
set -x
MINICONDA_URL="https://repo.continuum.io/miniconda"
MINICONDA_FILE="Miniconda3-latest-Linux-x86_64.sh"
wget "${MINICONDA_URL}/${MINICONDA_FILE}"
bash $MINICONDA_FILE -b -p /anaconda
#curl -s -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
#bash Miniconda3-latest-Linux-x86_64.sh -b -p /anaconda
PATH=/opt/rh/devtoolset-2/root/usr/bin:/opt/rh/autotools-latest/root/usr/bin:/anaconda/bin:$PATH

# update conda, install build tools
conda update -yq conda
conda install -yq conda-build jinja2 anaconda-client


# debugging
conda info
ls
pwd
which python
which conda

# build packages
conda build -q -c jjhelmus --python 2.7 --numpy 1.10 /io/recipe
#conda build -q -c jjhelmus --python 3.3 --numpy 1.9 /io/recipe
#conda build -q -c jjhelmus --python 3.4 --numpy 1.10 /io/recipe
#conda build -q -c jjhelmus --python 3.5 --numpy 1.10 /io/recipe

# upload packages
cp /anaconda/conda-bld/*/*.tar.bz2 .
ls *.tar.bz2
#anaconda -t $TOKEN upload *.tar.bz2
