# Outcome Analysis Plan

I'm outlining my outcome analysis before I perform it for Massachusetts.  After performing on Massachusetts, I will reevaluate before performing for Kentucky and Tennessee.  Modifications and adjustments to the plan will be recorded.

Prior to this, different matching schemes were evaluated for balance.  I was attempting to replicate or closely reproduce the Sommers, et al. analysis for Massachusetts with an attempt to expand it to Kentucky and Tennessee.  A generalized linear model fit using the binomial family and the logit link were fit.  Based on the balance between the control and treatment groups formed, I recommend full matching using this model, retaining 1/4 of the potential control units.  Other than limiting the size of the control group, there were no other constraints placed on the match.  Balance assessment was weighted by population size, and the chi-square statistic was used to take into account the multiple testing aspect of the sample.

A procedure for the basic outcome analysis follows:

- [x]	Examine graphically how mortality rate and insurance rates change by year within the control group (unweighted and potentially weighted by fm weighting), treatment group, and nationally.

- [x]	Fit five OLS models to predict the mortality rate for each of the five outcome years (2006-2010), using baseline (2000-2005) and treatment variables as the predictors

- [x]	Variable selection for the OLS models; variables of interest are the matching groups as dummy variables, treatment variable as dummy variable, and baseline variables.  Treatment variable must be included.  Selected variables should be consistent for all models (at least within a state, preferred for all).

- [x]	Examine the coefficient of the treatment variable.  Look for any patterns through the years.  Do these patterns follow what we would expect if the act were effective?  If a clear pattern exists, look into methods to limit the coefficient space in a multivariate regression.  

- [x]	Explore the same models of the last three parts using generalized estimating equations (geepack).  Compare with the OLS versions of the  models.

- [x]	Variable selection process for the GEE models, similar to OLS.

- [x]	Examine how the coefficient of the treatment variable changes throughout the models.  Explore similar questions as before.  Look into fitting a multivariate model with multiple outcome variables.




