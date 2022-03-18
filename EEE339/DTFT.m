sampling_frequency=200;                   % sampling frequency
sampling_interval=1/200;                  % sampling interval
t1 = 0:sampling_interval:0.1;             % Time vector
x1 = sin(2*pi*90*t1);                     % Signal

t2=linspace(0,0.1,1000);
x2 = sin(2*pi*90*t2);
figure
stem(t1,x1,'ro-');                        % plot smapled signal in time domain
hold on
plot(t2,x2,'b')                           % plot the original signal

xlabel('t');
ylabel('X');

w = linspace(-2*pi, 2*pi, 800);

X_deft=[];
for n=1:size(w,2)
    X_deft_array=[];
    for p=1:size(x1,2)
        X_deft_array(end+1)=exp(-i*w(n)*(p-1))*x1(p);
    end
    X_deft(end+1)=sum(X_deft_array);
end
figure
plot(w,abs(X_deft));
hold on

P=8;
X_Dft=fft(x1);
plot(w,abs(X_Dft));
xlabel('\omega');
ylabel('|X(j\omega)|');
