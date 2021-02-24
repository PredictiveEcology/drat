# packages
`drat` repository of development versions of R packages developed by the Predictive Ecology Group.

To get started using packages from this repo:

1. install the `drat` package:

    ```r
    install.packages("drat")
    ```

2. next, add this repository:

    ```r
    drat:::add("PredictiveEcology")
    ```
    
3. install packages, e.g.

    ```r
    install.packages("amc")
    ```

For a full listing of available packages, see <https://github.com/PredictiveEcology/drat/tree/main/src/contrib>.
