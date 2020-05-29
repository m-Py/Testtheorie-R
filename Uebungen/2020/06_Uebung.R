
###########################
## Termin 6 Uebungsblatt ##
###########################

## Neue Inhalte heute:

# - R-Zusatzpakete installieren und laden
# - Funktionen aus Zusatzpaketen nutzen
# - Weitere psychometrische Auswertungen: Item-Trennschaerfen, Cronbachs Alpha

################################################################################

# Wir arbeiten mit dem Datensatz zu den "Niedertraechtigen Neun" weiter.

nn <- read.csv("niedertraechtige_neun.csv")
# Summenscores erstellen:
nn$Machiavellismus <- nn$PF18_01 + nn$PF18_04 + nn$PF18_07
nn$Psychopathie <- nn$PF18_02 + nn$PF18_05 + nn$PF18_08
nn$Narzissmus <- nn$PF18_03 + nn$PF18_06 + nn$PF18_09
nn$DunkleTriade <- nn$Machiavellismus + nn$Psychopathie + nn$Narzissmus


#########################
## Pakete installieren ##
#########################

install.packages("psych") # greift auf R-Server CRAN zu und sucht Paket
install.packages("psychometric") 


# Pakete laden (das hier muss in jeder R-Session neu gemacht werden:)
library("psych")
library("psychometric")


########################
## Item-Trennschaerfe ##
########################

# Unkorrigierte Item-Trennschaerfe

# Wir bestimmen die Trennschaerfen der Skala Machiavellismus
# Waehle Items + Skalenscore aus
spalten_mach <- c(paste0("PF18_0", c(1, 4, 7)), "Machiavellismus")
mach <- nn[, spalten_mach]

cor(mach)
round(cor(mach), 2) # sehr hohe Trennschaerfen -> Kriterienkontamination!

# Korrigierte Trennschaerfe

# Beruecksichtige nicht das Item in der Skalensumme, fuer das die
# Trennschaerfe bestimmt wird

cor(nn$PF18_01, nn$PF18_04 + nn$PF18_07) 
cor(nn$PF18_04, nn$PF18_01 + nn$PF18_07) 
cor(nn$PF18_07, nn$PF18_01 + nn$PF18_04) 


# Korrigierte Trennschaerfe erfordert pro Item auch einen separaten
# Score -> unpraktisch. Bequemer: Die Funktion `item.exam()` aus dem
# Paket `psychometric`.

# Fuehre Item-Analyse der Gesamtskala "Dunkle Triade" durch (alle 9 Items)
all_items <- nn[, paste0("PF18_0", 1:9)]

item.exam(all_items)

# Spalte "Item.Tot.woi" enthaelt die korrigierte Trennschaerfe;
# "Item.total" die unkorrigierte. Beachtet: Die Ausgabe der Funktion
# `item.exam()` ist ein data.frame mit Zeilennamen! (hier kann man
# also sogar auch Zeilen nach Namen auswaehlen; sonst haben wir das
# nicht gemacht).
?item.exam


#####################
## Cronbachs Alpha ##
#####################

# Maß fuer die interne Konsistenz eines Tests / Reliabilitaet. Haben
# Personen, die in einem Item hoch scoren tendenziell auch in den
# anderen Items hoehere Scores (und umgekehrt).

alpha(all_items)

# Der doppelte Doppelpunktoperator steuert das richtige Paket an:
psychometric::alpha(all_items)
psych::alpha(all_items)

?psych::alpha


###############
## Aufgabe 1 ##
###############

# Berechnet Cronbachs Alpha separat fuer die drei Skalen 
# Machiavellismus, Psychopathie und Narzissmus. Nutzt einmal das Paket
# `psychometric` und einmal das Paket `psych`. Vergleicht jeweils die 
# Ausgabe. Was gibt `psych` alles zusaetzlich zu Cronbachs Alpha aus?
# (Recherchiert in der Dokumentation -> ?psych::alpha)

# (a) Machiavellismus


## (b) Psychopathie


## (c) Narzissmus


###############
## Aufgabe 2 ##
###############

# Findet heraus welches Item ist jeweils das trennschaerfste 
# aus jeder der drei Skalen. Nutzt dabei die Funktion `item.exam()` aus dem 
# Paket `psychmetric`, um fuer jede Skala korrigierte Item-Trennschaerfen 
# zu bestimmen. Vergleicht immer auch die korrigierte mit der unkorrigierten 
# Trennschaerfe (waehlt dafuer aus dem Ausgabe-Data.frame nur die Spalten
# "Item.Tot.woi" und "Item.total" aus).

# (a) Machiavellismus


## (b) Psychopathie


## (c) Narzissmus


###############
## Aufgabe 3 ##
###############

# Bestimmt in Bezug auf die gesamten Niedertraechtigen Neun die Trennschaerfe 
# der Items 1, 2 und 3. Nutzt dafuer *nicht* die Funktion `item.exam()`!

# (a) Item 1


# (b) Item 2


# (c) Item 3


