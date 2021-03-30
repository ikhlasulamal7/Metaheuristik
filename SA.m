function [xbest,fbest]=SA(fname,maxiter)
c=0.8;
LB=[-3 -3];
UB=[3 3];
D=2
for i=1:10
    x(i,:)=LB+rand(1,D).*(UB-LB);
    f(i)=feval(fname,x(i,:));
end
T=mean(f);
x=LB+rand(1,D).*(UB-LB);
f=feval(fname,x);
fbest=f;
it=1;
hasil=[]
while T>=1e-8
    s=randperm(2);
    xnew=x+(randn(1,2)/100).*(s==1);
    for i=1:2
        if xnew(i)>=UB(i)
            xnew(i)=UB(i);
        end
        if xnew(i)<=LB(i)
            xnew(i)=LB(i);
        end
    end
    f=feval(fname,xnew);
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
    hasil=[hasil;x fbest];
end
xbest=x;
fbest=fbest;