
## Termin 7

# Wir nutzen einen Datensatz zu den Big 5 (Inventar aus 50 Items)
# - Daten abzurufen hier: https://openpsychometrics.org/_rawdata/
# - Selbsttest: https://openpsychometrics.org/tests/IPIP-BFFM/
# - Infos zum Inventar: https://ipip.ori.org/new_ipip-50-item-scale.htm

## Nun:
# - Daten einlesen
# - Schauen, was es fuer Daten sind (-> Codebuch) 
# - Kategoriale Daten als `factor` definieren
# - Personen mit fehlenden Antworten ausschliessen
#   + `NA` definieren
#   + Funktionen zum Umgang mit `NA`: `is.na()`, `complete.cases()`, `na.omit()`
#   + (auch relevant: `summary()`)
# - Plausibilitaet der Daten checken (z.B. Alter). Unplausible Faelle ausschliessen.

# Daten einlesen, "Tab" war das Trennzeichen in der CSV-Datei:
b5 <- read.csv("data.csv", sep = "\t")

# Definiere fehlenden Werte, mit Null kodiert, als NA:
b5[b5 == 0] <- NA

# Uebersicht ueber den Datensatz:
summary(b5)

nrow(b5)

# b5 <- na.omit(b5)

# Finde heraus, welche Werte in den Antworten zu den 50 Items fehlen:
items <- subset(b5, select = E1:O10)
misses <- !complete.cases(items)
sum(misses)
b5[misses, ]

# Personen (ist nur eine) mit fehlenden Werten in den Items ausschliessen:
b5 <- b5[complete.cases(items), ]

####

# Geschlecht als kategoriale Variable (`factor` definieren)
table(b5$gender)
b5$gender <- factor(b5$gender, labels = c("maennlich", "weiblich", "divers"))

# Unplausible Antworten in Alter ausschliessen (bzw. Personen mit 
# unplausiblen Werten):
table(b5$age)
b5 <- subset(b5, age <= 100)


## Aufgabe 0

# Zieht alle oben genannten Schritte zur "Datenbereinigung"
# nach. Fallen euch noch weitere moegliche Ueberpruefungen der
# Plausibilitaet der Daten ein? Fuehrt solche Ueberpruefungen
# durch. Ueberlegt, unter welchen Umstaenden ihr Faelle ausschliessen
# wuerdet und welche Faelle ihr eher behaltet. (Das ist oftmals
# einfach eine Abwaegung und es gibt nicht "richtig" und "falsch".)

## Aufgabe 1 

# Berechnet Item-Trennschaerfen und Cronbachs Alpha fuer die Skala
# Extraversion.  Beachtet, dass negativ gepolte Items invertiert
# werden muessen. Wie die Item gepolt sind, siehe hier:
# https://ipip.ori.org/new_ipip-50-item-scale.htm - oder entscheidet
# anhand der Items selbst, wie sie gepolt sind). Tipp: Markiert im
# Codebuch bei jedem Item die Polung.


invert_item <- function(x, maximum = 5) {
  x * (-1) + maximum + 1
}

b5$E2i <- invert_item(b5$E2)
b5$E4i <- invert_item(b5$E4)
b5$E6i <- invert_item(b5$E6)
b5$E8i <- invert_item(b5$E8)
b5$E10i <- invert_item(b5$E10)

library(psychometric)
source("discrimination.R")
spalten_e <- c(paste0("E", 1:5 * 2 - 1), paste0("E", 1:5 * 2, "i"))
alpha(b5[, spalten_e])
item.exam(b5[, spalten_e])


## Aufgabe 2 

# (a) Berechnet einen Summenscores fuer die Skala Extraversion.

b5$Extraversion <- rowSums(b5[, spalten_e])

# (b) Vergleicht fuer die Skala "Extraversion" mit einem t-Test die
# Summenwerte zwischen maennlichen und weiblichen Teilnehmenden.

t.test(
  b5$Extraversion[b5$gender == "weiblich"], 
  b5$Extraversion[b5$gender == "maennlich"]
)

# (c) Vergleicht fuer die Skala "Extraversion" mit einem t-Test die
# Summenwerte zwischen Personen mit englischer Muttersprache und
# denjenigen, die keine englischen Muttersprachler sind. Wie viele
# Personen waren englische Muttersprachler und welchem relativen
# Anteil entspricht das?

t.test(Extraversion ~ engnat, data = b5)
table(b5$engnat)
table(b5$engnat) / nrow(b5)


## Aufgabe 3

# (a) Generiert ein Histogram fuer den Summenscore "Extraversion".

hist(b5$Extraversion)

# (b) Generiert einen Scatterplot, der den Zusammenhang zwischen
# Extraversion mit dem Alter darstellt. Bestimmt auch die Korrelation
# dieser Variablen. Ist die Korrelation zwischen den Variablen
# signifikant?  (Rechercheaufgabe: Welche Funktion gibt die
# Signifikanz einer Korrelation aus?)

# Erinnerung: Wurde die Plausibilitaet der Alterswerte ueberprueft und
# wurde damit umgegangen?

plot(b5$Extraversion, b5$age)
cor(b5$Extraversion, b5$age)
cor.test(b5$Extraversion, b5$age)

###########
## Bonus ##
###########

# Eine ausfuehrliche Exploration dieses Datensatzes ist die perfekte
# Vorbereitung auf die Hausarbeit. Folgende Explorationen sind
# bspw. sinnvoll:

# - Berechnet Scores fuer alle Subskalen, achtet dabei auf
#   Invertierungen. (Tipp: Markiert im Codebuch bei jedem Item die
#   Polung)
# - Untersucht Korrelationen zwischen den Subskalen
# - Haengen die Big-5 anderen demographischen Variablen zusammen?
# - Psychometrische Auswertungen pro Subskala (korrigierte
#   Trennschaerfen; Schwierigkeiten, Cronbachs Alpha ... )
# - Gibt es "faule" Items? D.h. welche Items sind pro Subskala am
#   wenigsten trennscharf
# - Exploriert die Ernsthaftigkeit der Teilnahmen. Koennt ihr testen,
#   ob Personen immer dieselbe Antwort gegeben haben?
