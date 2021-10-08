### Tutorial 2

1.Find the radius of convergence of series

(i):$1+\frac{z}{1!}+\frac{z^{2}}{2!}+\frac{z^{3}}{3!}+\dots=\sum_{n=0}^{n=\infty}\frac{z^{n}}{n!}$

$z_{n}=\frac{z^{n}}{n!}$

$z_{n+1}=\frac{z^{n+1}}{(n+1)!}$

$L=\lim_{n \to \infty}\frac{z_{n+1}}{z_{n}}=lim_{n \to \infty}\frac{z}{n}=0$

so $\rho=\infty$



(2):$1+2^{2}z+3^{2}z^{2}+4^{2}z^{3}=\sum_{n=1}^{n=\infty}n^{2}z^{n-1}$

$z_{n}=n^{2}z^{n-1}$

$z_{n+1}=(n+1)^{2}z^{n}$

$L=|\lim_{n \to -\infty} \frac{z_{n+1}}{z_{n}}|=\lim_{n \to -\infty}|z(\frac{n+1}{n})^{2}|=|z^{2}|<1$

so $\rho=1$



(3):$1-\frac{z}{2}+\frac{z^{2}}{3}-\frac{z^{3}}{4}+\dots=\sum_{n=0}^{n=\infty}(-1)^{n}\frac{z^{n}}{n+1}$

$z_{n}=(-1)^{n}\frac{z^{n}}{n+1}$

$z_{n+1}=(-1)^{n+1}\frac{z^{n+1}}{n+2}$

$L=|\lim_{n \to -\infty} \frac{z_{n+1}}{z_{n}}|=\lim_{n \to \infty}|(-1)\frac{n+2}{n+1}z|=|z|<1$

$\rho=1$



(4):$1+1!z+2!z^{2}+3!z^{3}+\dots=\sum_{n=1}^{n=\infty}n!(z^{n})$

$z_{n}=n!(z^{n})$

$z_{n+1}=(n+1)!(z^{n+1})$

$L=|\lim_{n \to -\infty} \frac{z_{n+1}}{z_{n}}|=\lim_{n \to \infty}|nz|=\infty$

$\rho=0$



2.

(1):

$z_{n}=\sum_{n=1}^{n=\infty}=\frac{(z+2)^{n-1}}{(n+1)^{3}4^{n}}$

$z_{n+1}=\sum_{n=1}^{n=\infty}=\frac{(z+2)^{n}}{(n+2)^{3}4^{n+1}}$

$L=\lim_{n \to \infty}|\frac{1}{4}(z+2)(\frac{n+1}{n+2})^{3}|=|\frac{1}{4}(z+2)|<1$

so $\rho=4$ the region will be $|z+2|<4$



(2):

$z_{n}=\sum_{n=1}^{n=\infty}\frac{(-1)^{n-1}z^{2n-1}}{(2n-1)!}$

$z_{n+1}=\sum_{n=1}^{n=\infty}\frac{(-1)^{n}z^{2n+3}}{(2n+1)!}$

$L=\lim_{n \to \infty}|\frac{z_{n+1}}{z_{n}}|=\lim_{n \to \infty}|\frac{z^{4}}{(2n+1)(2n)}=0|$

So $\rho=\infty$ the region will be $|z|<\infty$





(5):

**Geometric series**
$$
\frac{1}{1-z}=\big\{_{-\sum_{n=1}^{\infty}\frac{1}{z^{n}},|z|>1}^{\sum_{n=0}^{\infty}z^{n}, |z|<1}
$$
Back to the question

(1)$\frac{1}{1+z}=\frac{1}{1+2i+z-2i}=\frac{1}{(1+2i)(1-\frac{2i-z}{1+2i})}=\frac{1}{1+2i}*\frac{1}{1-\frac{2i-z}{1+2i})}$

=$\frac{1}{1+2i}\sum_{n=0}^{n=\infty}(-1)^{n}(\frac{z-2i}{1+2i})^{n}$



(2):
