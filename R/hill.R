#' Hill estimator
#'
#' Hill estimator for tail index estimation, provided as a baseline
#'
#' @param data_array the raw data, assumed to be positive
#' @param idx Hill tuning parameter
#' @export hill
hill = function(data_array, idx = 1:(length(logsorted) - 1)) {
  useable_data = data_array[data_array > 0];
  n <- length(useable_data)
  logsorted = log(sort(useable_data));
  gammaH = rep(0, length(idx));
  for (iter in 1:length(idx))
  {
    k = idx[iter];
    gammaH[iter] = mean (logsorted[(n - k + 1) : n]) - logsorted[n - k];
  }
  return (data.frame(K=idx, GammaHill=gammaH));
}
