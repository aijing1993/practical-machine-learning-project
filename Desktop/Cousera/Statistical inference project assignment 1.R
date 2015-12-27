library(ggplot2)
#Simulating exponential distribution
set.seed(876)
nsim=1000;n=40;lambda=0.2
means=NULL
for(i in 1:nsim) means=c(means,mean(rexp(n,lambda)))
hist(means,col="yellow",main="Distribution of Means of 40 Exponentials")
#Sample means vs Theoretical means
Sample_mean=mean(means);Theoretical_mean=1/lambda
print(c(Sample_mean,Theoretical_mean))
#Sample variance vs Theoretical Variance
Sample_variance=var(means)
Theoretical_variance=((1/lambda)^2)/n
print(c(Sample_variance,Theoretical_variance))
#Comparing to normal distribution
g<-ggplot(data.frame(means),aes(x=means))
g<-g+geom_histogram(binwidth=0.2,aes(y=..density..),colour="black",fill="blue")
g<-g+labs(x="means",y="Density")
g<-g+stat_function(fun=dnorm,args=list(mean=Theoretical_mean, sd=sqrt(Theoretical_variance)),color = "red", size = 1.0)
g<-g+stat_function(fun=dnorm,args=list(mean=Sample_mean,sd=sqrt(Sample_variance)),color="black",size=1.0)
g
#Increase simulating numbers to a large number


