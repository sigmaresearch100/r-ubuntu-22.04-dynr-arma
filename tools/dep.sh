#!/bin/bash

set -e

apt-get update
#apt-get install -y       \
#    libcurl4-openssl-dev \
#    libharfbuzz-dev      \
#    libfribidi-dev       \
#    libfontconfig1-dev   \
#    build-essential      \
#    cmake                \
#    libopenblas-dev      \
#    liblapack-dev        \
#    libarpack2-dev       \
#    libsuperlu-dev       \
#    libgsl-dev           \
#    libarmadillo-dev     \
#    libeigen3-dev

# git
apt-get install -y   \
    git

# curl
apt-get install -y   \
    libcurl4-openssl-dev

# freetype2
apt-get install -y     \
    libfontconfig1-dev \
    libfreetype6-dev   \
    libjpeg-dev        \
    libpng-dev         \
    libtiff5-dev

# nloptr
apt-get install -y \
    cmake

# openssl
apt-get install -y \
    libssl-dev

# systemfonts
apt-get install -y \
    libfontconfig1-dev

# textshaping
apt-get install -y  \
    libfribidi-dev  \
    libharfbuzz-dev

# xml2
apt-get install -y \
    libxml2-dev

# gsl
apt-get install -y \
    libgsl-dev

# misc3d
apt-get install -y \
    tcl8.6-dev     \
    tk8.6-dev
