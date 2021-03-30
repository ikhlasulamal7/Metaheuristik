function [xbest,fbest]=DE(N,fname,LB, UB, maxit)
F=0.8;
Ce=0.6;
D=length(LB);
f=zeros(N,1);
fu=zeros(N,1);
for i=1:N
    x(i,:)=LB+rand(1,D).*(UB-LB);
    f(i)=feval(fname,x(i,:));
end
%mutation step
for it=1:maxit
    for i=1:N
        r=randperm(N);
        r0=r(1);r1=r(2);r2=r(3);
        v(i,:)=x(r0,:)*F*(x(r1,:)-x(r2,:));
        for j=1:D
            if v(i,j)<=LB(j)
                v(i,j)=LB(j);
            end
            if v(i,j)>=UB(j)
                v(i,j)=UB(j);
            end
        end
            %recombination
            if rand<cr
                u(i,:)=v(i,:);
                fu(i)=feval(fname,u(i,:));
                if fu(i)<f(i)
                    x(i,:)=u(i,:);
                    f(i)=fu(i);
                end
            end
        end
    end
    [minf,idx]=min(f);
    xbest=x(idx,:);
    fbest=minf;
            