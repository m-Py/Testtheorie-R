
## Daten einlesen und Variablen berechnen:
nn <- read.csv("niedertraechtige_neun.csv")
nn$Machiavellismus <- nn$PF18_01 + nn$PF18_04 + nn$PF18_07
nn$Psychopathie <- nn$PF18_02 + nn$PF18_05 + nn$PF18_08
nn$Narzissmus <- nn$PF18_03 + nn$PF18_06 + nn$PF18_09
nn$DunkleTriade <- nn$Machiavellismus + nn$Psychopathie + nn$Narzissmus

#########################
## Blatt 6 - Aufgabe 2 ##
#########################

## (a) Waehlt aus dem data.frame nn die 9 Spalten mit
## den Items zu den Niedertraechtigen Neun aus;
## speichert die Auswahl in einer neuen Variablen.

items <- nn[, paste0("PF18_0", 1:9)]
items <- subset(nn, select = paste0("PF18_0", 1:9))
## Oder: 
items <- subset(nn, select = PF18_01:PF18_09)

#########################
## Blatt 7 - Aufgabe 1 ##
#########################


## (a) Erstellt einen data.frame, der alle Faelle
## enthaelt, deren Gesamt-Summenwert fuer die Dunkle
## Triade ueber dem Median liegen. Speichert diesen
## data.frame in einer neuen Variablen ab.

dark <- nn[nn$DunkleTriade > median(nn$DunkleTriade), ]
dark <- subset(nn, DunkleTriade > median(DunkleTriade))

## (b) Wie viele Faelle hat der in Aufgabenteil (a)
## erstellte data.frame? Welchem relativen Anteil im
## Verhaeltnis zur Gesamtstichprobe antspricht das?

nrow(dark)
nrow(dark) / nrow(nn)

## (c) Erstellt einen data.frame, der alle Personen
## enthaelt, die in mindestens einer der 3 dunklen
## Eigenschaften ueber dem Median liegen

somewhat_dark <- nn[nn$Psychopathie > median(nn$Psychopathie) | 
                    nn$Narzissmus > median(nn$Narzissmus) | 
                    nn$Machiavellismus > median(nn$Machiavellismus), ]

somewhat_dark <- subset(nn, Psychopathie > median(Psychopathie) | 
                        Narzissmus > median(Narzissmus) | 
                        Machiavellismus > median(Machiavellismus))

## (d) Wie viele Faelle hat der in Aufgabenteil (c)
## erstellte data.frame? Welchem relativen Anteil im
## Verhaeltnis zur Gesamtstichprobe antspricht das?

nrow(somewhat_dark)
nrow(somewhat_dark) / nrow(nn)

## (e) Erstellt einen data.frame, der alle Personen
## enthaelt, die in allen der 3 dunklen Eigenschaften
## ueber dem Median liegen

highly_dark <- nn[nn$Psychopathie > median(nn$Psychopathie) & 
                    nn$Narzissmus > median(nn$Narzissmus) & 
                    nn$Machiavellismus > median(nn$Machiavellismus), ]

highly_dark <- subset(nn, Psychopathie > median(Psychopathie) &
                        Narzissmus > median(Narzissmus) &
                        Machiavellismus > median(Machiavellismus))

## (f) Wie viele Faelle hat der in Aufgabenteil (e)
## erstellte data.frame? Welchem relativen Anteil im
## Verhaeltnis zur Gesamtstichprobe antspricht das?

nrow(highly_dark)
nrow(highly_dark) / nrow(nn)

#########################
## Blatt 7 - Aufgabe 2 ##
#########################

## Berechnet einen t-Test, der den Werte in Psychopathie,
## Machiavellismus und Narzissmus miteinander vergleicht.
## Befolgt dazu die folgende Anleitung.

## (a) Erstellt einen data.frame, der die maennlichen 
## Teilnehmer enthaelt und einen data.frame, der die 
## weiblichen Teilnehmerinnen enthaelt.

m <- nn[nn$geschlecht == "maennlich", ]
w <- nn[nn$geschlecht == "weiblich", ]

m <- subset(nn, geschlecht == "maennlich")
w <- subset(nn, geschlecht == "weiblich")

## (b) Die Funktion t.test nimmt als Argumente zwei 
## numerische Vektoren an. Nutzt die in Aufgabenteil 
## (a) erstellten data.frames, um die Summenwerte 
## der maennlichen und weiblichen Teilnehmerinnen 
## mit der Funktion t.test zu vergleichen.

t.test(m$Machiavellismus, w$Machiavellismus)
t.test(m$Narzissmus, w$Narzissmus)
t.test(m$Psychopathie, w$Psychopathie)
