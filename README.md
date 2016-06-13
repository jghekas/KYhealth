# KYhealth

This provides the primary code, results, and additional information on a project to replicate analysis produced by Sommers, et al. and expanding the analysis to include the Southern States.  

A list of basic analytical steps are:

- [x]	Obtain CDC datasets

- [x]	Fit PS model to Massachusetts with limited dataset

- [x]	Obtain and merge AHRF data with CDC datasets

- [x]	Obtain historical AHRF/ARF data to use as baseline 

- [x]	Fit PS model to Kentucky with full data and create a matching/stratification scheme, first draft 

- [x]	Apply similar analyses as before to Tennessee, first draft

- [x]	Collaborator feedback on PS and post-matching analysis options for KY 

- [x]	Collaborator feedback on PS and post-matching analysis options for TN 

- [x]   Decision on matching and balance schemes to be pursued

- [ ]	Outcome analysis between control and treatment Massachusetts groups 

- [ ]	Collaborators' thoughts on follow up analyses to be performed 




Currently, the files within the github site are:
allhealth.R
arfarfsixteen.csv
ky_code.Rmd
Mass Table 2.Rmd
mass_code.Rmd
massrep.Rmd
Outcomes.md
README.md
tn_code.Rmd

allhealth.R 
contains the code used for the setup for all three states.  Code at the beginning of this document provides the process to create the data frames used throughout the analysis.  I have assumed at the beginning of the remaining code that the data frames have been created and begin by loading in the appropriately formatted code.  The paths to the downloaded data from the CDC and the ARF variables will need to be changed on a different computer.

arfarfsixteen.csv 
contains the ARF variables that are merged into the data frame in allhealth.R.

ky_code.Rmd
contains different matching schemes.  Balance assessments on the matching schemes were used for comparison.  Overall, full matching seemed to perform best

Mass Table 2.Rmd
contains an attempt to calculate the numbers found in Table 2.  Weighted and unweighted averages were calculated for 2005, 2006, 2001-2005, and 2001-2006.  

mass_code.Rmd
contains the code used to create the data frame for Massachusetts (along with assumptions built into the calculations).  It also contains a balance assessment for a control group consisting of the counties within the top quartile of propensity scores, following Sommers, et al.

massrep.Rmd
contains an attempt to directly replicate the analysis performed by Sommers, et al.  The contents of Mass Table 2.Rmd supplement this material.  This starts after the setup presented in allhealth.R.  Balance assessments with and without population weighting were examined for 2005 and 2006 treated as the baseline year.   

Outcomes.md
contains steps to be followed in the outcome analysis, written before beginning the outcome analysis.  This was performed first for Massachusetts, then followed by Kentucky and Tennessee.

README.md
contains the basic analysis steps and a list of the files with brief descriptions on the github site.

tn_code.Rmd
contains the code to generate the data frame for Tennessee.  It also includes a handful of matching schemes (top quartile and full matching) along with their balance assessments.