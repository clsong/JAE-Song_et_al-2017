#R-code of "Will a small randomly-assembled community be feasible and stable?" by:
#Chuliang Song and Serguei Saavedra
#published in: Ecology

library(tidyverse)

#function that generates a random interaction matrix
#inputs: num = community size; stren = scale of interaction strength; conne = connectance
#output: Inte = random interaction matrix
generate_Interaction_matrix <- function(num, stren, conne){
  Inte <- rnorm(num*num, mean = 0, sd = stren)
  zeroes <- sample(c(rep.int(1,floor(num*num*conne)), rep.int(0,(num*num-floor(num*num*conne)))))
  Inte[which(zeroes==0)] <- 0
  Inte <- matrix(Inte, ncol = num, nrow = num)
  diag(Inte) <- -1
  return(Inte)
}

#function that checks whether the chosen parameterization satisfies feasibility
#inputs: A = interaction matrix; r = vector of intrinsic growth rates
#output: unfeasible = 0, feasible = 1
check_feasibility <- function(A, r){
  if(sum(solve(-A, r)<0)==0) return(1)
  else return(0)
}

#function that checks whether the chosen parameterization satisfies stability
#inputs: A = interaction matrix; r = vector of intrinsic growth rates
#output: unstable = 0; stable= 1
check_stability <- function(A, r){
  N <- solve(A, -r)
  jacobian <- A %*% diag(N) 
  auxi <- sum(Re(eigen(jacobian)$values) < -1e-8)
  if(auxi==num) return(1)
  else return(0)
}

#function that generates all the elements of the vector of intrinsic growth rate with the same value
#inputs: num = number of species
#output: vector of intrinsic growth rates with 'fixed' parameterization 
parameterization_fixed <- function(num){
  rep.int(1, num)
}

#function that generates the vector of intrinsic growth rates randomly with no other constraints
#inputs: num = number ofspecies
#output: vector of intrinsic growth rates with 'random' parameterization 
parameterization_random <- function(num){
  runif(num, -1, 1)
}

#function that generates the spanning vectors of the feasible cone
#inputs: A = interaction matrix; num = number of species
#output: generates the matrix where each column is a spanning vector
spanned_vectors <- function(A, num){
  G <- matrix(0, ncol=ncol(A), nrow=nrow(A))
  for(k in 1:num) G[,k] <- -A[,k]/sqrt(sum(A[,k]^2))
  G
}

#function that generates the vector of intrinsic growth rates randomly inside the feasibility domain
#inputs: A = interaction matrix; num = number of species
#output: vector of intrinsic growth rates with 'feasible' parameterization 
parameterization_feasible <- function(A, num){
  G <- spanned_vectors(A, num)
  lambda <- runif(num, min = 0, max = 1)
  lambda <- lambda/sum(lambda)
  growth <- G %*% matrix(lambda, ncol=1) %>%
    as.vector()
}

#function that generates the vector of intrinsic growth rates located at the geometric centroid of the feasibility domain
#inputs: A = interaction matrix; num = number of species
#output: vector of intrinsic growth rate with 'centroid' parameterization 
parameterization_center <- function(A, num){
  G <- spanned_vectors(A, num)
  lambda <- rep.int(1, num)
  lambda <- lambda/sum(lambda)
  growth <- G %*% matrix(lambda, ncol=1) %>%
    as.vector()
}
