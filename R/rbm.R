#' rbm
#'
#' Computes the RBM estimator along the tuning path.
#'
#' @param data_array the raw data (should be positive)
#' @param CUTOFF the acceptable rounding error
#' @export rbm
rbm = function(data_array, CUTOFF = 10^(-9)) {

  useable_data = data_array[data_array > 0];
  logsorted = log(sort(useable_data));
  indices = 1:(floor(length(logsorted)/2));

  n = length(logsorted);
  max_arr = rep(0, length(indices));

  for (j in 1:length(indices)) {
    sz = indices[j];

    min_idx = max(floor(CUTOFF^(1/sz)*n), sz);
    zero_weights = rep(0, min_idx - 1);
    non_zero_weights = sapply(min_idx:n, function(m)(sz*exp(lfactorial(m - 1) - lfactorial(m - sz) - lfactorial(n) + lfactorial(n - sz))));
    non_zero_weights = non_zero_weights/sum(non_zero_weights);
    weight = c(zero_weights, non_zero_weights);

    max_sz = sum(weight*logsorted)/sum(weight);
    max_arr[j] = max_sz;
  }
  block_info = data.frame(BlockSize=indices, MeanLogMax=max_arr);

  l = length(block_info$BlockSize);
  difference = (block_info$MeanLogMax[-1] - block_info$MeanLogMax[-l]);
  index_gap = (block_info$BlockSize[-1] - block_info$BlockSize[-l]);
  block_size = block_info$BlockSize[-1];

  len = length(block_size);
  k = 2*n/block_size;  # Effective k
  gh_arr = block_size*difference/index_gap; # Estimate for Gamma

  gh_diff = c(k[-1]*(gh_arr[-1] - gh_arr[-len])/(k[-1] - k[-len]), NaN);
  bayes_bias = gh_diff^2 + 0.5*gh_arr^2/k; # Empirical Bayes estimate of squared bias

  return (data.frame(BlockSize=block_size, K=k, GammaRBM=gh_arr, Risk=bayes_bias));
}