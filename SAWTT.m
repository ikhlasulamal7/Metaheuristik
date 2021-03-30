function [xbest,fbest]=SAWTT(px,dx,wx,maxiter,c)
n=length(px);
%x=zeros(1,n);
for i=1:20
    x(i,:)=randperm(n);
    f(i)=pentwt(x(i,:),px,dx,wx);
end
T=mean(f);
[minD,idx]=min(f);
x=x(idx,:);
%randperm(n);
rute=x;
f=pentwt(rute,px,dx,wx);
fbest=f;
it=1;
while T>1e-8
    xnew=x;
    ins_pts=sort(ceil(n.*rand(1,2)));
    I=ins_pts(1);
    J=ins_pts(2);
    r=rand;
    if r<.333
        xnew(I:J)=fliplr(x(I:J));
        %flip
    elseif r<.667
        xnew([I J])=x([J I]);
        %swap
    else
        xnew(I:J)=x([I+1:J I]);
        %slide
    end
    rute=[xnew];
    f=pentwt(rute,px,dx,wx);
    if f<fbest
        fbest=f;
        x=xnew;
    else
        deltaf=f-fbest;
        PE=exp(-deltaf/T);
        if rand<PE
            x=xnew;
            fbest=f;
        end
    end
    it=it+1;
    if it==maxiter
        T=c*T;
        it=1;
    end
end
xbest=xnew;
fbest=fbest
