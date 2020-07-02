
# Author: Martin Papenberg
# Year: 2020

# Analyze data from the paper 

# Papenberg, M., Diedenhofen, B., & Musch, J. (2019). An experimental 
# validation of sequential multiple-choice tests. Journal of Experimental 
# Education. Advance Online Publication. 
# https://doi.org/10.1080/00220973.2019.1671299

# Data and codebook available from https://osf.io/ycaex/


# Load required packages

library(afex) # for ANOVA
library(emmeans) # for marginal means + post-hoc tests
library(car) # alternative for ANOVA
library(papaja) # for plotting, available from https://github.com/crsh/papaja

# Read data

df <- read.csv("data.csv", sep = ";")


df <- subset(df, select = c(lfdn, testFormat, information, score_exp))
df$information <- ordered(df$information, levels = c("low", "medium", "high", "perfect"))


# Descriptive statistics + plotting
round(tapply(df$score_exp, df[, c("testFormat", "information")], mean), 2)
round(tapply(df$score_exp, df[, c("testFormat", "information")], sd), 2)

apa_barplot( # apa_beeplot
  data = df,
  id = "lfdn",
  factors = c("information", "testFormat"),
  las = 1,
  ylab = "Summenscore",
  dv = "score_exp"
)

# ANOVA using aov()

aov1 <- aov(score_exp ~ information * testFormat, data = df)
summary(aov1)


# ANOVA using afex::aov_ez()
aov2 <- aov_ez(
  id = "lfdn",
  dv = "score_exp",
  data = df, 
  between = c("information", "testFormat")
)

papaja::apa_print(aov2)

# Post-hoc comparisons
em1 <- emmeans(aov2, "information")
round(tapply(df$score_exp, df[, c("information")], mean), 2)

pairs(em1)

# (ANOVA using lm() + anova())

