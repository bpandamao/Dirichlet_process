# stick-breaking process
# target:returns pi(weights) theta

# n--k group
# alpha the scale parameter of DP process
# H-> gussian
hfr=function(n)
{
    out=rnorm(n) 
    return(out)
}

# out->pi:weights drawn from the stick-breaking process
# theta -> sampling from H

# Example:
# SBgenerate(n=10,alpha=3,H=hfr)
#               [,1]      [,2]       [,3]      [,4]      [,5]       [,6]      [,7]        [,8]         [,9]     [,10]
#   pi     0.01875315 0.1463867  0.1427548 0.2474484 0.1678510  0.0529528 0.1013868  0.04031811  0.009175294 0.0115453
#   thetas 0.55602329 0.5705367 -1.3318886 1.2398157 0.8951297 -0.7017396 0.3008387 -1.25765785 -0.231572127 1.2880064

SBgenerate=function(n,alpha,H)
{
    #weights
    
    betas=rbeta(n,1,alpha)
    remain_stick=c(1,cumprod(1-betas))[1:n]
    pi=betas*remain_stick
    
    #sampling thetas
    thetas = H(n)
    
    out=rbind(pi,thetas)
    
    return(out)
}

SBgenerate_weights=function(n,alpha)
{
    #weights
    
    betas=rbeta(n,1,alpha)
    remain_stick=c(1,cumprod(1-betas))[1:n]
    pi=betas*remain_stick
    
    
    return(pi)
}
