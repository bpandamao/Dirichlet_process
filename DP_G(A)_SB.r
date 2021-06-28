# random partition G(A)
# sampling G -> construct G(A) -> compare mean & var
# assume H is gaussian
init_parts =c(seq(-3,3,2))
max_weights = 0.7
N_Iter=1000
n=20
alpha=3

# create random set of partitions
r_parts_bounds=t(rbind(init_parts[1:length(init_parts)-1],init_parts[-1]))
runifdgenerate=function(A)
{
  out=array()
  for(i in 1:nrow(A))
  {
    out[i]=runif(1,A[i,1],A[i,2])
  }
  return(out)
}
r_parts=runifdgenerate(r_parts_bounds)
P=length(r_parts)
mean_weights = matrix(rep(0),N_Iter, P + 1)

#G(A) theretical mean&var

# theretical mean from CDF
# p prob
p=pnorm(r_parts)
cdf_regions=c(p,1)-c(0,p)

theory_mean = cdf_regions

# theretical variances
theory_variance = theory_mean * (1 - theory_mean) / (alpha + 1)

#group function
groupf=function(x,bound)
    {
        if (x>=max(bound))
        {
            group=length(bound)+1
        } else
        {
            group=min(which(bound>x))
        }
        return(group)
    }

for (i in 1:N_Iter)
{
    #sample G~ DP(alpha,H)
    Ginform=SBgenerate(n,alpha,hfr)
    pi=Ginform[1,]
    thetas=Ginform[2,]

    #thetas partitions
    w_region=sapply(thetas,groupf,r_parts)
    
    #G
    gsample=t(rbind(Ginform,w_region))
    w_region=as.factor(w_region)
    mean_weight=tapply(gsample[,1],w_region,sum)
    
    for (j in 1:(P+1))
    {
      a=toString(j)
      if (is.na(mean_weight[a]))
      {
        mean_weights[i,j]=0
      } else
      {
        mean_weights[i,j]=mean_weight[[a]]
      }
    }
}

## G(A) sample mean&var

apply(mean_weights,2,mean)
apply(mean_weights,2,var)
