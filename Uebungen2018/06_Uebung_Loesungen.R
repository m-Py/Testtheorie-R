
## Praktischer Teil -- Termin 6

## Heute arbeiten wir mit den "Die Niedertraechtigen Neun"
## Datensatz weiter

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

## Wir wollen direkt auch Scores fuer Psychopathie,
## Machiavellismus und Narzissmus an den data.frame
## anhaengen:

nn$Machiavellismus <- nn$PF18_01 + nn$PF18_04 + nn$PF18_07
nn$Psychopathie    <- nn$PF18_02 + nn$PF18_05 + nn$PF18_08
nn$Narzissmus      <- nn$PF18_03 + nn$PF18_06 + nn$PF18_09
nn$DunkleTriade    <- nn$Machiavellismus + nn$Psychopathie + nn$Narzissmus

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

## Speichere einen `data.frame` ab, der nur die Spalten
## "casenum" und "alter" enthaelt:

bla <- subset(nn, select = c("casenum", "alter"))

## (Merke: Hier musste ich das Argument zur Auswahl der
## Spalten benennen!)

## Speichere einen `data.frame` ab, der nur die Spalten
## "casenum", und "alter" der ueber 50 jaehrigen
## enthaelt:

bla2 <- subset(nn, alter > 50, select = c("casenum", "alter"))

## Wichtig: Achtet hier darauf, dass ich bei "alter >
## 5" auf die Spalte "alter" zugreifen kann, ohne die
## $-Notation zu verwenden! (Das ist auch unten in den
## Uebungen relevant)

## Erklaerung: Argumente in Funktionen haben Namen
## (siehe Skript) Ich kann Argumente anhand ihrer
## Position oder ihres Namens ansteuern. Wir haben
## Namen schon verwendet: etwa `na.rm` in mean(), `use`
## in cor(), oder verschiedene Moeglichkeiten Graphiken
## schoener zu machen mit plot() und hist().

## In subset gibt es drei Argumente mit den folgenden
## Namen:

# 1. x: ein data.frame
# 2. subset: Ein logischer Ausdruck, der die Faelle auswaehlt
# 3. select: Die Namen der Zeilen, die wir auswaehlen wollen

## Deswegen funktionieren folgende Aufrufe, die
## aequivalent zu oben sind:

subset(nn, select = c("casenum", "alter"), subset = alter > 50)

subset(select = c("casenum", "alter"), x = nn, subset = alter > 50)

subset(subset = alter > 50, select = c("casenum", "alter"), x = nn)

## Vielleicht hier noch mal bedenken: was passiert,
## wenn ich das Ergebnis von dem subset() Aufruf nicht
## in einer Varialblen speichere -> es ist wichtig zu
## verstehen, was das heisst

##############
## Uebungen ##
##############



## Aufgabe 1

## (a) Erstellt einen `data.frame`, der nur die Spalten
## der Niedertraechtigen Neun Skala enthaelt (speichert
## ihn in einer neuen Variable ab). Nutzt die
## Funktionen subset, paste0 und den
## `:`-Operator. (siehe letztes Uebungsblatt)

items <- subset(nn, select = paste0("PF18_0", 1:9))

## (b) Erstellt einen data.frame, der alle Faelle
## enthaelt, die in der Eigenschaft Psychopathie ueber
## dem Median liegen

high_psychopaths <- subset(nn, Psychopathie > median(Psychopathie))

## (c) Wie viele Faelle hat der soeben erstellte
## data.frame?

nrow(high_psychopaths) ## etwa die Haelfte aller Faelle

## (d) Erstellt einen data.frame, der alle Faelle
## enthaelt, die in allen drei dunklen Eigenschaften
## ueber dem Median liegen

highly_dark <- subset(nn, Psychopathie > median(Psychopathie) &
                          Narzissmus > median(Narzissmus) & 
                          Machiavellismus > median(Machiavellismus))

## (e) Wie viele Faelle enthaelt der soeben erstellte
## data.frame? Wie viel Prozent der Gesamtstichprobe
## sind das?

nrow(highly_dark) ## Die dunklen Personen
nrow(highly_dark) / nrow(nn)

## (f) Wie ist das Geschlechterverhaeltnis unter den
## dunklen Personen, die wir in (e) ausgewaehlt
## haben. Unterscheidet es sich deskriptiv vom
## Geschlechterverhaeltnis in der Gesamtstichprobe?

table(highly_dark$geschlecht)
17 / (17 + 55)

table(nn$geschlecht)
89 / (89 + 320)


#################
## Besprechung ##
#################

## Aufgabe 2

## Die Funktion `cor` kann man auch verwenden, indem
## man ihr einen einzelnen data.frame uebergibt (in dem
## Fall muessen alle Spalten numerisch sein). Dann wird
## einem eine Korrelationsmatrix ausgegeben, die die
## Korrelationen zwischen allen Spalten, d.h. in
## unserem Fall Items, enthaelt. Uebergebt den in
## Aufgabe 1 (a) erstellten data.frame an die Funktion
## cor() und betrachtet den output.

cor(items)

## Das ist nicht so uebersichtlich: mit der Funktion
## `round` koennen wir die Zahl der Nachkommastellen
## begrenzen.

round(cor(items), 2)


## Aufgabe 3

## (a) Die Funktion `colMeans` gibt fuer einen
## data.frame fuer jede Spalte den Mittelwert aus (das
## geht aber nur dann, wenn alle Spalten numerisch
## sind, also etwa dann, wenn wir nur Itemantworten
## vorliegen haben wie im data.frame aus Aufgabe
## 2). Bestimme alle "Itemschwierigkeiten", indem du
## colMeans auf den data.frame anwendest, der die
## Item-Antworten enthaelt (also den du in Aufgabe 1
## erstellt hast).

colMeans(items)

## (b) analog funktionieren auch die Funktionen
## colSums, rowMeans, und rowSums - was koennten diese
## wohl machen? Nutze die Funktion rowSums auf den
## data.frame, der die Item-Antworten enthaelt; dieser
## Aufruf ergibt dann fuer jede/n Teilnehmer/in der
## Studie einen Summenwert ueber alle Items der
## niedertraechtigen Neun.

rowSums(items)

## Was habt ihr gerade berechnet?

## Aufgabe 4

## Nutzt die Funktionen subset und rowMeans, um einen
## mittleren Score fuer Machiavellismus, Psychopathie
## und Narzissmus zu erstellen. Haengt diese Scores an
## den data.frame `nn` als Spalte an.

mac_items <- subset(nn, select = paste0("PF18_0", c(1, 4, 7)))
psy_items <- subset(nn, select = paste0("PF18_0", c(2, 5, 8)))
nar_items <- subset(nn, select = paste0("PF18_0", c(3, 6, 9)))

nn$Mean_Machiavellismus <- rowMeans(mac_items)
nn$Mean_Psychopathie    <- rowMeans(psy_items)
nn$Mean_Narzissmus      <- rowMeans(nar_items)

## Bonusfrage: Was ergibt folgender Aufruf?

nn$Mean_Narzissmus == nn$Narzissmus / 3
