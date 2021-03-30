function [rutebest,fbest]=aco_TSP1(matrikjar, iter, n_ants)
m=n_ants;
n=length(matrikjar);
e=.6;
alpha=1;
beta=1;
thoinit=.1*ones(n)
hasil=[];
for i=1:iter

    for i=1:m
    rute(i,1)=1;
    end

    h=1./matrikjar
    for i=1:m
        mh=h;
        for j=1:n-1
            c=rute(i,j);
            mh(:,c)=0;
            tho=(thoinit(c,:).^alpha).*(mh(c,:).^beta);
            s=(sum(tho))
            p=1/s*tho
            r=rand;
            s=0;
            for k=1:n
                s=s+p(k)
                if r<=s
                   rute(i,j+1)=k
                   break
                end
            end
         end
    end
    rute;
    rute_c=horzcat(rute,rute(:,1));
    for i=1:m
        f(i)=jartsp(rute_c(i,:),matrikjar);
    end
    jaraktot=f;
    [minf,idk]=min(f);
    ter=rute_c(idk,:);
    fbest=min(f);
    thoinit=e*thoinit;
    for i=1:m
        for j=1:n
            dt=1/f(i);
            thoinit(rute_c(i,j),rute_c(i,j+1))=thoinit(rute_c(i,j),rute_c(i,j+1))+dt;
        end
    end
    hasil=[hasil,fbest];
end
rutebest=ter
fbest=fbest
        