
library("bookdown")
render("00_Setup.Rmd", "bookdown::pdf_book")
render("00_Setup.Rmd", "bookdown::gitbook",
       output_options = list(css = "style.css"))
