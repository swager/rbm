#' Plot effect of tuning parameter
#'
#' Computes the RBM estimate for the tail index Gamma at several
#' values of K, and plots the output
#'
#' @param data_array the raw data, assumed to be positive
#' @export rbm.plot
#' @examples
#' rbm.plot(abs(rt(1000, df = 3)))
rbm.plot = function (data_array) {
  rbm_obj = rbm(data_array);
  plot (log(rbm_obj$K), rbm_obj$GammaRBM, type="l", xlab="log k", ylab="gamma");
  opt_idx = which.min(rbm_obj$Risk);
  points (log(rbm_obj$K[opt_idx]), rbm_obj$GammaRBM[opt_idx], col=2, pch = 16);

  par(fg = "red");
  errbar (log(rbm_obj$K[opt_idx]), rbm_obj$GammaRBM[opt_idx],
    rbm_obj$GammaRBM[opt_idx]*(1 + 1/sqrt(rbm_obj$K[opt_idx])),
    rbm_obj$GammaRBM[opt_idx]*(1 - 1/sqrt(rbm_obj$K[opt_idx])),
    col=2, pch = 15, add=TRUE);
  par(fg = "black");
}