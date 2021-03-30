function jarak=jartsp(x1,dx)
%fungsi tsp
%input:
    %x1=rute tsp (contoh:  1 2 3 4 5 1, 1=kota asal, 235=kota tujuan
    %dx=matrik jarak rute  tsp
%output:
    %jarak  =  jadxrak total rute tsp

c=length(x1);
k=c-1;  %jumlah kota dalam rute  tsp
s=0;    %jarak/posisi awal di kota pertama
for j=1:k
    s=s+dx(x1(j),x1(j+1));%pengakumulasian jarak rute tsp
end
jarak=s;