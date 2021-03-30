function [xbest, fbest]=GAsort(N,LB,UB,maxiter,fname)
f=zeros(N,1);
L=length(LB);
x=zeros(N,L);
for i=1:N
    x(i,:)=LB+rand(1,L).*(UB-LB);
    f(i)=feval(fname,x(i,:));
end

[minf,idx]=min(f);
xbest=x(idx,:);
it=1;
while it<maxiter
    xs=x;
    [nilf,idk]=sort(f);
    F=1./f;
    if mod(N,2)==0
        IterasiMulai=5;
        for j=N-3:N
        xs(idk(j),:)=xbest;
        end
    else
        IterasiMulai=4;
        for j=N-2:N
        xs(idk(j),:)=xbest;
        end
    end
    for j=IterasiMulai:2:N,
        parent1=seleksi(x,F);
        parent2=seleksi(x,F);
        lambda=rand;
        cr=0.6;
        c1=lambda*parent1+(1-lambda)*parent2;
        c2=(1-lambda)*parent1+lambda*parent2;
        if rand<cr
            xs(j,:)=c1;
            xs(j+1,:)=c2;
        else
            xs(j,:)=parent1;
            xs(j+1,:)=parent2;
        end
    end
    for i=ceil(0.1*N)
        kk=ceil(rand*N);
        xs(kk,:)=LB+rand(1,L).*(UB-LB);
    end
    
    for i=1:N
        f(i)=feval(fname,xs(i,:));
    end
    
    [minf,idx]=min(f);
    xbest=xs(idx,:);
    x=xs;
    it=it+1;
end
xbest=xbest;
fbest=minf;

function p=seleksi(x,F)
cumF=cumsum(F);
ncumF=cumF/cumF(end);
z=rand<ncumF;
k=find(z);
p=x(k(1),:);

        