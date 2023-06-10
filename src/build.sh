#!/bin/bash

set -e

# roxygen2

Rscript -e "                                              \
    remotes::install_version(                             \
        package = 'roxygen2',                             \
        version = '5.0.1',                                \
        repos = c(CRAN = 'https://cran.rstudio.com'),     \
        lib = file.path(Sys.getenv('R_HOME'), 'library')  \
    )                                                     \
"

# tinytex

Rscript -e "                                              \
    try(tinytex::install_tinytex())                       \
"

git clone -b arma https://github.com/mhunter1/dynr.git
cd dynr
./configure
make clean install
cd ..
rm -rf dynr
Rscript -e "demo('LinearSDE', package = 'dynr')"

echo -e "\nInstall dynr, done!"
