# `rbm`: Random block maxima

Tail index estimation with random block maxima. This package implements the random block maxima method proposed by Wager (2014).

To install this package in **R**, run the following commands:

```R
library(devtools) 
install_github("swager/rbm")
```

Example usage:

```R
library(rbm)
rbm.point_estimate(abs(rt(2000, df = 3)))
```

### References

Stefan Wager (2014). <b>Subsampling Extremes: From Block Maxima to Smooth Tail Estimation</b>. <i>Journal of Multivariate Analysis</i>, 130, 335-353,  [`doi:10.1016/j.jmva.2014.06.010`](https://doi.org/10.1016/j.jmva.2014.06.010).
