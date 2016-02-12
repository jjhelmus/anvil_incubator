#!/usr/bin/env bash
set -e

# Activate Holy Build Box environment.
source /hbb_exe/activate

# install Miniconda
set -x
curl -s -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p /anaconda
PATH=/opt/rh/devtoolset-2/root/usr/bin:/opt/rh/autotools-latest/root/usr/bin:/anaconda/bin:$PATH

# update conda, install build tools
conda update -yq conda
conda install -yq conda-build jinja2 anaconda-client

# build packages
cd /io
if [ ! -f build_script_linux-64.sh ]; then
    echo "Creating build script from YAML file"
    python create_build_script.py build_specs.yml linux-64 > build_script_linux-64.sh
    chmod +x build_script_linux-64.sh
fi
./build_script_linux-64.sh

# upload packages
cd /anaconda/conda-bld
ls */*.tar.bz2
#anaconda -t $TOKEN upload */*.tar.bz2
