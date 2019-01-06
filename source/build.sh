
#!/bin/sh

# Diese Datei baut eine pdf- und html-Bookdown-Version des Skripts
# und schiebt die html-Dateien in ein anderes git-Repo, wo sie
# veröffentlicht werden

# Diese Datei kann per chmod +x build.sh ausführbar gemacht werden
# Dann ausführen per ./build.sh

# 1. Skript bauen (pdf und html)
Rscript render_script.R

# 2. pdf verschieben und umbenennen
mv 01_Einstieg.pdf "../Testtheorie mit R.pdf"

# 3. html-Dateien kopieren und verschieben
cp einstieg.html index.html
shopt -s globstar # damit das Kommando in der Folgezeile funktioniert
mv **/*.html ../../m-Py.github.io/TesttheorieR

# 4. Libraries und Bilder-Dateien für html-Dokumente verschieben
# 4a.Alte Versionen löschen
rm -r ../../m-Py.github.io/TesttheorieR/01_Einstieg_files
rm -r ../../m-Py.github.io/TesttheorieR/libs

# 4b. Neue Version einfügen
mv 01_Einstieg_files ../../m-Py.github.io/TesttheorieR
mv libs ../../m-Py.github.io/TesttheorieR

# 5. Kopiere Bilderordner in anderes Repo
cp -r images ../../m-Py.github.io/TesttheorieR

# 6. Kopiere style-css in anderes Repo
cp style.css ../../m-Py.github.io/TesttheorieR/style.css
