function penalti=pentwt(x1,px,dx,wx)
%fungsi tsp
%input:
    %x1=rute pekerjaan
    %dx=deadline pekerjaan
    %px=processing time
    %wx=Weight
%output:
    %penalti  =  total weighted tardiness
c=length(x1);
tpx=0; %total processing time
tpen=0; %total penalti
pen=0; %penalti awal
for i=1:c
    tpx=tpx+px(x1(i));
    if tpx>dx(x1(i))
        pen=wx(x1(i))*(tpx-dx(x1(i)));
    end
    tpen=tpen+pen;
    pen=0;
end
penalti=tpen;