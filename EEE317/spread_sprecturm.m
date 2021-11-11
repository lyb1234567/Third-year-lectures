%Direct sequence SS
A=[1 -1 -1 1 1 -1 1 -1 1 1 1 1 -1 -1 -1];
[m,n]=size(A);
t1=[];
a=0;
for i=1:n
    t1(end+1)=a;
    a=a+0.5;
end
subplot(3,1,1);
plot(t1,A);
xlabel('t1');
title('c(t)')
B=[1 1 1 1 1 1 1 1 -1 -1 -1 -1 -1 -1 -1 ];
t2=[];
[x,y]=size(B);
b=0;
for j=1:y
    t2(end+1)=b;
    b=b+0.5;
end
subplot(3,1,2);
plot(t2,B);
xlabel('t2');
title('g(t)')

C=A.*B;
[column,r]=size(C);
t3=[];
c=0;
for p=1:r
    t3(end+1)=c;
    c=c+0.5;
end
subplot(3,1,3);
plot(t3,C);
xlabel('t3');
title('g(t)*c(t)')