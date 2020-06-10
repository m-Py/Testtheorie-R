# Testtheorie mit R

## Informationen zum Online-Seminar im Sommersemester 2020

Dozent: [Dr. Martin Papenberg](https://m-py.github.io/about/)

Diese Seite enthält Informationen zum **Mastermodul B, Psychologie, 
Heinrich-Heine Universität Düsseldorf: Diagnostik: Testtheorie und 
Testkonstruktion, Vertiefung**.

Das Seminar »Testtheorie mit R« bietet einen Einstieg in die 
statistische Programmiersprache `R`. `R` kann -- unter anderem -- als 
eine Alternative zur kommerziellen Statistik-Software IBM-SPSS verwendet 
werden. Anders als SPSS ist `R` *frei*, d.h. wir können es gratis aus 
dem Internet runterladen, auf beliebig vielen Computern installieren, 
und unsere Analysen mit jeder anderen Person teilen, da niemand eine 
Lizenz zur Nutzung benötigt. Da `R` mithilfe von *Paketen* beliebig 
erweitert werden kann, stehen neue statistische Verfahren häufig schnell 
zur Verfügung (etwa *Bayesianische Statistik*). Die Nutzung von `R` ist 
in den letzten Jahren [stark
angestiegen](https://stackoverflow.blog/2017/10/10/impressive-growth-r/).
Auch in der psychologischen Forschung [wird `R` immer mehr zum
Standard](https://www.psychologicalscience.org/observer/why-you-should-become-a-user-a-brief-introduction-to-r).

Lernziel des Seminars ist das Kennenlernen von `R` als Werkzeug zur 
Datenauswertung, sowie die Anwendung von `R` zur Berechnung basaler 
testtheoretischer Kennwerte (z.B.: Item-Schwierigkeiten, Trennschärfen, 
Reliabilität). Im Mittelpunkt der steht die Analyse verschiedener 
Persönlichkeitsinventare. Nach einer Einführung in die Grundlagen von 
`R` werden unter anderem echte Daten des Big-Five-Inventory-10 und des 
Narcissistic Personality Inventory ausgewertet. **Es sind keinerlei 
Vorkenntnisse in R nötig oder erwartet!**

Wegen der Corona-Pandemie findet das Seminar »Testtheorie mit R« im 
Sommersemester 2020 nicht als Präsenzveranstaltung im Rechenzentrum der 
Universität Düsseldorf statt, sondern als reine Onlineveranstaltung.

## Benötigte Software

Zur Teilnahme am Seminar ist es notwendig, `R` auf einem eigenen Rechner 
/ Laptop zu installieren. Dafür müssen zwei frei verfügbare Programme 
installiert werden:

- `R`, abgerufen von https://cran.r-project.org/
- RStudio, abgerufen von https://www.rstudio.com/products/rstudio/download/#download

Wir nutzen `R` durch Starten der Software RStudio, wenn sowohl `R` als 
auch RStudio installiert sind. Mehr Infos zur Installation finden sich 
[hier](https://m-py.github.io/TesttheorieR/einstieg.html#erste-schritte-mit-r). 

- Ausführlichere Informationen zu den Bedienemelemten in RStudio:
  + https://bookdown.org/ndphillips/YaRrr/the-four-rstudio-windows.html
  + https://r-intro.tadaa-data.de/book/orientierung.html

Anstatt RStudio gibt es auch andere Umgebungen, in denen mit R gearbeitet werden 
kann. Alternativen sind beispielsweise [rkward](https://rkward.kde.org/) oder 
[emacs ESS](https://ess.r-project.org/); es steht allen Teilnehmenden frei, sich 
für eine dieser Optionen zu entscheiden.

Falls Probleme bei der Installation auftreten, können diese auch nach 
Start des Seminars noch geklärt werden (in den letzten Jahren hat die 
Installation immer bei allen Studierenden problemlos funktioniert).

## Unterlagen

Die Seminarunterlagen werden im [Open Science Repository](https://osf.io/y4a6k/) 
zur Verfügung gestellt. Die Links zu den Übungsdateien sind unten in der 
Wochenübersicht enthalten.

Das Seminarskript kann [hier](https://osf.io/nghyv/) heruntergeladen werden.
Eine online lesbare Version des Skripts findet sich 
[hier](https://m-py.github.io/TesttheorieR/).

## Wochenübersicht

Die folgende Wochenübersicht wird im Verlauf des Semester stetig 
aktualisiert. Sie enthält unter anderem Links zu den Lehrvideos. Die angegebenen 
Kapitelnummern beziehen sich auf die Skriptversion vom 08.05.2020 oder später.

Link zur Playlist mit allen Lehrvideos: 

https://www.youtube.com/watch?v=tVonpUScEaA&list=PLPJmqr3FiKzBdYK724v2bi7NtdRMqe1he

### Woche 1: 27.04. - 03.05.2020

- `R`-Themen: Einfache Berechnungen, Vektoren, Variablen, einfache statistische 
Funktionen, Logische Vergleiche
- Lehrvideos
  + Einführung: https://www.youtube.com/watch?v=tVonpUScEaA
  + Lösungen zu den Übungsaufgaben: https://youtu.be/-PtpxbYGVxw
  + Fragen und Antworten: https://youtu.be/cSnmr4XZsTU
- Übungsaufgaben: 
  + [Ohne Lösungen](https://osf.io/hpszn/)
  + [Mit Lösungen](https://osf.io/qudhe/)
- Relevante Inhalte im Skript: Kapitel 1, Kapitel 2.1 - 2.4

### Woche 2: 04.05. - 10.05.2020

- `R`-Themen: Komponentenweises Verhalten von Vektoren, Logisches UND / ODER, 
Auswahl von Vektorelementen
- Lehrvideos
  + Einführung: https://youtu.be/HiSR0FNLZI8
  + Lösungen zu den Aufgaben: https://youtu.be/0A1bKKrdR4c 
  + Fragen und Antworten: https://youtu.be/sDSOrRz2WB4 
- Übungsaufgaben: 
  + [Ohne Lösungen](https://osf.io/yknf8/)
  + [Mit Lösungen](https://osf.io/z9yhe/)
- Relevante Inhalte im Skript: Kapitel 2.1, 2.3.2, 2.4.2, 2.5

### Woche 3: 11.05. - 17.05.2020

- `R`-Themen: Fragebogendaten als `data.frame` in `R` einlesen, Spalten aus 
Datentabellen auslesen, Exploration eines Datensatzes (deskriptive Statistiken 
etc.), fehlende Werte, Invertierung von Itemwerten, Histogramme
- Lehrvideos
  + Einführung: https://youtu.be/ah2xLar3xxg
  + Bearbeitung der Übungen + Antworten auf Fragen: https://youtu.be/m6nw97_LW8M (Mitschnitt eines Livestreams)
- Übungsaufgaben
  + [Ohne Lösungen](https://osf.io/svhc8/)
  + [Mit Lösungen](https://osf.io/w7abv/)
- Datensatz
  + [technophobie.csv](https://osf.io/95pev/)
- Relevante Inhalte im Skript: Kapitel 2.3, 2.4.1, 2.4.4, Kapitel 3 (bis 
einschließlich Kapitel 3.2), Kapitel 5.2 (nicht mehr Kapitel 5.2.1)

### Woche 4: 18.05. - 24.05.2020

- `R`-Themen: Auswahl von Zeilen und Spalten mit der `[·,·]`-Notation;
der Doppelpunktoperator; die Funktion `paste0()`; die Funktionen `cor()`, 
`rowSums()` und `colMeans()` für basale psychmetrische Auswertungen
- Lehrvideos
  + Einführung: https://youtu.be/u04el97pGWg 
  + Lösungen zu den Aufgaben: https://youtu.be/CAoriVMQD-U 
- Übungsaufgaben
  + [Ohne Lösungen](https://osf.io/a4qyv/)
  + [Mit Lösungen](https://osf.io/8bn6q/)
- Datensatz
  + [technophobie.csv](https://osf.io/95pev/)
- Relevante Inhalte im Skript: Kapitel 2.3.1, 2.4, 3.3, Kapitel 4 (bis 
einschließlich 4.3)

### Woche 5: 25.05. - 31.05.2020

- `R`-Themen: Auswahl von Zeilen und Spalten fortgesetzt: Die Funktion 
`subset()`; Funktionsargumente; die `R`-Hilfe
- Lehrvideos
  + Einführung: https://youtu.be/YKAP2WvJhvI 
  + Lösungen zu den Aufgaben: https://youtu.be/cAxCdGk1Upk 
- Datensatz
  + [niedertraechtige_neun.csv](https://osf.io/ca7we/)
  + [Codebuch](https://osf.io/umcg6/)
- Übungsaufgaben
  + [Ohne Lösungen](https://osf.io/zh6p3/)
  + [Mit Lösungen](https://osf.io/mx3b7/)
- Relevante Inhalte im Skript: Kapitel 3.4, Kapitel 6 (bis einschließlich 
Kapitel 6.2)

### Woche 6: 01.06. - 07.06.2020

- `R`-Themen: psychometrische Auswertungen; externe Pakete (`psych` und 
`psychometric`); die Funktionen `alpha()` und `item.exam()`; der doppelte 
Doppelpunktoperator
- Lehrvideos
  + Einführung: https://youtu.be/NXv-mfBEuMg 
  + Lösungen zu den Aufgaben: https://youtu.be/h5jMkDb0-SE
- Datensatz
  + [niedertraechtige_neun.csv](https://osf.io/ca7we/)
  + [Codebuch](https://osf.io/umcg6/)
- Übungsaufgaben
  + [Ohne Lösungen](https://osf.io/ymj59/)
  + [Mit Lösungen](https://osf.io/k6abe/)
- Relevante Inhalte im Skript: Kapitel [2.6](https://m-py.github.io/TesttheorieR/vektoren.html#praezedenz), 
[3.6.4](https://m-py.github.io/TesttheorieR/dataframes.html#zusammenfassung-aller-spalten-hilfe-aus-zusatzpaketen), 
[4.4](https://m-py.github.io/TesttheorieR/psychometrie.html#trennschaerfe),
[4.5](https://m-py.github.io/TesttheorieR/psychometrie.html#cronbachs-alpha),
[4.7](https://m-py.github.io/TesttheorieR/psychometrie.html#in-der-praxis-nutzung-von-zusatzpaketen)



### Woche 7: 08.06. - 14.06.2020

- `R`-Themen: Einen Rohdatensatz bereinigen und für die Analyse vorbereiten: 
Fehlende Fälle als `NA` definieren; Funktionen zum Umgang mit `NA`; Fälle mit 
fehlenden Werten ausschließen; kategoriale Variablen definieren mit der Funktion 
`factor()`; Ueberpruefung der Plausibilitaet von Antworten
- Lehrvideos:
  + Einführung: https://youtu.be/vP5wklxzrAs
  + Lösungen: https://youtu.be/U2KtZH97H0M 
- Übungsaufgaben
  + [Ohne Lösungen](https://osf.io/k8tyf/)
  + [Mit Lösungen](https://osf.io/naujb/)
- Datensatz und Codebuch: Antworten auf die BIG-5, abzurufen unter 
  https://openpsychometrics.org/_rawdata/
- Relevante Inhalte im Skript: Kapitel 2.3, 3.6.4, Kapitel 5.2, 5.3

### Woche 8: 15.06. - 21.06.2020

- `R`-Themen: R Markdown
- Videos:

### Woche 9: 22.06. - 28.06.2020

**Wiederholung** der bisherigen Inhalte

### Woche 10: 29.06. - 05.07.2020

- Einübung praktischer Datenauswertungen 
- Fragen und Antworten 

### Woche 11: 06.07. - 12.07.2020

- Einübung praktischer Datenauswertungen 
- Fragen und Antworten 

### Woche 12: 13.07. - 19.07.2020

- Einübung praktischer Datenauswertungen 
- Fragen und Antworten 
