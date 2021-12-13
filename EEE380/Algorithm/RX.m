function [RX_x,RX_y]=RX(x,y,distance)
a=randperm(400,1)-200;
b=randperm(400,1)-200;
dist=hypot(x-a,y-b);
while dist~=distance || a>200||a<-200 || b>200 ||b<-200
    a=randperm(400,1)-200;
    b=randperm(400,1)-200;
    dist=hypot(x-a,y-b);
end
RX_x=a;
RX_y=b;
end
