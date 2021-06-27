library(ggplot2)
library(reshape)

# SBgenerate

SBgenerate_plots = function(num_thetas, alpha) 
{
  x1 = SBgenerate_weights(num_thetas, alpha)
  x2 = SBgenerate_weights(num_thetas, alpha)
  x3 = SBgenerate_weights(num_thetas, alpha)
  x4 = SBgenerate_weights(num_thetas, alpha)
  x5 = SBgenerate_weights(num_thetas, alpha)
  
  d1 = data.frame(x = 1:num_thetas, weight = x1, type = "run #1")
  d2 = data.frame(x = 1:num_thetas, weight = x2, type = "run #2")
  d3 = data.frame(x = 1:num_thetas, weight = x3, type = "run #3")
  d4 = data.frame(x = 1:num_thetas, weight = x4, type = "run #4")
  d5 = data.frame(x = 1:num_thetas, weight = x5, type = "run #5")        
  d = rbind(d1, d2, d3, d4, d5)
  
  qplot(x = x, weight = weight ,data = d, geom = "bar", xlab = "Stick", ylab = "Weight", main = paste("Stick-Breaking Process with alpha =", alpha), ylim = c(0, 1)) + scale_x_continuous(breaks = 1:num_thetas) + facet_grid( . ~ type )
}

SBgenerate_plots(10, 5)
SBgenerate_plots(10, 20)
SBgenerate_plots(20, 5)

## CRP

CRP_plots =function(num_customer,alpha1,alpha2,alpha3)
{
  x1 = chinese_restaurant_process(num_customer,alpha1)
  x2 = chinese_restaurant_process(num_customer,alpha2)
  x3 = chinese_restaurant_process(num_customer,alpha3)
  
  d1 = data.frame(x = x1, type = paste("alpha=",alpha1))
  d2 = data.frame(x = x2, type = paste("alpha=",alpha2))
  d3 = data.frame(x = x3, type = paste("alpha=",alpha3))
  d = rbind(d1, d2, d3)
  
  qplot(x = x ,data = d, geom = "histogram", xlab = "group", ylab = "number", main = "Chinese restaurant process with different alpha")+ scale_x_continuous(breaks = 1:num_customer) + facet_grid( . ~ type )
}

CRP_plots(100,3,10,20)
