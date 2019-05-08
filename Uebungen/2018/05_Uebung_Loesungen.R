
## Praktischer Teil -- Termin 5

## Heute lernen wir einen weiteren Datensatz kennen:
## "Die Niedertraechtigen Neun"

## Zunaechst laden wir die Datentabelle ein. Sie
## enthaelt Antworten von 409 Teilnehmenden einer
## Online-Untersuchung. Das sind dieselben Teilnehmer,
## von denen wir auch schon Antworten auf die
## Technophobie-Skala kennen. (Dafuer muessen wir alle
## ein R-Studio Projekt anlegen, damit R-Studio weiss,
## wo es nach der Datei, die die Daten enthaelt, suchen
## muss.)

nn <- read.csv("niedertraechtige_neun.csv") # laedt die Daten

## Die Zuordnung von Spaltennamen zu Items koennt ihr
## der Datei "05_Codebuch.txt" entnehmen. Oeffnet diese
## Datei in RStudio, indem ihr unten rechts auf sie
## klickt. Sie wird unten rechts im Panel des Ordners
## eures RStudio Projekts angezeigt.

## Aufgabe 1

## Exploriert die Daten

## (a) Ueberprueft mit den Funktionen summary und table
## stichprobenartig die Antworten auf die
## Items. `table` kennt ihr schon -- `summary` nimmt
## als Argument einfach den ganzen data.frame an, und
## gibt dafuer deskriptive Statistiken aus. Wie stark faellt
## die Zustimmung auf Items der Skalen Machiavellismus,
## Narzissmus, und Psychopathie aus?

summary(nn)

table(nn$PF18_01)
table(nn$PF18_02)
table(nn$PF18_03)

## (b) Erstellt einen Summenscore fuer die Subskalen
## Machiavellismus, Psychopathis, und Narzissmus.

nn$Machiavellismus <- nn$PF18_01 + nn$PF18_04 + nn$PF18_07
nn$Psychopathie    <- nn$PF18_02 + nn$PF18_05 + nn$PF18_08
nn$Narzissmus      <- nn$PF18_03 + nn$PF18_06 + nn$PF18_09

## (c) Zeigt euch die Verteilungen der Skalenwerte
## jeweils in einem Histogram an

hist(nn$Machiavellismus)

hist(nn$Psychopathie)

hist(nn$Narzissmus)

## (d) Die Funktion plot() zeigt einen Scatterplot von
## zwei Vektoren an. Sie nimmt also als zwei Argumente
## zwei Vektoren an. Betrachtet die Scatterplots, die
## den Zusammenhang zwischen den Variablen
## Machiavellismus, Psychopathis, und Narzissmus
## darstellen.

plot(nn$Psychopathie, nn$Machiavellismus)


## Betrachte:
table(nn$Psychopathie, nn$Machiavellismus)


## etwas schoener:
plot(nn$Psychopathie, nn$Machiavellismus, col = gray(.0, .2),
     pch = 19, xlab = "Psychopathie",
     ylab = "Machiavellismus", las = 1)

plot(nn$Psychopathie, nn$Narzissmus, col = gray(.0, .2),
     pch = 19, xlab = "Psychopathie",
     ylab = "Narzissmus", las = 1)

plot(nn$Machiavellismus, nn$Narzissmus, col = gray(.0, .2),
     pch = 19, xlab = "Machiavellismus",
     ylab = "Narzissmus", las = 1)

## (e) Betrachtet die Korrelationen zwischen der 
## dunklen Triade sowie Verträglichkeit

cor(nn$Psychopathie, nn$Machiavellismus)
cor(nn$Psychopathie, nn$Narzissmus)
cor(nn$Machiavellismus, nn$Narzissmus)

cor(nn$Machiavellismus, nn$Vertraeglichkeit)
cor(nn$Narzissmus, nn$Vertraeglichkeit)
cor(nn$Psychopathie, nn$Vertraeglichkeit)

nn$DunkleTriade <- nn$Machiavellismus + nn$Psychopathie +
    nn$Narzissmus

cor(nn$DunkleTriade, nn$Vertraeglichkeit)

## (f) Korreliert eine der Eigenschaften mit dem Alter?
## Da Alter einen NA Wert enthaelt, muessen wir
## explizit angeben, wie wir damit umgehen wollen. Wir
## moechten die Faelle ausschliessen von der
## Korrelation, die fehlende Werte enthalten. Dafuer
## muessen wir das benannte Argument "use" auf den Wert
## "pairwise.complete.obs" setzen, wenn wir die
## Funktion `cor` aufrufen. Beachtet, dass 
##  "pairwise.complete.obs" tatsaechlich
## in Anfuehrungszeichen gesetzt werden muss.

cor(nn$Psychopathie, nn$alter, use = "pairwise.complete.obs")
cor(nn$Narzissmus, nn$alter, use = "pairwise.complete.obs")
cor(nn$Machiavellismus, nn$alter, use = "pairwise.complete.obs")

## (g) Um die Signifikanz von Korrelationen zu
## bestimmen, koennen wir die Funktion `cor.test`
## verwenden. Ueberprueft, ob das Alter signifikant mit
## einer der drei Variablen korreliert (bei einem
## alpha-Niveau von .05). Erstellt einen Scatterplot
## fuer alle Variablen, die mit Alter signifikant
## korrelieren. Hinweis: Die Funktion `cor.test`
## benoetigt nicht den Parameter "use"!

cor.test(nn$Psychopathie, nn$alter)
cor.test(nn$Narzissmus, nn$alter)
cor.test(nn$Machiavellismus, nn$alter)

plot(nn$alter, nn$Narzissmus, col = gray(.0, .2),
     pch = 19, xlab = "Alter",
     ylab = "Narzissmus", las = 1)

plot(nn$alter, nn$Machiavellismus, col = gray(.0, .2),
     pch = 19, xlab = "Alter",
     ylab = "Machiavellismus", las = 1)



###########################
## Pause zur Besprechung ## 
###########################




############################################
## Weitere Inhalte: Auswahl von Variablen ##
##       Der `:`-Operator und die         ##
##   Funktionen subset() und paste0()     ##
############################################


## Fuer die meisten psychometrischen Analysen macht es
## Sinn, die Antworten auf die untersuchte Skala in
## *einem* data.frame zu speichern. Mit solchen Daten
## koennen wir auf zahlreiche Funktionen aus R
## zurueckgreifen, die uns ermoeglichen psychometrische
## Auswertungen durchzufuehren. D.h. wir sollten die
## Variablen, die nicht zur Skala gehoeren,
## entfernen. Wir lernen jetzt, wie wir Spalten (und
## auch Reihen, d.h. Faelle) aus `data.frames`
## auswaehlen koennen.


######################
## Der `:` Operator ##
######################

## Eine nuetzliche Moeglichkeit, um Vektoren
## aufsteigender, ganzer Zahlen zu erstellen:

1:10

5:-5 # auch absteigend

sum(1:10000)


###########################
## Die Funktion paste0() ##
###########################

## Erstellt einen character Vektor, indem sie
## verschiedene Vektoren zusammengefuegt, etwa:

paste0("item", 1:10)

paste0("PF18_0", 1:9)

## Sollte ich Items aus nur einer Subskala auswaehlen
## wollen:
paste0("PF18_0", c(1, 4, 7))


## Aufgabe 2

## Erstellt mithilfe des `:`-Operators, der [ ] Negativ
## Auswahl und der Funktion paste0() den folgenden
## Vektor:

c("TP1", "TP2", "TP4", "TP5", "TP6", "TP8")


## Zwei Varianten:
paste0("TP", 1:8)[-c(3, 7)]

paste0("TP", (1:8)[-c(3, 7)]) # Klammerung hier noetig!


###########################
## Die Funktion subset() ##
###########################

## Mit der Funktion subset() koennen wir aus
## `data.frames` Zeilen (also Faelle), und Spalten
## (also Messvariablen, etc) auswaehlen.

## Folgendes speichert einen `data.frame` ab, der nur
## die Faelle der weiblichen Teilnehmerinnen enthaelt
## (nutzt logischen Vergleich zur Fallauswahl!)

female <- subset(nn, geschlecht == "weiblich")