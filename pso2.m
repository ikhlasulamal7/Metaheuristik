function [xbest,fbest]=pso2(N,LB,UB,maxit)
c1=1;
c2=1;
f=zeros(N,1);

for i=1:N
    x(i,:)=LB+rand(1,2).*(UB-LB);
    f(i)=feval('himmel',x(i,:));
end

pbest=x;
[fmin,idk]=min(f);
gbest=pbest(idk,:);
fbest=f;
v=ones(N,2);

for i=1:maxit;
    rho=0.9-((0.9-0.4)/maxit)*i
    for j=1:N
    v(j,:)=rho.*v(j,:)+c1.*rand(1,2).*(pbest(j,:)-x(j,:))+c2.*rand(1,2).*(gbest-x(j,:));
    x(j,:)=x(j,:)+v(j,:);
    f(j)=feval('himmel',x(j,:));
    end
    fm=f<fbest
    fbest=fm.*f+(1-fm).*fbest;
    pbest=repmat(fm,1,2).*x+repmat((1-fm),1,2).*pbest;
    [fmin,idk]=min(fbest);
    gbest=pbest(idk,:);
end
xbest=gbest;
fbest=fmin;
