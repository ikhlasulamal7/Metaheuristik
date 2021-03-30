function [xbest,fbest]=pso1(N,LB,UB,maxit)

c1=1;
c2=1;
x=LB+rand(N,1)*(UB-LB);
f=zeros(N,1);

for i=1:N
    f(i)=(100-x(i))^2;
end
pbest=x;
[fmin,idk]=min(f);
gbest=pbest(idk);
fbest=f;
v=ones(N,1);

for i=1:maxit;
    rho=0.9-((0.9-0.4)/maxit)*i
    for j=1:N
    v(j)=rho*v(j)+c1*rand*(pbest(j)-x(j))+c2*rand*(gbest-x(j));
    x(j)=x(j)+v(j);
    f(j)=(100-x(j))^2;
    end
    fm=f<fbest
    fbest=fm.*f+(1-fm).*fbest;
    pbest=fm.*x+(1-fm).*pbest;
    [fmin,idk]=min(fbest);
    gbest=pbest(idk);
end
xbest=gbest;
fbest=fmin;
