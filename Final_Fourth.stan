data {
  int<lower=0> m;
  int<lower=0> y[m];
  int<lower=0> n[m];
  int<lower=0, upper=1> o[m];
}


parameters {
  real<lower=0> alpha_old;
  real<lower=0> gamma_old;
  real<lower=0> alpha_young;
  real<lower=0> gamma_young;
  real<lower=0, upper=1> theta[m];
}

model {
  alpha_old ~ gamma(2, 1);
  gamma_old ~ gamma(2, 1);
  alpha_young ~ gamma(2, 1);
  gamma_young ~ gamma(2, 1);
  for(num in 1:m){
    if(o[m] == 1){
      theta[num] ~ beta(alpha_old, gamma_old);
    }
    else{
      theta[num] ~ beta(alpha_young, gamma_young);
    }
    y[num] ~ binomial(n[num], theta[num]);
  }

}

