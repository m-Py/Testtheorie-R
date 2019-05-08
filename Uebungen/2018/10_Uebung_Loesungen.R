
## Termin 10 R Kurs - Praktische Uebung - 05.07.2018

## Themen: Reliabilitaet, Umkodierung von negativ
## gepolten Items



## Aufgabe 1

## Lest die Daten vom NPI ein
npi <- read.csv("npi_clean.csv")

## Berechnet die Korrelation zwischen der ersten
## Testhaelfte (Item 1 bis Item 20) und der zweiten
## Testhaelfte (Item 21 bis Item 40).

npi$sum1 <- rowSums(subset(npi, select = paste0("recode_Q", 1:20)))
npi$sum2 <- rowSums(subset(npi, select = paste0("recode_Q", 21:40)))

cor_halfs <- cor(npi$sum1, npi$sum2)


## Aufgabe 2

## Fuehrt den folgenden Befehl aus:

spearman_brown <- function(reliability, factor) {
    corrected_reliability <- (reliability * factor) / (1 + (factor - 1) * reliability)
    return(corrected_reliability)
}

## Durch Ausfuehren dieses Befehls habt ihr soeben eine
## eigene Funktion definiert!  Diese Funktion berechnet
## eine Spearman-Brown-Korrektur, d.h. sie berechnet
## wie reliabel ein Test waere, wuerde man ihn um einen
## festen Faktor verlaengern. Entsprechend nimmt die
## Funktion zwei Argumente an: (a) ein
## Reliabilitaets-Schaetzer; (b) ein
## Verlängerungsfaktor. Um anhand der Korrelation von
## zwei Testhaelften eine Reliabilitaet zu schaetzen,
## muss man die Korrelation mit der
## Spearman-Brown-Formel um den Faktor 2 korrigieren,
## da bei der Split-Half Korrelation jeweils nur die
## Haelfte der Items korreliert werden.

## Nutzt nun die Funktion spearman_brown und den in
## Aufgabe 1 bestimmten Wert, um die
## Split-Half-Reliabilitaet zu bestimmen.

spearman_brown(cor_halfs, 2)


## Aufgabe 3

## Bestimmt eine "Odd-even-Reliabilitaet", d.h. nutzt
## als die zwei Testhaelften einerseits die "geraden"
## Items (Item 2, Item 4, ..., Item 40) und
## andererseits die "ungeraden" Items (Item 1, Item 3,
## ..., Item 39). Wie kann man das ohne allzu großen
## Aufwand machen?

even <- 1:20 * 2
odd  <- (1:20 * 2) - 1

npi$sum_even <- rowSums(subset(npi, select = paste0("recode_Q", even)))
npi$sum_odd  <- rowSums(subset(npi, select = paste0("recode_Q", odd)))

cor_odd_even <- cor(npi$sum_even, npi$sum_odd)
spearman_brown(cor_odd_even, 2)


## Aufgabe 4

## Fuehrt die folgenden Befehle aus, um Cronbach's
## Alpha zu bestimmen

## Wir brauchen ein externes Paket:
install.packages("psychometric") 

## Lade Paket:
library("psychometric")

## Berechne Cronbach's Alpha mit Funktion alpha aus dem
## Paket psychometric:
items <- subset(npi, select = paste0("recode_Q", 1:40))
alpha(items)

## Cronbach's Alpha ist der Mittelwert aller
## Spearman-Brown Split-Half-Reliabilitaeten



#####################
## Neuer Datensatz ##
#####################



## Aufgabe 5

## Wir arbeiten jetzt mit Daten aus einem Big-5
## Kurzinventar. Lest zunaechst die Daten ein:

big5 <- read.csv("big5.csv")

## Es enthaelt die folgenden Items, die auf einer
## Likert-Skala [1-5] bewertet wurden:

## Ext_pos = Ich gehe aus mir heraus, bin gesellig.
## Ext_neg = Ich bin eher zurückhaltend, reserviert.
## Neu_pos = Ich werde leicht nervös und unsicher.
## Neu_neg = Ich bin entspannt, lasse mich durch Stress nicht aus der Ruhe bringen.
## Ver_pos = Ich schenke anderen leicht Vertrauen, glaube an das Gute im Menschen.
## Ver_neg = Ich neige dazu, andere zu kritisieren.
## Gew_pos = Ich erledige Aufgaben gründlich.
## Gew_neg = Ich bin bequem, neige zur Faulheit.
## Off_pos = Ich habe eine aktive Vorstellungskraft, bin fantasievoll.
## Off_neg = Ich habe nur wenig künstlerisches Interesse.

## Berechnet jeweils die Korrelationen zwischen den
## Items, die zu einer Skala gehoeren.

cor(big5$Ext_pos, big5$Ext_neg)
cor(big5$Neu_pos, big5$Neu_neg)
cor(big5$Ver_pos, big5$Ver_neg)
cor(big5$Gew_pos, big5$Gew_neg)
cor(big5$Off_pos, big5$Off_neg)

## Was faellt auf?


## Aufgabe 6

## Die Items sind unterschiedlich gepolt: Bei manchen
## Items bedeutet Zustimmung eine hohe Auspraegung in
## der jeweiligen Eigenschaft, bei manchem Items eine
## niedrige. Um Skalen-Summenwerte zu bestimmen,
## muessen notwendigerweise die Itemwerte in die selbe
## Richtung interpretierbar sein. Das heisst, dass wir
## fuer die negativ gepolten Items (hoher Wert =
## niedrige Auspraegung) wie folgt eine Invertierung
## der Werte durchfuehren:

## 1 -> 5
## 2 -> 4
## 3 -> 3
## 4 -> 2
## 5 -> 1

## Diese Umpolung kann man mit der folgenden Formel
## duchfuehren:

## Invertierter Wert = Ursprungswert * (-1) + Hoechster Skalenwert + 1

## Der hoechste Skalenwert ist hier 5.

## Berechnet invertierte Itemwerte fuer alle negativ
## gepolten Items. Bestimmt die Korrelation der positiv
## gepolten Items mit den invertierten Werten der
## negativ gepolten Items pro Big-5 Facette.

big5$Ext_neg_inv <- big5$Ext_neg * (-1) + 6
big5$Ver_neg_inv <- big5$Ver_neg * (-1) + 6
big5$Off_neg_inv <- big5$Off_neg * (-1) + 6
big5$Gew_neg_inv <- big5$Gew_neg * (-1) + 6
big5$Neu_neg_inv <- big5$Neu_neg * (-1) + 6

cor(big5$Ext_pos, big5$Ext_neg_inv)
cor(big5$Neu_pos, big5$Neu_neg_inv)
cor(big5$Ver_pos, big5$Ver_neg_inv)
cor(big5$Gew_pos, big5$Gew_neg_inv)
cor(big5$Off_pos, big5$Off_neg_inv)


## Aufgabe 7

## Bestimmt Summenwerte fuer die Subskalen der
## Big-5. Korreliert alle Subskalen miteinander.

big5$Extraversion       <- big5$Ext_pos + big5$Ext_neg_inv
big5$Vertraeglichkeit   <- big5$Ver_pos + big5$Ver_neg_inv
big5$Offenheit          <- big5$Off_pos + big5$Off_neg_inv
big5$Gewissenhaftigkeit <- big5$Gew_pos + big5$Gew_neg_inv
big5$Neurotizismus      <- big5$Neu_pos + big5$Neu_neg_inv

scales <- subset(big5, select = c("Extraversion",
                                  "Vertraeglichkeit",
                                  "Offenheit",
                                  "Gewissenhaftigkeit",
                                  "Neurotizismus"))

round(cor(scales), 2)


## Aufgabe 8

## Gibt es einen Generalfaktor Persoenlichkeit?

## (a) Bestimmt eine Split-Half-Reliabilitaet fuer die
## Big-5 (die Aufteilung der Testhaelften koennt ihr
## selber bestimmen; ggf. ist es nicht sinnvoll den
## Split anhand der Polung in positiv und negativ
## durchzufuehren).

prefix <- c("Ext", "Ver", "Off", "Gew", "Neu")
positive <- paste0(prefix, "_pos")
negative <- paste0(prefix, "_neg_inv")

all_items <- c(positive, negative)

## Randomisiere Reihenfolge:
all_items <- sample(all_items) ## was ist hier die Ausgabe?

## Waehle anhand des zufaelligen Splits Items aus 
big5_1 <- rowSums(subset(big5, select = all_items[1:5]))
big5_2 <- rowSums(subset(big5, select = all_items[6:10]))
spearman_brown(cor(big5_1, big5_2), 2)


## (b) Bestimmt Cronbach's Alpha ueber die Big-5

alpha(subset(big5, select = all_items))



## Aufgabe 9

## Antworttendenzen - gibt es ein Ja-Sager-Problem?


## (a) Bestimmt die Korrelationen zwischen allen
## positiv gepolten Items

round(cor(subset(big5, select = positive)), 2)


## (b) Bestimmt die Korrelationen zwischen allen
## positiv gepolten Items

round(cor(subset(big5, select = negative)), 2)

## Vergleicht die Ausgaben aus (a) und (b) mit den
## Korrelationen zwischen den Subskalen-Werten.

round(cor(scales), 2)

