function [rutebest,fbest]=aco_SMTWT(px,dx,wx, iter, n_ants)
m=n_ants;
n=length(px);
e=.6;
alpha=2;
beta=1;
thoinit=.1*ones(1,n);
hasil=[];
for i=1:iter

    for i=1:m
    rute(i,1)=2;
    end

    h=1./px;
    for i=1:m
        mh=h;
        for j=1:n-1
            c=rute(i,j);
            mh(:,c)=0;
            tho=(thoinit(1,:).^alpha).*(mh(1,:).^beta);
            s=(sum(tho));
            p=1/s*tho;
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
    rute_c=horzcat(rute);
    for i=1:m
        f(i)=pentwt(rute_c(i,:),px,dx,wx);
    end
    jaraktot=f;
    [minf,idk]=min(f);
    ter=rute_c(idk,:);
    fbest=min(f);
    thoinit=e*thoinit
    for i=1:m
        for j=1:n-1
            dt=1/f(i);
            thoinit(rute_c(i,j))=thoinit(rute_c(i,j))+dt;
        end
    end
    hasil=[hasil,fbest];
end
rutebest=ter
fbest=fbest
plot(hasil)
        