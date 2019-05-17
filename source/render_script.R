
## Um das Skript zu generieren, muss wie folgt ein Datensatz heruntergeladen werden
## und in diesem Verzeichnis abgelegt werden:

## Unter https://openpsychometrics.org/_rawdata/
## -> Zeile "Answers to the Narcissistic Personality Inventory, constructed with the version from Raskin and Terry (1988)."
## -> Spalte "Download"
## -> zip-Datei entpacken und die Datei "data.csv" hier im Verzeichnis ablegen

## Dann diesen Code ausführen:
library("rmarkdown")
library("bookdown")
render("00_Setup.Rmd", "bookdown::pdf_book")
render("00_Setup.Rmd", "bookdown::gitbook",
       output_options = list(css = "style.css"))
