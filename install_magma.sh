#!/bin/sh

####
# This script install MAGMA
# http://magma.maths.usyd.edu.au/magma/
# in in /opt (for Ubuntu platform)
####


# Magma setup
export CUDADIR=/usr/local/cuda-7.5
export OPENBLASDIR=/usr/opt/OpenBLAS
source /opt/intel/composerxe/bin/compilervars.sh intel64

# get source
mkdir ~/magma
cd ~/magma
rm magma-2.0.0.tar.gz
rm -rf magma-2.0.0
wget http://icl.cs.utk.edu/projectsfiles/magma/downloads/magma-2.0.0.tar.gz
tar -xzf magma-2.0.0.tar.gz

# make & install
cd magma-2.0.0
scp make.inc.openblas make.inc
make lib
make test
make sparse
sudo make install prefix=/usr/local/magma