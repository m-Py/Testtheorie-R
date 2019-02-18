# Beispiele für Präzedenz:

TRUE | TRUE & FALSE
#> [1] TRUE

(TRUE | TRUE) & FALSE
#> [1] FALSE

1:10-1

1:10[1]
#> [1]  1  2  3  4  5  6  7  8  9 10
(1:10)[1]
#> [1]  1


1:10[-c(1, 5, 7)]
# Fehler
(1:10)[-c(1, 5, 7)]
#> [1]  2  3  4  6  8  9 10
