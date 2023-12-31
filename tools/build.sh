#!/bin/bash

set -e

# Solution to hard-coded Makevars in the arma branch
Rscript -e "                 \
    install.packages(       \
        c(                  \
          'Rcpp',           \
          'RcppArmadillo',  \
          'RcppGSL'         \
        ),                  \
        repos = 'https://packagemanager.rstudio.com/all/__linux__/jammy/latest', \
        lib = file.path(Sys.getenv('R_HOME'), 'library')                         \
    )                                                                            \
"

# Solution to documentation issues
Rscript -e "                                               \
    remotes::install_version(                             \
        package = 'roxygen2',                             \
        version = '5.0.1',                                \
        repos = c(CRAN = 'https://cran.rstudio.com')      \
    )                                                     \
"

# dynrautoVAR
Rscript -e "          \
    install.packages( \
        c(            \
          'qgraph',   \
          'igraph',   \
          'fclust'    \
        ),            \
        repos = 'https://packagemanager.rstudio.com/all/__linux__/jammy/latest', \
    )                                                                            \
"

# qgraph
apt-get install -y \
  libglpk-dev

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
rm LinearSDE.*
rm Rplots.pdf
echo -e "\nInstall dynr, done!"
