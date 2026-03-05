num_simulations <- 10000
tosses_per_sim <- 100



results <- replicate(num_simulations, {
  sum(sample(c(0,1), tosses_per_sim, replace = TRUE))
})



prob_heads <- results / tosses_per_sim



hist(prob_heads,
     breaks = 30,
     probability = TRUE,
     main = "Probability Distribution of Heads (Coin Toss Simulation)",
     xlab = "Proportion of Heads",
     ylab = "Density",
     col = "skyblue",
     border = "white")

curve(dnorm(x, mean = 0.5, sd = sqrt(0.25/tosses_per_sim)),
      col = "red",
      lwd = 2,
      add = TRUE)