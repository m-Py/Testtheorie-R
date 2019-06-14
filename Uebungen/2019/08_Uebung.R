
##############
## Termin 8 ##
##############

##############################
## Aufgabe 0 (siehe Folien) ##
##############################

## Spiel: Was ist gleich? 
## -- Haben zwei Befehle dieselbe Ausgabe?

## Daten einlesen 
nn <- read.csv("niedertraechtige_neun.csv")

# Paar 1
subset(nn, PF18_01 == 5)
subset(nn, select = PF18_01 == 5)

# Paar 2
subset(nn, PF18_01 == 5)
subset(nn, subset = PF18_01 == 5)

# Paar 3
subset(nn, PF18_01 == 5)
subset(subset = PF18_01 == 5, x = nn)

# Paar 4
subset(nn, PF18_01 == 5)
nn[PF18_01 == 5, ]

# Paar 5
subset(nn, PF18_01 == 5)
nn[nn$PF18_01 == 5, ]

# Paar 6
subset(nn, c("PF18_01"))
subset(nn, "PF18_01")

# Paar 7
subset(nn, "PF18_01")
nn[, "PF18_01"]

# Paar 8
subset(nn, select = "PF18_01")
nn[, "PF18_01"]

# Paar 9
subset(select = paste0("PF18_0", 1:9), x = nn)
nn[, paste0("PF18_0", 1:9)]

# Paar 10

nn[, paste0("PF18_0", 1:9)]
subset(nn, select = PF18_01:PF18_09)


########################################
## Narcissistic Personality Inventory ##
########################################

## Wir beginnen heute die Arbeit mit einem neuen
## Datensatz, und zwar zum "Narcissistic Personality
## Inventory". In den naechsten Stunden werden wir
## damit folgende Aufgaben bearbeiten:

## (a) Daten einlesen und aufarbeiten
## - Fehlende Werte ausschliessen
## - Item-Punktwerte und Summenwerte berechnen

## (b) Psychometrische Berechungen durchfuehren, u.a.:
## - (korrigierte) Item-Trennschaerfen
## - Cronbachs Alpha
## - Split-Half-Reliabilitaet

#############
## ACHTUNG ## 
#############

## In einer neuen Version des Skripts habe ich Kapitel
## 4 in zwei Kapitel aufgeteilt (Kapitel 4 und 5). Die
## Kapitel 4 und 5 sind relevant fuer die Aufgaben in
## den naechsten Wochen. (Das Kapitel 3.5 ist nicht
## relevant und kann uebersprungen werden.)

## Bei der Ueberarbeitung fand nur eine tatsaechliche
## inhaltliche Aenderung im Vergleich zu vorher statt:
## Der Abschnitt zum Ausschluss von fehlenden Werten
## wurde verbessert (in der neuen Version ist das
## Abschnitt 5.3; vorher war es Abschnitt 4.2.3).
## Zum Nacharbeiten von Aufgabe 2 in diesem Blatt 
## lohnt es sich den Abschnitt 5.3 anzuschauen.


###############
## Aufgabe 1 ##
###############

## (gemeinsame Aufgabe: Ueberlegen und melden)

## Daten einlesen
npi <- read.csv("data_npi.csv")

## Exploration der Daten
head(npi)

## Durchschaut das Codebuch -- was sind die Variablen 
## `Q1` bis `Q40` und die Variable `score`? 

table(npi$Q1)
table(npi$score)

## Wann enthalten Spalten den Wert Null? Was bedeutet 
## es, wenn die Spalte `score` den Wert 0 enthaelt?

###############
## Aufgabe 2 ##
###############

## In dieser Aufgabe schliessen wir alle Faelle aus,
## bei denen mindestens ein fehlender Wert
## vorliegt. Die Aufgabe ist nachvollziehbar und
## erklaert im neuen Skript (Abschnitt 5.3)

## (a) Die Variable `score` ist nicht diagnostisch
## dafuer, ob eine Person einen fehlenden Wert
## produziert hat.  Erstellt einen data frame ohne
## diese Spalte (und speichert ihn in einer neuen
## Variablen ab).


## (b) Ersetzt im data frame aus Aufgabenteil (a)
## alle Nullen durch NA. Nutzt dafuer ein Vorgehen, das
## wir bei der Ersetzung von Elementen in Vektoren
## kennengelernt haben [d.h. tut einfach so, als waere
## der data.frame aus (a) ein Vektor!]


## (c) Die Funktion complete.cases nimmt als Argument
## einen data.frame an und gibt einen logischen Vektor
## zurueck, der fuer jede Zeile kodiert, ob sie
## *keinen* fehlenden Wert enthaelt (daher der Name
## "complete cases" -- Zeilen = Faelle -- es wird
## ueberprueft, ob bei jedem Fall vollstaendige Werte
## vorliegen)

## (i) Bei wie vielen Faellen liegen fehlende Werte
## vor?


## (ii) Bei wie vielen Faellen liegen keine fehlende
## Werte vor?


## (iii) Erstellt einen data.frame, der nur die
## vollstaendigen Faelle enthaelt. Dieser data.frame
## sollte die Spalte `score` enthalten.


## (iv) Loescht den temporaeren data frame, den wir
## genutzt haben, um Faelle auszuschliessen.


#########################################################
## Umkodierung von Antworten mit der Funktion `ifelse` ##
#########################################################

## Lest diesen Abschnitt, bevor ihr mit der naechsten 
## Aufgabe fortfahrt.

## Wir wollen nun die Antworten auf die NPI Items
## umkodieren. Wie wir wissen, koennen die Antworten
## die Werte 1 und 2 annehmen, je nachdem ob die
## "erste" oder "zweite" Aussage ausgewaehlt wurde
## (siehe Codebuch). Wir moechten Variablen erstellen,
## die kodieren, ob fuer jedes Item die narzisstische
## Aussage gewaehlt wurde.

## Dafuer koennen wir die Funktion `ifelse`
## verwenden. Beispiele:

npi$score_Q1 <- ifelse(npi$Q1 == 1, 1, 0) # 1 ist der "Schluessel"
npi$score_Q4 <- ifelse(npi$Q4 == 2, 1, 0) # 2 ist der "Schluessel"

## Was ist dabei passiert?
table(npi$Q1)
table(npi$score_Q1)

table(npi$Q4)
table(npi$score_Q4)

## Die Funktion `ifelse` nimmt drei Argumente entgegen,
## diese heißen `test`, `yes`, und `no`: 
## - `test`: Logischer Vektor; vergleicht jede Antwort mit dem Schluessel
## - `yes`: Der Wert, der an Positionen angenommen wird,  
##   an denen der `test` TRUE ergab (hier: 1)
## - `no`: Der Wert, der an Positionen angenommen wird,  
##   an denen der `test` FALSE ergab (hier: 0)


###############
## Aufgabe 3 ##
###############

## (a) Bestimmt fuer die Subskala
## Ueberlegenheitsgefuehl einen Summenwert.

## (i) Wendet dafuer zunaechst `ifelse` auf alle Items
## der Subskala an, um Item-Punktwerte zu berechnen
## (entnehmt die Items und die Schluessel dem Codebuch)



## (ii) Nutzt nun die Funktion `rowSums`, um einen
## Summenwert fuer die Skala Ueberlegenheit zu
## berechnen



###############
## Aufgabe 4 ##
###############

## Berechnet Mittelwert und Standardabweichung fuer den
## Skalenwert Ueberlegenheit

## (i) Einmal fuer die gesamte Stichprobe


## (ii) Einmal getrennt fuer maennliche und weibliche
## Teilnehmer/innen



## (iii) Unterscheiden sich Frauen und Maenner
## signifikant im Ueberlegenheitsgefuehl? (Rechnet
## einen t-Test)



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
## Aufgabe 5 ##
###############

## Berechnet aus den rekodierten Items einen
## Summenscore und prueft, ob eure Wert mit der Spalte
## `score` uebereinstimmen.
