function [x,jar]=GATSP2(xy,pop_size,num_iter)
[N,dims]=size(xy);

jarkot=pdist(xy);
dmat=squareform(jarkot);

[nr,nc]=size(dmat);
n=N;

pop_size=4*ceil(pop_size/4);

pop=zeros(pop_size,n);
for k=1:pop_size
    pop(k,:)=randperm(n);
end

global_min=inf;
total_dist=zeros(1,pop_size);
dist_history=zeros(1,num_iter);
tmp_pop=zeros(4,n);
new_pop=zeros(pop_size,n);

for iter=1:num_iter
    for p=1:pop_size
    d=dmat(pop(p,n),pop(p,1));
        for k=2:n
            d=d+dmat(pop(p,k-1),pop(p,k));
        end
        total_dist(p)=d;
    end
    [min_dist,idk]=min(total_dist);
    dist_hitory(iter)=min_dist;
    if min_dist<global_min
        global_min=min_dist;
        rutebest=pop(idk,:);
    end
    
    rand_pair=randperm(pop_size);
    
    for p=4:4:pop_size
        rutes=pop(rand_pair(p-3:p),:);
        dists=total_dist(rand_pair(p-3:p));
        [ignore,idx]=min(dists);
        best_of_4_rute=rutes(idx,:);
        ins_pts=sort(ceil(n*rand(1,2)));
        I=ins_pts(1);
        J=ins_pts(2);
        for k=1:4
            tmp_pop(k,:)=best_of_4_rute;
            switch k
                case 2
                    tmp_pop(k,I:J);
                    fliplr(tmp_pop(k,I:J));
                case 3
                    tmp_pop(k,[I J]);
                    tmp_pop(k,[J I]);
                case 4
                    tmp_pop(k,I:J);
                    tmp_pop(k,I:J);
                otherwise
            end
            
        end
        new_pop(p-3:p,:)=tmp_pop;
    end
    pop=new_pop;
end
   x=rutebest;
   jar=min_dist
        
