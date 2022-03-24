sampling_frequency=250;                   % sampling frequency
sampling_interval=1/250;                  % sampling interval
t1 = 0:sampling_interval:0.1;             % Time vector
x1 = cos(2*pi*90*t1);                     % Signal

t2=linspace(0,0.1,1000);
x2 = cos(2*pi*90*t2);
figure
stem(t1,x1,'ro-');                        % plot smapled signal in time domain
hold on
plot(t2,x2,'b')                           % plot the original signal

xlabel('t');
ylabel('X');

w = linspace(-2*pi, 2*pi, 1000);

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
xlabel('\omega');
ylabel('|X(j\omega)|');
P=26;
figure
w_k = (0:P-1) * (2*pi/P);
X_dft=fft(x1);
stem(w_k,abs(X_dft));

