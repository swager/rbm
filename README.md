#rbm
Tail index estimation with random block maxima. This package implements the random block maxima method proposed by Wager (2014).

To install this package in R, run the following commands:

```R
install.packages("devtools")
library(devtools) 
install_github("swager/rbm")
```

Example usage:

```R
library(rbm)
rbm.point_estimate(abs(rt(2000, df = 3)))
```

####References
Stefan Wager. <b>Subsampling Extremes: From Block Maxima to Smooth Tail Estimation</b>. <i>Journal of Multivariate Analysis</i>, 130, 2014. [<a href="http://arxiv.org/pdf/1204.0316v5.pdf">arxiv</a>]
