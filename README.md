# Dirichlet_process

The Dirichlet distribution is the conjugate prior distribution of the multinomial distribution. 
It is the inference basics of Bayesian Non Parametrics (BNP). 
Why is nonparametrics? 
Because the piror is a random measure with infinite mixture models(k>>0).
With the properties of Dirichlet distribution, we use Dirichlet Process(DP) to find the predictive distribution p(x_predict|x).

## Chinese restaurant process
the clustering property of the DP. It comes out with the group of each observation. 
An new observaton belongs to each group is equal to n_k(%%the number of each group)/(alpha+n-1), a new group k+1 with probability alpha/(alpha+n-1).
a similar clustering process is Indian Buffet Process(IBP)

use the function chinese_restaurant_process(n,alpha) can get the he table of every customer 

```
chinese_restaurant_process(n = 5, alpha = 1)=[1, 2, 3, 4, 3]
```


## stick-breaking Construction
to construct the random measure G. It comes out with each parameter and its weights.
For each group k, this gives a proportion pi of points that fall into group k.

use the function SBgenerate(n,alpha,H) can get the pi and thetas in the base measure H

```
# hfr is a gaussian random generate function
SBgenerate(10,3,hfr)
               [,1]      [,2]       [,3]      [,4]      [,5]       [,6]      [,7]        [,8]         [,9]     [,10]
   pi     0.01875315 0.1463867  0.1427548 0.2474484 0.1678510  0.0529528 0.1013868  0.04031811  0.009175294 0.0115453
   thetas 0.55602329 0.5705367 -1.3318886 1.2398157 0.8951297 -0.7017396 0.3008387 -1.25765785 -0.231572127 1.2880064
```


## the parameters 
Alpha is strength parameter, it influences the distribution of k(group) and the var of G. 

use function SBgenerate_plots can see the stick-breaking process

```
SBgenerate_plots (num_thetas, alpha)
```
use function CRP_plots can see the Chinese restaurant process
```
CRP_plots(num_customer,alpha1,alpha2,alpha3)
```


