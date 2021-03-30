function [xopt,it]=cefungsi(N,mu,sig,fname)
rho=0.25;
L=length(mu);
alpha=0.8;
epsilon=1;
stot=[];
it=1;
while sig>epsilon
    for i=1:N
        x(i,:)=mu+sig.*randn(1,L);
        S(i)=feval(fname,x(i,:));
    end
    x
    S
    [S,I]=sort(S,'descend')
    f=S(end)
    stot=[stot;f]
    for i=1:L
        mu(:,i)=alpha*mean(x((I((1-rho)*N:N)),i))+(1-alpha)*mu(:,i);
        sig(:,i)=alpha*std(x((I((1-rho)*N:N)),i))+(1-alpha)*sig(:,i);
    end
    mu
    sig
    it=it+1;
end
xopt=mu;
it=it;
    