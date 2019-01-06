
#!/bin/sh

# Diese Datei baut eine pdf- und html-Bookdown-Version des Skripts
# und schiebt die html-Dateien in ein anderes git-Repo, wo sie
# veröffentlicht werden

# Diese Datei kann per chmod +x build.sh ausführbar gemacht werden
# Dann ausführen per ./build.sh

# 1. Skript bauen
Rscript render_script.R

# 2. pdf verschieben und umbenennen
mv 01_Einstieg.pdf "../Testtheorie mit R.pdf"

## html-bookdown erstellen

# 3. html-Dateien umbenennen und verschieben verschieben
mv einstieg.html index.html
shopt -s globstar # damit das Kommando darunter funktioniert
mv **/*.html ../../m-Py.github.io/TesttheorieR

# 4. Libraries und Bilder-Dateien für html-Dokumente verschieben
# Alte Versionen löschen
rm -r ../../m-Py.github.io/TesttheorieR/01_Einstieg_files
rm -r ../../m-Py.github.io/TesttheorieR/libs

mv 01_Einstieg_files ../../m-Py.github.io/TesttheorieR
mv libs ../../m-Py.github.io/TesttheorieR

# 5. Kopiere Bilderordner in anderes Repo
cp -r images ../../m-Py.github.io/TesttheorieR
