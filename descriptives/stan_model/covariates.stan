data{
  int<lower=0> N;
  int<lower=0,upper=1> Gender[N];
  int<lower=0,upper=1> Quali[N];
  int<lower=12,upper=20> Age[N];
  vector[N] Varx;
}
parameters{
  real<lower=0> sigma_e;
  real beta[5];  
}
model{
  real mu;
  sigma_e ~ cauchy(0,4);
  for( n in 1:N ){
    Varx[n] ~ normal( beta[1] + beta[2]*Gender[n] + beta[3]*Quali[n] + beta[4]*Quali[n]*Gender[n] + beta[5]*Age[n], sigma_e);
  }
}
