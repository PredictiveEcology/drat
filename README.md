# Predictive Ecology packages

A `drat` repository of development versions of R packages developed by the Predictive Ecology Group.

## Getting started

1. install the `drat` package:

    ```r
    install.packages("drat")
    ```

2. next, add this repository:

    ```r
    drat:::add("PredictiveEcology") 
    
    ## alternatively, add 'https://drat.predictiveecology.org' to your 'repos' list via options()
    # r <- getOption("repos")
    # options(repos = c(r, PE = "https://drat.predictiveecology.org"))
    ```
    
3. install packages, e.g.

    ```r
    install.packages("amc")
    ```

For a full listing of available packages, see <https://github.com/PredictiveEcology/drat/tree/main/packages.txt>.
