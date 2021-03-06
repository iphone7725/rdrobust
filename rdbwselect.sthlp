{smcl}
{* *! version 7.6.0  09-25-2018}{...}
{viewerjumpto "Syntax" "rdbwselect##syntax"}{...}
{viewerjumpto "Description" "rdbwselect##description"}{...}
{viewerjumpto "Options" "rdbwselect##options"}{...}
{viewerjumpto "Examples" "rdbwselect##examples"}{...}
{viewerjumpto "Saved results" "rdbwselect##saved_results"}{...}

{title:Title}

{p 4 8}{cmd:rdbwselect} {hline 2} Bandwidth Selection Procedures for Local Polynomial Regression Discontinuity Estimators.{p_end}

{marker syntax}{...}
{title:Syntax}

{p 4 8}{cmd:rdbwselect } {it:depvar} {it:indepvar} {ifin} 
[{cmd:,} 
{cmd:c(}{it:#}{cmd:)} 
{cmd:fuzzy(}{it:fuzzyvar [sharpbw]}{cmd:)}
{cmd:deriv(}{it:#}{cmd:)}
{cmd:p(}{it:#}{cmd:)}  
{cmd:q(}{it:#}{cmd:)}
{cmd:covs(}{it:covars}{cmd:)}
{cmd:kernel(}{it:kernelfn}{cmd:)}
{cmd:weights(}{it:weightsvar}{cmd:)}
{cmd:bwselect(}{it:bwmethod}{cmd:)}
{cmd:vce(}{it:vcetype [vceopt1 vceopt2]}{cmd:)}
{cmd:scaleregul(}{it:#}{cmd:)}
{cmd:all}
]{p_end}

{synoptset 28 tabbed}{...}

{marker description}{...}
{title:Description}

{p 4 8}{cmd:rdbwselect} implements bandwidth selectors for local polynomial Regression Discontinuity (RD) point estimators and inference procedures developed in
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Titiunik_2014_ECMA.pdf":Calonico, Cattaneo and Titiunik (2014a)},
{browse "https://sites.google.com/site/nppackages/nprobust/Calonico-Cattaneo-Farrell_2018_JASA.pdf":Calonico, Cattaneo and Farrell (2018)},
and {browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Farrell-Titiunik_2018_RESTAT.pdf":Calonico, Cattaneo, Farrell and Titiunik (2018)}.{p_end}

{p 8 8} Companion commands are: {help rdrobust:rdrobust} for point estimation and inference procedures, and {help rdplot:rdplot} for data-driven RD plots (see
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Titiunik_2015_JASA.pdf":Calonico, Cattaneo and Titiunik (2015a)} for details).{p_end}

{p 8 8}A detailed introduction to this command is given in
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Titiunik_2014_Stata.pdf":Calonico, Cattaneo and Titiunik (2014b)},
and {browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Farrell-Titiunik_2017_Stata.pdf":Calonico, Cattaneo, Farrell and Titiunik (2017)}. A companion {browse "www.r-project.org":R} package is also described in
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Titiunik_2015_R.pdf":Calonico, Cattaneo and Titiunik (2015b)}.{p_end}

{p 4 8}Related Stata and R packages useful for inference in RD designs are described in the following website:{p_end}

{p 8 8}{browse "https://sites.google.com/site/rdpackages/":https://sites.google.com/site/rdpackages/}{p_end}


{marker options}{...}
{title:Options}

{p 4 8}{cmd:c(}{it:#}{cmd:)} specifies the RD cutoff for {it:indepvar}.
Default is {cmd:c(0)}.{p_end}

{p 4 8}{cmd:fuzzy(}{it:fuzzyvar [sharpbw]}{cmd:)} specifies the treatment status variable used to implement fuzzy RD estimation (or Fuzzy Kink RD if {cmd:deriv(1)} is also specified).
Default is Sharp RD design and hence this option is not used.
If the option {it:sharpbw} is set, the fuzzy RD estimation is performed using a bandwidth selection procedure for the sharp RD model. This option is automatically selected if there is perfect compliance at either side of the threshold.
{p_end}

{p 4 8}{cmd:deriv(}{it:#}{cmd:)} specifies the order of the derivative of the regression functions to be estimated.
Default is {cmd:deriv(0)} (for Sharp RD, or for Fuzzy RD if {cmd:fuzzy(.)} is also specified). Setting {cmd:deriv(1)} results in estimation of a Kink RD design (up to scale), or Fuzzy Kink RD if {cmd:fuzzy(.)} is also specified.{p_end}

{p 4 8}{cmd:p(}{it:#}{cmd:)} specifies the order of the local polynomial used to construct the point estimator.
Default is {cmd:p(1)} (local linear regression).{p_end}

{p 4 8}{cmd:q(}{it:#}{cmd:)} specifies the order of the local polynomial used to construct the bias correction.
Default is {cmd:q(2)} (local quadratic regression).{p_end}

{p 4 8}{cmd:covs(}{it:covars}{cmd:)} specifies additional covariates to be used for estimation and inference.{p_end}

{p 4 8}{cmd:kernel(}{it:kernelfn}{cmd:)} specifies the kernel function used to construct the local-polynomial estimator(s). Options are: {opt tri:angular}, {opt epa:nechnikov}, and {opt uni:form}.
Default is {cmd:kernel(triangular)}.{p_end}

{p 4 8}{cmd:weights(}{it:weightsvar}{cmd:)} is the variable used for optional weighting of the estimation procedure. The unit-specific weights multiply the kernel function.{p_end}

{p 4 8}{cmd:bwselect(}{it:bwmethod}{cmd:)} specifies the bandwidth selection procedure to be used. 
Options are:{p_end}
{p 8 12}{opt mserd} one common MSE-optimal bandwidth selector for the RD treatment effect estimator.{p_end}
{p 8 12}{opt msetwo} two different MSE-optimal bandwidth selectors (below and above the cutoff) for the RD treatment effect estimator.{p_end}
{p 8 12}{opt msesum} one common MSE-optimal bandwidth selector for the sum of regression estimates (as opposed to difference thereof).{p_end}
{p 8 12}{opt msecomb1} for min({opt mserd},{opt msesum}).{p_end}
{p 8 12}{opt msecomb2} for median({opt msetwo},{opt mserd},{opt msesum}), for each side of the cutoff separately.{p_end}
{p 8 12}{opt cerrd} one common CER-optimal bandwidth selector for the RD treatment effect estimator.{p_end}
{p 8 12}{opt certwo} two different CER-optimal bandwidth selectors (below and above the cutoff) for the RD treatment effect estimator.{p_end}
{p 8 12}{opt cersum} one common CER-optimal bandwidth selector for the sum of regression estimates (as opposed to difference thereof).{p_end}
{p 8 12}{opt cercomb1} for min({opt cerrd},{opt cersum}).{p_end}
{p 8 12}{opt cercomb2} for median({opt certwo},{opt cerrd},{opt cersum}), for each side of the cutoff separately.{p_end}
{p 8 12}Note: MSE = Mean Square Error; CER = Coverage Error Rate.{p_end}
{p 8 12}Default is {cmd:bwselect(mserd)}. For details on implementation see
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Titiunik_2014_ECMA.pdf":Calonico, Cattaneo and Titiunik (2014a)},
{browse "https://sites.google.com/site/nppackages/nprobust/Calonico-Cattaneo-Farrell_2018_JASA.pdf":Calonico, Cattaneo and Farrell (2018)},
and {browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Farrell-Titiunik_2018_RESTAT.pdf":Calonico, Cattaneo, Farrell and Titiunik (2018)},
and the companion software articles.{p_end}

{p 4 8}{cmd:vce(}{it:vcetype [vceopt1 vceopt2]}{cmd:)} specifies the procedure used to compute the variance-covariance matrix estimator.
Options are:{p_end}
{p 8 12}{cmd:vce(nn }{it:[nnmatch]}{cmd:)} for heteroskedasticity-robust nearest neighbor variance estimator with {it:nnmatch} indicating the minimum number of neighbors to be used.{p_end}
{p 8 12}{cmd:vce(hc0)} for heteroskedasticity-robust plug-in residuals variance estimator without weights.{p_end}
{p 8 12}{cmd:vce(hc1)} for heteroskedasticity-robust plug-in residuals variance estimator with {it:hc1} weights.{p_end}
{p 8 12}{cmd:vce(hc2)} for heteroskedasticity-robust plug-in residuals variance estimator with {it:hc2} weights.{p_end}
{p 8 12}{cmd:vce(hc3)} for heteroskedasticity-robust plug-in residuals variance estimator with {it:hc3} weights.{p_end}
{p 8 12}{cmd:vce(nncluster }{it:clustervar [nnmatch]}{cmd:)} for cluster-robust nearest neighbor variance estimation using with {it:clustervar} indicating the cluster ID variable and {it: nnmatch} matches indicating the minimum number of neighbors to be used.{p_end}
{p 8 12}{cmd:vce(cluster }{it:clustervar}{cmd:)} for cluster-robust plug-in residuals variance estimation with degrees-of-freedom weights and {it:clustervar} indicating the cluster ID variable.{p_end}
{p 8 12}Default is {cmd:vce(nn 3)}.{p_end}

{p 4 8}{cmd:scaleregul(}{it:#}{cmd:)} specifies scaling factor for the regularization term added to the denominator of the bandwidth selectors. Setting {cmd:scaleregul(0)} removes the regularization term from the bandwidth selectors.
Default is {cmd:scaleregul(1)}.{p_end}

{p 4 8}{cmd:all} if specified, {cmd:rdbwselect} reports all available bandwidth selection procedures.{p_end}

    {hline}


{marker examples}{...}
{title:Example: Cattaneo, Frandsen and Titiunik (2015) Incumbency Data}

    
{p 4 8}Setup{p_end}
{p 8 8}{cmd:. use rdrobust_senate.dta}{p_end}

{p 4 8}MSE bandwidth selection procedure{p_end}
{p 8 8}{cmd:. rdbwselect vote margin}{p_end}

{p 4 8}All bandwidth bandwidth selection procedures{p_end}
{p 8 8}{cmd:. rdbwselect vote margin, all}{p_end}


{marker saved_results}{...}
{title:Saved results}

{p 4 8}{cmd:rdbwselect} saves the following in {cmd:e()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:e(N_l)}}number of observations to the left of the cutoff{p_end}
{synopt:{cmd:e(N_r)}}number of observations to the right of the cutoff{p_end}
{synopt:{cmd:e(c)}}cutoff value{p_end}
{synopt:{cmd:e(p)}}order of the polynomial used for estimation of the regression function{p_end}
{synopt:{cmd:e(q)}}order of the polynomial used for estimation of the bias of the regression function estimator{p_end}

{synopt:{cmd:e(h_mserd)}}     MSE-optimal bandwidth selector for the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(h_msetwo_l)}}  MSE-optimal bandwidth selectors below the cutoff for the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(h_msetwo_r)}}  MSE-optimal bandwidth selectors above the cutoff for the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(h_msesum)}}    MSE-optimal bandwidth selector for the sum of regression estimates.{p_end}
{synopt:{cmd:e(h_msecomb1)}}   for min({opt mserd},{opt msesum}).{p_end}
{synopt:{cmd:e(h_msecomb2_l)}} for median({opt msetwo},{opt mserd},{opt msesum}), below the cutoff.{p_end}
{synopt:{cmd:e(h_msecomb2_r)}} for median({opt msetwo},{opt mserd},{opt msesum}), above the cutoff.{p_end}

{synopt:{cmd:e(h_cerrd)}}     CER-optimal bandwidth selector for the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(h_certwo_l)}}  CER-optimal bandwidth selectors below the cutoff for the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(h_certwo_r)}}  CER-optimal bandwidth selectors above the cutoff for the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(h_cersum)}}    CER-optimal bandwidth selector for the sum of regression estimates.{p_end}
{synopt:{cmd:e(h_cercomb1)}}   for min({opt cerrd},{opt cersum}).{p_end}
{synopt:{cmd:e(h_cercomb2_l)}} for median({opt certwo_l},{opt cerrd},{opt cersum}), below the cutoff.{p_end}
{synopt:{cmd:e(h_cercomb2_r)}} for median({opt certwo_r},{opt cerrd},{opt cersum}), above the cutoff.{p_end}

{synopt:{cmd:e(b_mserd)}}     MSE-optimal bandwidth selector for the bias of the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(b_msetwo_l)}}  MSE-optimal bandwidth selectors below the cutoff for the bias of the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(b_msetwo_r)}}  MSE-optimal bandwidth selectors above the cutoff for the bias of the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(b_msesum)}}    MSE-optimal bandwidth selector for the sum of regression estimates for the bias of the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(b_msecomb1)}}   for min({opt mserd},{opt msesum}).{p_end}
{synopt:{cmd:e(b_msecomb2_l)}} for median({opt msetwo},{opt mserd},{opt msesum}), below the cutoff.{p_end}
{synopt:{cmd:e(b_msecomb2_r)}} for median({opt msetwo},{opt mserd},{opt msesum}), above the cutoff.{p_end}

{synopt:{cmd:e(b_cerrd)}}     CER-optimal bandwidth selector for the bias of the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(b_certwo_l)}}  CER-optimal bandwidth selectors below the cutoff for the bias of the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(b_certwo_r)}}  CER-optimal bandwidth selectors above the cutoff for the bias of the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(b_cersum)}}    CER-optimal bandwidth selector for the sum of regression estimates for the bias of the RD treatment effect estimator.{p_end}
{synopt:{cmd:e(b_cercomb1)}}   for min({opt cerrd},{opt cersum}).{p_end}
{synopt:{cmd:e(b_cercomb2_l)}} for median({opt certwo_l},{opt cerrd},{opt cersum}), below the cutoff.{p_end}
{synopt:{cmd:e(b_cercomb2_r)}} for median({opt certwo_r},{opt cerrd},{opt cersum}), above the cutoff.{p_end}

{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:e(runningvar)}}name of running variable{p_end}
{synopt:{cmd:e(outcomevar)}}name of outcome variable{p_end}
{synopt:{cmd:e(clustvar)}}name of cluster variable{p_end}
{synopt:{cmd:e(covs)}}name of covariates{p_end}
{synopt:{cmd:e(vce_select)}}vcetype specified in vce(){p_end}
{synopt:{cmd:e(bwselect)}}bandwidth selection choice{p_end}
{synopt:{cmd:e(kernel)}}kernel choice{p_end}


{title:References}

{p 4 8}Calonico, S., M. D. Cattaneo, and M. H. Farrell. 2018.
{browse "https://sites.google.com/site/nppackages/nprobust/Calonico-Cattaneo-Farrell_2018_JASA.pdf":On the Effect of Bias Estimation on Coverage Accuracy in Nonparametric Inference}.
{it:Journal of the American Statistical Association}, 113(522): 767-779.{p_end}

{p 4 8}Calonico, S., M. D. Cattaneo, M. H. Farrell, and R. Titiunik. 2017.
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Farrell-Titiunik_2017_Stata.pdf":rdrobust: Software for Regression Discontinuity Designs}.
{it:Stata Journal}, 17(2): 372-404.{p_end}

{p 4 8}Calonico, S., M. D. Cattaneo, M. H. Farrell, and R. Titiunik. 2018.
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Farrell-Titiunik_2018_RESTAT.pdf":Regression Discontinuity Designs using Covariates}.
{it:Review of Economics and Statistics}, forthcoming.{p_end}

{p 4 8}Calonico, S., M. D. Cattaneo, and R. Titiunik. 2014a.
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Titiunik_2014_ECMA.pdf":Robust Nonparametric Confidence Intervals for Regression-Discontinuity Designs}.
{it:Econometrica} 82(6): 2295-2326.{p_end}

{p 4 8}Calonico, S., M. D. Cattaneo, and R. Titiunik. 2014b.
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Titiunik_2014_Stata.pdf":Robust Data-Driven Inference in the Regression-Discontinuity Design}.
{it:Stata Journal} 14(4): 909-946.{p_end}

{p 4 8}Calonico, S., M. D. Cattaneo, and R. Titiunik. 2015a.
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Titiunik_2015_JASA.pdf":Optimal Data-Driven Regression Discontinuity Plots}.
{it:Journal of the American Statistical Association} 110(512): 1753-1769.{p_end}

{p 4 8}Calonico, S., M. D. Cattaneo, and R. Titiunik. 2015b.
{browse "https://sites.google.com/site/rdpackages/rdrobust/Calonico-Cattaneo-Titiunik_2015_R.pdf":rdrobust: An R Package for Robust Nonparametric Inference in Regression-Discontinuity Designs}.
{it:R Journal} 7(1): 38-51.{p_end}

{p 4 8}Cattaneo, M. D., B. Frandsen, and R. Titiunik. 2015.
{browse "https://sites.google.com/site/rdpackages/rdlocrand/Cattaneo-Frandsen-Titiunik_2015_JCI.pdf":Randomization Inference in the Regression Discontinuity Design: An Application to Party Advantages in the U.S. Senate}.
{it:Journal of Causal Inference} 3(1): 1-24.{p_end}


{title:Authors}

{p 4 8}Sebastian Calonico, University of Miami, Coral Gables, FL.
{browse "mailto:scalonico@bus.miami.edu":scalonico@bus.miami.edu}.{p_end}

{p 4 8}Matias D. Cattaneo, University of Michigan, Ann Arbor, MI.
{browse "mailto:cattaneo@umich.edu":cattaneo@umich.edu}.{p_end}

{p 4 8}Max H. Farrell, University of Chicago, Chicago, IL.
{browse "mailto:max.farrell@chicagobooth.edu":max.farrell@chicagobooth.edu}.{p_end}

{p 4 8}Rocio Titiunik, University of Michigan, Ann Arbor, MI.
{browse "mailto:titiunik@umich.edu":titiunik@umich.edu}.{p_end}


