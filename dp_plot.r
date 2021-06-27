library(ggplot2)
library(reshape)

# SBgenerate

SBgenerate_plots = function(num_weights, alpha) {
  x1 = SBgenerate_weights(num_weights, alpha)
  x2 = SBgenerate_weights(num_weights, alpha)
  x3 = SBgenerate_weights(num_weights, alpha)
  x4 = SBgenerate_weights(num_weights, alpha)
  x5 = SBgenerate_weights(num_weights, alpha)
  
  d1 = data.frame(x = 1:num_weights, weight = x1, type = "run #1")
  d2 = data.frame(x = 1:num_weights, weight = x2, type = "run #2")
  d3 = data.frame(x = 1:num_weights, weight = x3, type = "run #3")
  d4 = data.frame(x = 1:num_weights, weight = x4, type = "run #4")
  d5 = data.frame(x = 1:num_weights, weight = x5, type = "run #5")        
  d = rbind(d1, d2, d3, d4, d5)
  
  qplot(x = x, weight = weight ,data = d, geom = "bar", xlab = "Stick", ylab = "Weight", main = paste("Stick-Breaking Process with alpha =", alpha), ylim = c(0, 1)) + scale_x_continuous(breaks = 1:num_weights) + facet_grid( . ~ type )
}

SBgenerate_plots(10, 5)