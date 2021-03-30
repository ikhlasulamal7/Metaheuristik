function [xopt,it]=cecoba(N,mu,sig,fname)
rho=0.1;
L=length(mu);
alpha=0.8;
mu=repmat(mu,N,1);
epsilon=0.0001;
stot=[];
has=[];
it=1;
while sig>epsilon
    x=mu+sig.*randn(N,L);
    S=feval(fname);
    [S,I]=sort(S,'descend');
    has=[has;mu];
    f=S(I(end));
    stot=[stot;f];
    mu=alpha*mean(x(I((1-rho)*N:N)))+(1-alpha)*mu;
    sig=alpha*std(x(I((1-rho)*N:N)))+(1-alpha)*sig;
    it=it+1;
end
xopt=mu;
it=it;
    