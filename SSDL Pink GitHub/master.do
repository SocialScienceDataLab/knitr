* Master File Creating a One-Click Solution to Generating an Entire Report
* ------------------------------------------------------------------------


* Define Environment
* ------------------

set more off
glo path  "PATH OF THIS FOLDER"

global Rterm_path    `"C:/Program Files/R/R-3.3.2/bin/x64/Rterm.exe"'  // Globally define where R is located for use of 'rsource'
global Rterm_options `"--vanilla"'                                     // potentially, install rsource first: ssc install rsource


cd ${path}





* Step 1: Stata -> Data Edition
* ----------------------------- ++

do "${path}/1_Stata/edition.do"



* Step 2: R -> Data Analysis and Visualization
* -------------------------------------------- ++

rsource using "${path}/2_R/analysis.R"   // the paths also have to be correctly specified in the Rfile



* Step 3: knitr (also R) -> Analysis Output in PDF Document
* --------------------------------------------------------- ++

rsource using "${path}/3_knitr/knit_it.R"   // the paths also have to be correctly specified in the Rfile


