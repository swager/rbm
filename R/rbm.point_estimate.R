#' Get point estimate for Gamma
#'
#' Uses RBM to get a point estimate for the
#' tail index Gamma.
#'
#' @param data_array the raw data, assumed to be positive
#' @return A tuple: K -- the optimal tuning parameter chosen by RBM, Gamma -- the tail index estimate, Stdv -- a standard error estimate for Gamma
#' @export rbm.point_estimate
#' @examples
#' rbm.point_estimate(abs(rt(1000, df = 3)))
rbm.point_estimate = function(data_array) {
  rbm_obj = rbm(data_array);
  opt_idx = which.min(rbm_obj$Risk);
  return(c(
    K=rbm_obj$K[opt_idx],
    Gamma=rbm_obj$GammaRBM[opt_idx],
    Stdv=sqrt(rbm_obj$GammaRBM[opt_idx]^2/rbm_obj$K[opt_idx])
  ));
}
