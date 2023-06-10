#!/bin/bash

set -e

# roxygen2

Rscript -e "                                              \
    remotes::install_version(                             \
        package = 'roxygen2',                             \
        version = '5.0.1',                                \
        repos = c(CRAN = 'https://cran.rstudio.com')      \
    )                                                     \
"

# tinytex

Rscript -e "                                              \
    try(tinytex::install_tinytex())                       \
"

git clone -b arma https://github.com/mhunter1/dynr.git
cd dynr
cd src
wget -q https://raw.githubusercontent.com/sigmaresearch100/r-ubuntu-22.04-dynr/main/src/Makevars.in -O Makevars.in
cd ..
./configure
make clean install
cd ..
rm -rf dynr
Rscript -e "demo('LinearSDE', package = 'dynr')"

echo -e "\nInstall dynr, done!"
