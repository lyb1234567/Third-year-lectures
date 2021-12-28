%Parameter from Parameter table
Pkc=0.1995262315;
Pth1=10*10^(-6);
Pmax=0.1995262315;
Tmin=2;

%Noise
N0=1*10^(-13);
N1=1*10^(-13);

%Generate the system model
[D2D,CUE]=system_model(10,10,20);
% test_plot_model(D2D,CUE);
%Prematching
[Sid,InfD,EhaD,h_D2D,h_C_D2D]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,20);

%Remove the CUE whose coordinate is (0,0), which means that it will not be
%paired with corresponding D2D link i
% for i=1:size(Sid,1)
%     temp=Sid{i,1};
%     index=[];
%     for k=1:size(temp,1)
%         if temp(k,1)==0 && temp(k,2)==0
%             index(end+1)=k;
%         end
%     end
%     temp(index,:)=[];
%     Sid{i,1}=temp;
% end
% h12=h_C_D2D(1,2);
% h1=h_D2D(1);
% P12R=h1*Pmax+Pkc*h12+N0;
% Pth=[10 100 230.06 57368]*10^(-6);
% a=find_Nmax(Pth,P12R);

