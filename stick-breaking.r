# stick-breaking process
# target:returns pi(weights) theta

# n--iteration
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
# 
#
#

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

SBgenerate(30,3,hfr)