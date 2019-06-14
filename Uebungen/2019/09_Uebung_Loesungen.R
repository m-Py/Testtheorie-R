
##############
## Termin 9 ##
##############

###############
## Aufgabe 1 ##
###############

## Fuehrt die folgenden Code-Zeilen aus. Ueberschreibt jede Zeile
## mit einem erklaerenden Kommentar.

## Daten einlesen
npi <- read.csv("data_npi.csv")
temp <- npi[, paste0("Q", 1:40)]
temp[temp == 0] <- NA
npi <- npi[complete.cases(temp), ]
rm(temp)

#########################################################
## Umkodierung von Antworten mit der Funktion `ifelse` ##
#########################################################

## Lest diesen Abschnitt, bevor ihr mit der naechsten 
## Aufgabe fortfahrt.

## Wir wollen die Antworten auf die NPI Items
## umkodieren. Wie wir wissen, koennen die Antworten
## die Werte 1 und 2 annehmen, je nachdem ob die
## "erste" oder "zweite" Aussage ausgewaehlt wurde
## (siehe Codebuch). Wir moechten Variablen erstellen,
## die kodieren, ob fuer jedes Item die narzisstische
## Aussage gewaehlt wurde (mit 1 bzw. 0).

## Dafuer koennen wir die Funktion `ifelse`
## verwenden. Beispiele:

npi$score_Q1 <- ifelse(npi$Q1 == 1, 1, 0) # 1 ist der "Schluessel"
npi$score_Q4 <- ifelse(npi$Q4 == 2, 1, 0) # 2 ist der "Schluessel"

## Hier wird jeweils eine Spalte an den data.frame npi angehaengt;
## ifelse gibt einen Vektor zurueck. Was ist genau passiert?
## Betrachten wir die Spalten, die wir neu angelegt haben und die,
## aus denen die Umkodierung abgeleitet wurde:
table(npi$Q1)
table(npi$score_Q1)

table(npi$Q4)
table(npi$score_Q4)

## Die Funktion `ifelse` nimmt drei Argumente entgegen,
## diese heißen `test`, `yes`, und `no`: 
## - `test`: Logischer Vektor; vergleicht jede Antwort mit dem Schluessel
## - `yes`: Der Wert, den die Ausgabe an Positionen annimmt,  
##   an denen der `test` TRUE ergibt (hier: 1)
## - `no`: Der Wert, den die Ausgabe an Positionen annimmt,  
##   an denen der `test` FALSE ergibt (hier: 0)


###############
## Aufgabe 2 ##
###############

## (a) Bestimmt fuer die Subskala
## "Ueberlegenheitsgefuehl" einen Summenwert.

## (i) Wendet dafuer zunaechst `ifelse` auf alle Items
## der Subskala an, um Item-Punktwerte zu berechnen
## (entnehmt die Items und die Schluessel dem Codebuch)

## keys <- c(2, 2, 2, 1, 2)

npi$score_Q4  <- ifelse(npi$Q4 == 2, 1, 0)
npi$score_Q9  <- ifelse(npi$Q9 == 2, 1, 0)
npi$score_Q26 <- ifelse(npi$Q26 == 2, 1, 0)
npi$score_Q37 <- ifelse(npi$Q37 == 1, 1, 0)
npi$score_Q40 <- ifelse(npi$Q40 == 2, 1, 0)

## (ii) Nutzt nun die Funktion `rowSums`, um einen
## Summenwert fuer die Skala Ueberlegenheit zu
## berechnen

items <- paste0("score_Q", c(4, 9, 26, 37, 40))
npi$Superiority <- rowSums(npi[, items])

###############
## Aufgabe 3 ##
###############

## Berechnet Mittelwert und Standardabweichung fuer den
## Skalenwert Ueberlegenheit

## (i) Einmal fuer die gesamte Stichprobe
mean(npi$Superiority)
sd(npi$Superiority)

## (ii) Einmal getrennt fuer maennliche und weibliche
## Teilnehmer/innen

# maennlich
mean(npi$Superiority[npi$gender == 1])
sd(npi$Superiority[npi$gender == 1])

# weiblich
mean(npi$Superiority[npi$gender == 2])
sd(npi$Superiority[npi$gender == 2])

## (iii) Unterscheiden sich Frauen und Maenner
## signifikant im Ueberlegenheitsgefuehl? (Rechnet
## einen t-Test)

t.test(npi$Superiority[npi$gender == 1],
       npi$Superiority[npi$gender == 2])

#############################
## Umkodierung aller Items ##
#############################

## Betrachtet und fuehrt den folgenden Code aus -- er
## muss nicht verstanden werden, aber ueberlegt, was
## passiert.

## Schluessel aller 40 Items in einen Vektor
keys <- c(1, 1, 1, 2, 2, 1, 2, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 2, 2, 2,
          1, 2, 2, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 2)

## Hier wird eine Rekodierung fuer alle 40 Items
## durchgefuert. Dieser Code muss nicht verstanden
## werden.

## (FYI: npi[["Q1"]] ist dasselbe wie npi$Q1)
for (i in 1:40) {
  colname <- paste0("Q", i)
  npi[[paste0("score_", colname)]] <- ifelse(npi[[colname]] == keys[i], 1, 0)
}

## Betrachtet die Tabelle npi:
head(npi)

###############
## Aufgabe 4 ##
###############

## Berechnet aus den rekodierten Items einen
## Summenscore und prueft, ob eure Wert mit der Spalte
## `score` uebereinstimmen.
items <- paste0("score_Q", 1:40)
my_score <- rowSums(npi[, items])
sum(my_score == npi$score) == nrow(npi)

## Vorsicht:
# rowSums(subset(npi, select = score_Q1:score_Q40))
# geht hier ggf. schief!

###############
## Aufgabe 5 ##
###############

## Berechnet fuer die anderen 6 Subskalen nach Raskin und Terry
## (1988) Summenwerte. (Entnehmt die Zugehoerigkeit der
## Items zu Subskalen aus dem Codebuch, oder der
## Tabelle 1 aus dem Paper von Schuetz Marcus, und
## Sellin (2003)).

## Hinweis 1: Nutzt wiederum die [.,.]-Notation (oder subset)
## und rowSums.

## Hinweis 2: Speichert die Subskalen-Summenwerte als
## Spalten des npi data.frames ab

## 1. Speichere die Namen der Spalten der
##    Subskalen-Items in Variablen
authority        <- paste0("score_Q", c(1, 8, 10, 11, 12, 32, 33, 36))
selfSufficiency  <- paste0("score_Q", c(17, 21, 22, 31, 34, 39))
superiority      <- paste0("score_Q", c(4, 9, 26, 37, 40))
exhibitionism    <- paste0("score_Q", c(2, 3, 7, 20, 28, 30, 38))
exploitativeness <- paste0("score_Q", c(6, 13, 16, 23, 35))
vanity           <- paste0("score_Q", c(15, 19, 29))
entitlement      <- paste0("score_Q", c(5, 14, 18, 24, 25, 27))

## 2. Erstelle Subskalensummenwerte
npi$Authority        <- rowSums(npi[, authority])
npi$SelfSufficiency  <- rowSums(npi[, selfSufficiency])
npi$Superiority      <- rowSums(npi[, superiority])
npi$Exhibitionism    <- rowSums(npi[, exhibitionism])
npi$Exploitativeness <- rowSums(npi[, exploitativeness])
npi$Vanity           <- rowSums(npi[, vanity])
npi$Entitlement      <- rowSums(npi[, entitlement])


###############
## Aufgabe 6 ##
###############

## Stellt die Korrelationen zwischen den sieben Subskalen
## in einer Tabelle dar (auf zwei Nachkommastellen gerundet).

subscales <- c("Authority", "SelfSufficiency",
               "Superiority", "Exhibitionism",
               "Exploitativeness", "Vanity",
               "Entitlement")

round(cor(subset(npi, select = subscales)), 2)
