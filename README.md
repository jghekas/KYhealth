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


Read me and outlining files:

README.md, Outcomes.md


ARF variable files:

arfarfsixten.csv for 2006 and 2010, arf08vars.csv for years prior to 2009, arf12vars.csv for years prior to 2012


Prep files:

mass_prep.Rmd, src, Rprofile-env-vars-template.txt


Matching scheme files:

mass_code.Rmd, ky_code.Rmd, tn_code.Rmd


Sommers direct replication files:

mass_Table_2.Rmd, massrep.Rmd


allhealth.R contains the setup of the data frames as well as some exploration (mostly visual) of outcomes.