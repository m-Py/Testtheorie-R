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

Unter [Übungen](https://github.com/m-Py/Testtheorie-R/tree/master/Uebungen) 
finden sich die R-Quelldateien zur Bearbeitung der Wochenübungen; relevant sind 
hier die Übungen im Unterorder [2020](https://github.com/m-Py/Testtheorie-R/tree/master/Uebungen/2020). 
Der Unterordner [Daten](https://github.com/m-Py/Testtheorie-R/tree/master/Uebungen/Daten) 
enthält die zur Bearbeitung der Übungen nötigen Daten. 

Das Seminarskript kann [hier](https://osf.io/nghyv/) heruntergeladen werden.
Eine online lesbare Version des Skripts findet sich 
[hier](https://m-py.github.io/TesttheorieR/).

## Wochenübersicht

Die folgende Wochenübersicht wird im Verlauf des Semester stetig 
aktualisiert. Sie enthält unter anderem Links zu den Lehrvideos.

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
  + [Ohne Lösungen](https://github.com/m-Py/Testtheorie-R/blob/master/Uebungen/2020/01_Uebung.R)
  + [Mit Lösungen](https://github.com/m-Py/Testtheorie-R/blob/master/Uebungen/2020/01_Uebung_Loesungen.R)
- Relevante Inhalte im Skript: Kapitel 1, Kapitel 2.1 - 2.4

### Woche 2: 04.05. - 10.05.2020

- `R`-Themen: Komponentenweises Verhalten von Vektoren, Logisches UND / ODER, 
Auswahl von Vektorelementen
- Lehrvideos
  + Einführung: https://youtu.be/HiSR0FNLZI8
- Übungsaufgaben: 
  + [Ohne Lösungen](https://github.com/m-Py/Testtheorie-R/blob/master/Uebungen/2020/02_Uebung.R)
- Relevante Inhalte im Skript: Kapitel 2.1, 2.3.2, 2.4.1, 2.5

### Woche 3: 11.05. - 17.05.2020

- `R`-Themen: Fragebogendaten als Tabelle in `R` einlesen, Spalten aus 
Datentabellen auslesen, (relative) Häufigkeiten, Histogramme

### Woche 4: 18.05. - 24.05.2020

- `R`-Themen: 
- Videos:

### Woche 5: 25.05. - 31.05.2020

- `R`-Themen: 
- Videos:

### Woche 6: 01.06. - 07.06.2020

- `R`-Themen: 
- Videos:

### Woche 7: 08.06. - 14.06.2020

- `R`-Themen: 
- Videos:

### Woche 8: 15.06. - 21.06.2020

- `R`-Themen: 
- Videos:

### Woche 9: 22.06. - 28.06.2020

- `R`-Themen: 
- Videos:

### Woche 10: 29.06. - 05.07.2020

- `R`-Themen: 
- Videos:

### Woche 11: 06.07. - 12.07.2020

- `R`-Themen: 
- Videos:

### Woche 12: 13.07. - 19.07.2020

- `R`-Themen: 
- Videos:
