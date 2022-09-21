# I made a new render to get rid of the hack
library(here)
toProcess <- commandArgs(TRUE)
if (length(toProcess) == 0) toProcess <- c("tpc1", "tpc2", "tpc3")

for (i in toProcess){
  rmarkdown::render(
    input = here(i, paste0(i, ".rmd")),
    clean = FALSE,
    run_pandoc = FALSE,
    quiet = TRUE,
    intermediates_dir = here("temp")

  )
  print("render of md done")
  system2(
    command = rmarkdown::pandoc_exec(),
    args = paste(
      "-s", here("temp", paste0(i, ".knit.md")),
      "-o", here(i,      paste0(i, ".pdf")),
      "--pdf-engine", paste0(tinytex::tinytex_root(), "\\bin\\win32\\pdflatex.exe"),
      "--template", here("template", "Eisvogel", "eisvogel.latex"),
      "--listings",
      "--resource-path", here(i)
    )
  )
  print(paste("File outputed if no errors:", here(i, paste0(i, ".pdf"))))
}
