# CRP process
# target: returns an array of the table of every customer 

# Examples
#
#   chinese_restaurant_process(n = 5, alpha = 1)=[1, 2, 3, 4, 3]

chinese_restaurant_process=function(n,alpha)
{
    out=array()
    k=0
    table=array()
    for(i in 1:n)
    {   
        if(i==1)
        {
            k=k+1
            out[i]=k
            table[k]=1
        } else
        {
            z=array(rep(0,k))
            z=table/(alpha+i-1)
            z[k+1]=alpha/(alpha+i-1)
            zr= rmultinom(1, 1, prob=z)
            if(zr[k+1]==1)
            { 
                k=k+1
                out[i]=k
                table[k]=1
            } else
            {
                j=which.max(zr)
                out[i]=j
                table[j]=table[j]+1
            }
        }
    }
    return(out)
}

zt=chinese_restaurant_process(n = 100, alpha = 10)
