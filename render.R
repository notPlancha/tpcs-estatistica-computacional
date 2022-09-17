# I made a new render to get rid of the hack
library(here)
toProcess <- c("tpc2")

for (i in toProcess){
  rmarkdown::render(
    input = here(i, paste0(i, ".rmd")),
    clean = FALSE,
    run_pandoc = FALSE,
    intermediates_dir = here("temp"),
    quiet = TRUE
  )

  system2(
    command = rmarkdown::pandoc_exec(),
    args = paste(
      "-s", here("temp", paste0(i, ".knit.md")),
      "-o", here(i,      paste0(i, ".pdf")),
      "--pdf-engine", paste0(tinytex::tinytex_root(), "\\bin\\win32\\pdflatex.exe"),
      "--template", here("template", "Eisvogel", "eisvogel.latex"),
      "--listings"
    )
  )
  print(paste("File outputed if no errors:", here(i,      paste0(i, ".pdf"))))
}
