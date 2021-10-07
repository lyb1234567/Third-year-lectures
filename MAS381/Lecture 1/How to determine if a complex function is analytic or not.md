### How to determine if a complex function is analytic or not?

- The four derivatives of its real and imaginary parts have to satisfy Cauchy-Riemann equations.

- A complex function f(z) is called analytic at a point z0 ∈ C if it has a power series expansion, which means that you can find a  Taylor expansion for this complex function at a certain point.

  if f(z) and g(z) are both analytic, then we can say sum f(z)+g(z), f(z)g(z), f(z)/g(z) where $g(z_{0}\neq 0)$
  $$
  \sum_{n=0}^{\infty}\frac{f^{(n)}(a)}{n!}(x-a)^{n}
  $$
  For example, if we have a complex function $f(z)=\frac{1}{z^{2}+1}$ and we want to find it Taylor expansion about 0:
  $$
  f(z)=\frac{1}{z^{2}+1}=1-z^{2}+z^{4}-z^{6}+\dots=\sum^{\infty}_{n=0}(-1)^{n}z^{2n}
  $$
  And we can find its convergence limit L:
  $$
  L=\lim_{n\rightarrow \infty}|\frac{(-1)^{n+1}z^{2n+2}}{(-1)^{n}z^{2n}}|=|z|^{2}=(x^{2}+y^{2})
  $$
  It is obviously a circle and its radius $\rho$ is 1 which means this complex function is analytic in the region where the distance $|z-0|<1$.

  What if we want to expand the function into another Taylor series, for example $z_{0}=1+2i$ , that means our final limit L is :$|z-z_{0}|<1$.  

