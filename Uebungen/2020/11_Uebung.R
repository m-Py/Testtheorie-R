
# Testtheorie mit R - Woche 11: Within-ANOVA

library(tidyr)
library(afex)
library(emmeans)

df <- read.csv("domc-vs-mc.csv", sep = ";")

# df = data frame with four columns
#   lfdn: unique test taker ID
#   domc_score: sum correct in 18 DOMC items
#   mc_score: sum correct in 18 MC items
#   balancing: which test was presented in which test format
#              1 = Test A in MC format, Test B in DOMC format
#              2 = Test A in DOMC format, Test B in MC format

# Exploration - mean scores, frequecies, paired t-test

mean(df$domc_score)
mean(df$mc_score)

cor(df$domc_score, df$mc_score)

t.test(df$domc_score, df$mc_score, paired = TRUE)
table(df$balancing)


# Wide data
#   lfdn domc_score mc_score balancing
#    36          7        8         2

# Long data
# lfdn       score   balancing    test_format
#  36          7           2          "domc"
#  36          8           2          "mc"

ldf <- pivot_longer(
  df, 
  cols = c(domc_score, mc_score),
  names_to = "test_format",
  values_to = "sum_score"
)

# long to wide "by hand":

# ldf <- data.frame(
#   lfdn = rep(df$lfdn, 2),
#   balancing = rep(df$balancing, 2),
#   sum_score = c(df$mc_score, df$domc_score),
#   test_format = c(rep("mc", nrow(df)), rep("domc", nrow(df)))
# )

# ANOVA

aov_ez(
  "lfdn",
  dv = "sum_score",
  data = ldf,
  within = "test_format"
)

aov1 <- aov_ez(
  "lfdn",
  dv = "sum_score",
  data = ldf,
  within = "test_format",
  between = "balancing"
)

#   balancing: which test was presented in which test format
#              1 = Test A in MC format, Test B in DOMC format
#              2 = Test A in DOMC format, Test B in MC format

emmeans(aov1, c("test_format", "balancing"))

# Materials effects

df$score_a <- ifelse(df$balancing == 1, df$mc_score, df$domc_score)
df$score_b <- ifelse(df$balancing == 1, df$domc_score, df$mc_score)

mean(df$score_a)
mean(df$score_b)

t.test(df$score_a, df$score_b, paired = TRUE)
