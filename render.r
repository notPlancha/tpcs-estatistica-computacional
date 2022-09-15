library(tools)
library(base)

templateFile <- ("template/Eisvogel/eisvogel.latex")
renderName <- ("tpc1")
tempPath <- ("temp.rmd")

orig <- readLines(paste0(renderName, "/", renderName, ".rmd"))
toTemp <- stringr::str_replace_all(orig, pattern = "TEMPLATEPATH", file_path_as_absolute(templateFile))
writeLines(toTemp, tempPath)

rmarkdown::render(tempPath, clean = TRUE, output_file = paste0(renderName, "/", renderName, ".pdf"))

fs::file_delete(tempPath)