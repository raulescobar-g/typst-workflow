#import "../../template.typ": *

#show: project.with(
  title: "A8-MATH411",
  authors: (
    (name: "Raul Escobar", email: "raulescobar_g@tamu.edu"),
  ),
  date: "March 22, 2023",
)

#heading[Problem 11 (textbook)]
#line(length: 100%)
== a)

== b)

== c)

= Problem 1
#line(length: 100%)
$
    Z &= X - mu/sigma \
$

$
    P(mu - sigma lt.eq X lt.eq mu + sigma) &= P(frac((mu - sigma) - mu,sigma) lt.eq frac(X-mu,sigma) lt.eq frac((mu + sigma) - mu,sigma) \
    &= P(-frac(sigma,sigma) lt.eq frac(X-mu,sigma) lt.eq frac(sigma,sigma)) \
    &= P(-1 lt.eq frac(X-mu,sigma) lt.eq 1) \
    &= P(-1 lt.eq Z lt.eq 1) \
    &= P(Z lt.eq 1) - P(Z lt.eq -1)
$

$ ans(&= 0.68...) $

Both intervals below follow exact same method as above:

$
    P(-2 lt.eq Z lt.eq 2) &= P(Z lt.eq 2) - P(Z lt.eq -2)
$
$
    ans(&= 0.95...)
$

$
    P(-3 lt.eq Z lt.eq 3) &= P(Z lt.eq 3) - P(Z lt.eq -3)
$
$
    ans(&= 0.997...)
$


= Problem 2
#line(length: 100%)
== a)
$
    f_X(x) = frac(1, sqrt(2pi) sigma) e^(-frac((x-mu)^2, 2sigma^2)) 
$
$
    1 &= integral_(-infinity)^infinity f_X(x) dif x \
    &= integral_(-infinity)^infinity frac(1, sqrt(2pi) sigma) e^(-frac((x-mu)^2, 2sigma^2)) dif x \
    &= frac(1, sqrt(2pi) sigma) integral_(-infinity)^infinity  e^(-frac((x-mu)^2, 2sigma^2)) dif x \
    u = frac(x-mu, sigma) & quad quad dif u = frac(1, sigma) dif x \
    &= frac(1, sqrt(2 pi)) integral_(-infinity)^infinity e^(-u^2/2) dif u \
$
We can assume that:
$
 integral_(-infinity)^infinity e^(-x^2/2) dif x = sqrt(2 pi) \
$
$
    &= frac(sqrt(2 pi), sqrt(2 pi)) \
    ans(1 &= 1)
$

== b)

$
    EE[X] &= integral_(-infinity)^infinity x f_X(x) dif x \
    &= integral_(-infinity)^infinity x frac(1, sqrt(2pi) sigma) e^(-frac((x-mu)^2, 2sigma^2))  dif x \
    &= frac(1, sqrt(2pi) sigma) integral_(-infinity)^infinity x e^(-frac((x-mu)^2, 2sigma^2))  dif x \
    u = (frac(x-mu, sqrt(2)sigma))^2 & quad quad dif u = frac(x-mu, sigma^2) dif x \
$
Now we have to modify our main function in order to be able to do u-sub:
$
    &= frac(sigma^2, sqrt(2pi) sigma) integral_(-infinity)^infinity (frac(x,sigma^2) e^(-frac((x-mu)^2, 2sigma^2)) - frac(mu,sigma^2) e^(-frac((x-mu)^2, 2sigma^2)) + frac(mu,sigma^2) e^(-frac((x-mu)^2, 2sigma^2)))  dif x \
    &= frac(sigma^2, sqrt(2pi) sigma) integral_(-infinity)^infinity (frac(x - mu,sigma^2) e^(-frac((x-mu)^2, 2sigma^2)) + frac(mu,sigma^2) e^(-frac((x-mu)^2, 2sigma^2)))  dif x \
    &= frac(sigma^2, sqrt(2pi) sigma) integral_(-infinity)^infinity frac(x - mu,sigma^2) e^(-frac((x-mu)^2, 2sigma^2)) dif x + frac(sigma^2, sqrt(2pi) sigma) integral_(-infinity)^infinity frac(mu,sigma^2) e^(-frac((x-mu)^2, 2sigma^2))  dif x \
    &= frac(sigma^2, sqrt(2pi) sigma) integral_(infinity)^infinity e^(-u) dif u + frac(sigma^2, sqrt(2pi) sigma) integral_(-infinity)^infinity frac(mu,sigma^2) e^(-frac((x-mu)^2, 2sigma^2))  dif x \
$
We have the same integral bounds for the first integral. This makes it zero so we can remove it:
$
    &=  frac(sigma^2, sqrt(2pi) sigma) integral_(-infinity)^infinity frac(mu,sigma^2) e^(-frac((x-mu)^2, 2sigma^2))  dif x \
    &=  mu (frac(1, sqrt(2pi) sigma) integral_(-infinity)^infinity e^(-frac((x-mu)^2, 2sigma^2))  dif x) \
    frac(1, sqrt(2pi) sigma) integral_(-infinity)^infinity e^(-frac((x-mu)^2, 2sigma^2))  dif x = 1 \
    ans(EE[X] = mu) \
$
Now to get the variance we can follow a similar pattern:
$
    "Var"[X] &= integral_(-infinity)^infinity x^2 f_X(x) dif x - mu^2 \
    &= integral_(-infinity)^infinity x^2 frac(1, sqrt(2pi) sigma) e^(-frac((x-mu)^2, 2sigma^2))  dif x - mu^2 \
    &= frac(1, sqrt(2pi) sigma) integral_(-infinity)^infinity x^2 e^(-frac((x-mu)^2, 2sigma^2))  dif x - mu^2 \
$
Some u-sub:
$    
    u = frac(x-mu, sigma)  quad quad dif u = frac(1, sigma) dif x \
    x^2 = (sigma u + mu)^2 \
    x^2 = sigma^2 u^2 + 2 sigma mu u + mu^2\
$
Substituting $x$ for $u$:
$
    &= frac(1, sqrt(2pi) sigma) integral_(-infinity)^infinity (sigma^2 u^2 + 2 sigma mu u + mu^2) e^(-frac(u^2,2))  dif u - mu^2 \
    &= frac(1, sqrt(2pi) sigma) integral_(-infinity)^infinity sigma^2 u^2 e^(-frac(u^2,2))  dif u +  frac(1, sqrt(2pi) sigma) integral_(-infinity)^infinity 2 sigma mu u e^(-frac(u^2,2))  dif u +  frac(1, sqrt(2pi) sigma) integral_(-infinity)^infinity mu^2 e^(-frac(u^2,2))  dif u - mu^2 \
    &= frac(sigma^2, sqrt(2pi) sigma) integral_(-infinity)^infinity u^2 e^(-frac(u^2,2))  dif u + frac(2 sigma mu, sqrt(2pi) sigma) integral_(-infinity)^infinity u e^(-frac(u^2,2)) dif u +  frac(mu^2, sqrt(2pi) sigma) integral_(-infinity)^infinity e^(-frac(u^2,2))  dif u - mu^2 \
$
We can assume that we already know:
$
    integral_(-infinity)^infinity e^(-x^2/2)  dif x = sqrt(2 pi) \
    integral_(-infinity)^infinity x e^(-x^2/2)  dif x = 0 \
    integral_(-infinity)^infinity x^2 e^(-x^2/2)  dif x = sqrt(2 pi)\
$
$
    &= frac(sigma^2, sqrt(2pi) sigma) integral_(-infinity)^infinity u^2 e^(-u^2/2)  dif u + frac(2 sigma mu, sqrt(2pi) sigma) integral_(-infinity)^infinity u e^(-u^2/2) dif u +  frac(mu^2, sqrt(2pi) sigma) integral_(-infinity)^infinity e^(-u^2/2)  dif u - mu^2 \
    &= frac(sigma^2, sqrt(2pi) sigma) sqrt(2 pi) +  frac(mu^2, sqrt(2pi) sigma) sqrt(2 pi) - mu^2 \
    "Var"[X] &= frac(sigma^2, sigma) +  frac(mu^2, sigma) - mu^2 \
$

= Problem 3
== a)
$
    Z = frac(X - mu, sigma) \
    P(15 - k lt.eq X lt.eq 15 + k) = 0.90 \
    P(frac(15 - k - mu, sigma) lt.eq frac(X - mu, sigma) lt.eq frac(15 + k - mu, sigma)) = 0.90 \
    P(frac(15 - k - 15, 4) lt.eq frac(X - mu, sigma) lt.eq frac(15 + k - 15, 4)) = 0.90 \
    P(-frac(k, 4) lt.eq Z lt.eq frac(k, 4)) = 0.90 \
    P(Z lt.eq frac(k, 4)) - P(Z lt.eq -frac(k, 4)) = 0.90 \
    P(Z lt.eq frac(k, 4)) - (1 - P(Z lt.eq frac(k, 4))) = 0.90 \
    2 P(Z lt.eq frac(k, 4)) - 1 = 0.90 \
    2 P(Z lt.eq frac(k, 4))  = 1.90 \
    P(Z lt.eq frac(k, 4))  = 0.95 \
    k/4 = 1.65 \
    ans(k = 6.6) \
$
== b)
$
    2 P(Z lt.eq frac(k, 4)) - 1 = 0.95 \
    2 P(Z lt.eq frac(k, 4))  = 1.95 \
    P(Z lt.eq frac(k, 4))  = 0.975 \
    k/4 = 1.96 \
    ans(k = 7.84) \
$


= Problem 4


= Problem 5

