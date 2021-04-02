function [total,c] = ttl(a)
c=length(a);
total=0
for i=1:c
    total=total+a(i);
end 