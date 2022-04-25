% K=[10 20 30 40 50 100 200];
% sys1 = tf([0 0 2*K(1)],[2 12 20+2*K(1)]);
% sys2 =tf([0 0 2*K(2)],[2 12 20+2*K(2)]);
% h=stepplot(sys1,sys2,5);
% setoptions(h,'TimeUnits','seconds','Grid','on');

M = 8;
w = linspace(-2*pi, 2*pi, 800);
X_dtft = 1./(-j*w).*(exp(-j*w*(M-1))-1);

plot(w, abs(X_dtft))
title('|X(\omega)|')