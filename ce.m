function [xopt,it]=ce(N,mu,sig,fname)
rho=0.1;
L=length(mu)
alpha=0.8;
epsilon=0.0001;
stot=[];
it=1;
while sig>epsilon
    for i=1:N
    x(i,:)=mu+sig.*randn(1,L)
    end
    S=(100-x).^2
    [S,I]=sort(S,'descend')
    f=S(I(end))
    stot=[stot;f]
    mu=alpha*mean(x(I((1-rho)*N:N)))+(1-alpha)*mu
    sig=alpha*std(x(I((1-rho)*N:N)))+(1-alpha)*sig
    it=it+1
end
xopt=mu;
it=it;
    