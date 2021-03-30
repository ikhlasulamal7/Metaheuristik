function [besttour,mincost]=aco_TSP[(X, iter, n_ants)
m=n_ants;
n=length(X);
e=.6;
alpha=1;
beta=1;
thoinit=.1*ones(n);

%for i=1:iter
%e=0.7-

for i=1:m
rute(i,1)=1;
end

h=1./X;
for i=1:m
    mh=h;
    for j=1:n-1
        c=rute(i,j);
        mh(:,c)=0;
        tho=(thoinit(c,:).^alpha).*(mh(c,:).^beta);
        s=(sum(tho));
        p=1/s
        
        r=rand;
        s=0;
        for k=1:n
            s=s+p(k);
            if r<=s
                rute(i,j+1)=k;
                break
            end
        end
    end
end
rute;
rute_c=horzcat(rute,rute(:,1));
for i=1:m
    s=0;
    for j=1:n
    s=s+X(rute+c(i,j),rute_c(i,j+1);
    end
    f(i)=s;
end
jaraktot=f;
[minf,idk]=min(f)
ter=rute_c(idk,:);
thoinit=e*thoinit;
for i=1:m
    for j=1:n
        df=1/f(i);
        thoinit(rute_c(i,j),rute_c(i,j+1))=thoinit(rute_c(i,j),rute_c(i,j+1))+dt;
    end
end
end
besttour=ter
mincost=s
        