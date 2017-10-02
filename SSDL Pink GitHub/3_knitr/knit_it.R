library(knitr)
setwd("PATH OF THIS FOLDER")

# Step 1: Knit the Latex document, means generate a file executable by a latex processor
#         Outcome: report.tex
knit("report.Rnw")

# Step 2: Generate a nice PDF document
#         Outcome: report.pdf
library(tools)
texi2dvi("report.tex", pdf = TRUE)

# Clean up what latex has left behind in the directoy
file.remove("report.aux","report.log","report.out")
