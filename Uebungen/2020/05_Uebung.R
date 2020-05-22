
###########################
## Termin 5 Uebungsblatt ##
###########################

## Neue Inhalte heute:

# - Neuer Datensatz: Die Dunkle Triade
# - Mehr zu Datenauswahl in data.frames: Die Funktion `subset()`
# - Mehr zu Funktionen in R: Funktionsargumente, die R-Hilfe

################################################################################


# Heute lernen wir einen weiteren Datensatz kennen: "Die
# Niedertraechtigen Neun"

# Zunaechst laden wir die Datentabelle ein. Sie enthaelt Antworten von
# 409 Teilnehmenden einer Online-Untersuchung. Das sind dieselben
# Teilnehmer, von denen wir auch schon Antworten auf die
# Technophobie-Skala kennen.

nn <- read.csv("niedertraechtige_neun.csv")
head(nn)

# Die Zuordnung von Spaltennamen zu Items koennt ihr der Datei
# "Codebuch_NN.txt" entnehmen. Oeffnet diese Datei in RStudio, indem
# ihr unten rechts auf sie klickt. Sie wird unten rechts im Panel des
# Ordners eures RStudio Projekts angezeigt.

###########################
## Die Funktion subset() ##
###########################

# Siehe Kapitel 3.4 im Skript

# Die Funktion `subset()` ist eine weitere Moeglichkeit, Zeilen und
# Spalten aus data.frames auszulesen. Die allgemeine Syntax der
# Funktion `subset()` ist folgende:

# subset(data.frame, Zeilenauswahl, Spaltenauswahl) # kein legaler R-Code

# Beispiel:
subset(nn, nn$alter > 60, c("casenum", "alter"))

# Dabei findet die Zeilenauswahl mit einer logischen Bedingung statt,
# die Spaltenauswahl per Spaltenname (was etwa nicht geht: Position
# der Zeilen angeben)




# Warum ist das nuetzlich? Die Funktion `subset()` vereinfacht manche
# Zugriffe, erlaubt uns etwa logische Bedingungen fuer die
# Zeilenauswahl zu formulieren, ohne die $-Notation zu verwenden:

subset(nn, alter > 60) 
# Statt:
subset(nn, nn$alter > 60)


# (fast) aequivalente Ausgabe mit der [.,.]-Notation:
nn[nn$alter > 60, ] # upps, siehe Skript Kap. 3.4.4
nn[which(nn$alter > 60), ] # vermutlich besser

# Bei logischen Verknüpfungen kann das recht angenehm sein:

subset(nn, alter > 40 & geschlecht == "maennlich" & Vertraeglichkeit > 3)

# Die Ausgabe der Funktion `subset()` ist immer ein data.frame.


####################
## Spaltenauswahl ##
####################

# Die allgemeine Syntax der Funktion `subset()`:

# subset(data.frame, Zeilenauswahl, Spaltenauswahl)

subset(nn, select = c("casenum", "alter"))

zweispalten <- subset(nn, select = c("casenum", "alter"))
head(zweispalten)

# Merke: Hier musste ich das Argument zur Auswahl der Spalten
# benennen!


# Erklaerung: Argumente in Funktionen haben Namen. Ich kann Argumente
# anhand ihrer Position oder ihres Namens ansteuern. Wir haben Namen
# schon verwendet: etwa das Argument `na.rm` von `mean()`, sowie
# verschiedene Argumente in `hist()` und `t.test()`

# In subset gibt es drei Argumente mit den folgenden Namen:

# 1. x: ein data.frame
# 2. subset: Ein logischer Ausdruck, der die Faelle auswaehlt
# 3. select: Die Namen der Spalten, die wir auswaehlen wollen

?subset
?t.test
?mean

# Argumente werden von R per Position oder per Name erkannt. Wenn ich
# den Namen angebe, ist es klar, welches Argument angesteuert wird und
# ich kann das Argument an einer beliebigen Stelle setzen. Deswegen
# funktionieren folgende Aufrufe, die aequivalent zu oben sind:

subset(nn, select = c("casenum", "alter"))

subset(
  nn, 
  select = c("casenum", "alter"), 
  subset = alter > 60
)

subset(
  select = c("casenum", "alter"), 
  x = nn, 
  subset = alter > 60
)

subset(
  subset = alter > 60, 
  select = c("casenum", "alter"), 
  x = nn
)


# Das Argument x wuerden wir normalerweise nicht benennen; das erste
# Argument einer Funktion sind eigentlich immer die Daten, mit denen
# ich etwas anstellen moechte. Die weiteren Argumente steuern genaue
# Funktionsweise der Funktion; sie wuerde man eher
# benennen. [Argumente explizit zu benennen ist oftmals gute Praxis.]


# Bezug zwischen der Funktion subset und der [.,.]-Notation: 
# Argument `subset` entspricht der Auswahl *vor* dem Komma.
# Argument `select` entspricht der Auswahl *nach* dem Komma. 


# Es gibt weitere Vereinfachungen, die uns subset() bietet. Etwa:

items <- subset(nn, select = PF18_01:PF18_09) # von links nach rechts
head(items)

# Dringende Empfehlung: Kapitel 3.4 im Skript lesen. Auch Infos zu 
# Funktionsargumenten im Frage-&-Antwort-Video aus Woche 2: 
# https://youtu.be/sDSOrRz2WB4 (ab Minute 11:25)

###############
## Aufgabe 0 ##
###############

# Lest das Codebuch zum neuen Datensatz

###############
## Aufgabe 1 ##
###############

# Berechnet folgende Test-Summenwerte fuer die drei Eigenschaften
# Machiavellismus, Psychopathie und Narzissmus und haengt die
# drei Summenwerte an den data.frame `nn` an.

# Hinweis: Berechnet jeden Summenwert *dreimal*:
# 1. Indem ihr die `+`-Operation auf die Items anwendet
# 2. Indem ihr `rowSums()` auf die Item-Spalten anwendet; die 
#    Spalten habt ihr dabei mit der [.,.]-Notation ausgelesen
# 3. Indem ihr `rowSums()` auf die Item-Spalten anwendet; die 
#    Spalten habt ihr dabei mit der Funktion `subset()` ausgelesen

## (a) Machiavellismus


## (b) Psychopathie


## (c) Narzissmus


###############
## Aufgabe 2 ##
###############

# Waehlt aus dem data.frame nn die 9 Spalten mit den Items zu den
# Niedertraechtigen Neun aus; speichert die Auswahl in einer neuen
# Variablen.

# Hinweis: Macht es einmal mit der [.,.]-Notation, einmal mit der
# Funktion `subset()`



# (b) Berechnet einen Summenscore fuer die gesamte Dunkle Triade (also
# ueber alle 9 Items). Nutzt fuer die Berechnung des Scores den data.frame 
# aus Aufgabenteil (a). Speichert den Summenscore als Spalte von `nn` ab.



###############
## Aufgabe 3 ##
###############

# Nutzt bei dieser Aufgabe entweder die [.,.]-Notation oder die
# Funktion `subset()`, je nachdem womit ihr euch am wohlsten fuehlt
# (aber am besten beides einmal!).

# (a) Erstellt einen data.frame, der alle Faelle enthaelt, deren
# Summenwert fuer die Dunkle Triade (alle ueber alle 12 Items) ueber
# dem Median liegen. Speichert diesen data.frame in einer neuen
# Variablen ab.



# (b) Wie viele Faelle hat der in Aufgabenteil (a) erstellte
# data.frame? Welchem relativen Anteil im Verhaeltnis zur
# Gesamtstichprobe antspricht das?



# (c) Erstellt einen data.frame, der alle Personen enthaelt, die in
# mindestens einer der 3 dunklen Eigenschaften ueber dem Median liegen



# (d) Wie viele Faelle hat der in Aufgabenteil (c) erstellte
# data.frame? Welchem relativen Anteil im Verhaeltnis zur
# Gesamtstichprobe antspricht das?



# (e) Erstellt einen data.frame, der alle Personen enthaelt, die in
# allen der 3 dunklen Eigenschaften ueber dem Median liegen




# (f) Wie viele Faelle hat der in Aufgabenteil (e) erstellte
# data.frame? Welchem relativen Anteil im Verhaeltnis zur
# Gesamtstichprobe antspricht das?



###############
## Aufgabe 4 ##
###############

# (a) Bestimmt die paarweisen Korrelation zwischen den drei dunklen
# Eigenschaften Machiavellismus, Psychopathie und Narzissmus. Nutzt
# dafuer *einen* Aufruf der Funktion `cor()`.

# (Nutzt bei dieser Aufgabe entweder die [.,.]-Notation oder die
# Funktion `subset()`, je nachdem womit ihr euch am wohlsten fuehlt
# - aber am besten beides einmal!)


# (b) Rechercheaufgabe: Wie koennen wir einen (oder mehrere)
# Scatterplots erstellen, der die Zusammenhaenge zwischen den dunklen
# Eigenschaften grafisch veranschaulicht?


###############
## Aufgabe 5 ##
###############

# Rechercheaufgabe: Was ist das Argument `var.equal` der Funktion 
# `t.test()`? Welches Verhalten steuert es?


##################
## Bonusaufgabe ##
##################

# Gibt es wieder eine Person, die in allen Items die volle Zustimmung
# angegeben hat? Ist es dieselbe Person, die auch im
# Technophobie-Datensatz allen Items voll zugestimmt hat?
