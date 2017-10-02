* Data Edition with Stata
* -----------------------

sysuse auto, clear

drop if regexm(make, "VW") // will drop all cars by VW
keep make price mpg foreign  // keep only the variables that we use in R to analyze

outsheet using "${path}/1_Stata/outdata/DataFromStata.csv", delimiter(";") replace nolabel   // we could well have used the Stata format but then we would have
                                                                                     // needed the 'foreign' package in R to read it. (Note: this is sometimes
																					 // a bit problematic with the labels, so a call of 'label drop _all' previous to saving helps).
																			         // However, you can never go wrong with a csv file. This allways works with every software.
