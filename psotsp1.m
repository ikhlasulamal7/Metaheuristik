function [rutebest,fbest]=psotsp1(N,maxiter,matrikjarak)

c1=1;
c2=1;
D=length(matrikjarak);
x=zeros(N,D);
hasil=[];
f=zeros(N,1);
for i=1:N
x(i,:)=rand(1,D);
[~,idk]=sort(x(i,:));
rute=idk;
rutet=[rute rute(:,1)];
f(i)=jartsp(rutet,matrikjarak);    
end
pbest=x;
[minf,idk]=min(f);
gbest=x(idk,:);
fbest=f;
v=0.1*ones(N,D);
rhomax=0.9;rhomin=0.1;
for it=1:maxiter
    rho=rhomax-(rhomax-rhomin)*it/(maxiter);
    v=rho*v+c1*rand.*(pbest-x)+c2*rand.*(repmat(gbest,N,1)-x);
    x=x+v;
    for i=1:N
        [hasilurut,idk]=sort(x(i,:));
        rute=idk;
        rutet=[rute rute(:,1)];
        f(i)=jartsp(rutet,matrikjarak);
    end
    changerow=f<fbest;
    pbest=pbest.*repmat((1-changerow),1,D)+x.*repmat(changerow,1,D);
    fbest=fbest.*(1-changerow)+f.*changerow;
    [minf,idk]=min(fbest);
    gbest=pbest(idk,:);
    hasil=[hasil; minf];
end
[hasilurut,idk]=sort(gbest);
rutebest=idk;
fbest=minf;
plot(hasil);
end
