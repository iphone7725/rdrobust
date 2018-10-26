# rdrobust

The **rdrobust** package provides **Stata** and **R** implementations of statistical inference and graphical procedures for Regression Discontinuity designs employing local polynomial and partitioning methods. It provides point estimators, confidence intervals estimators, bandwidth selectors, automatic RD plots and other related features. This work is supported by the National Science Foundation through grant [SES-1357561](http://www.nsf.gov/awardsearch/showAward?AWD_ID=1357561) and [SES-1459931](http://www.nsf.gov/awardsearch/showAward?AWD_ID=1459931).

This package was first released in 2014, and had a major upgrade in 2016. New features available in the 2016 upgraded version include:  
(i) major speed improvements,   
(ii) covariate-adjusted bandwidth selection, point estimation and robust inference,  
(iii) cluster-robust bandwidth selection, point estimation and robust inference,   
(iv) weighted global polynomial fits and pointwise confidence bands for RD plots, and  
(v) several new bandwidths selectors (e.g., different bandwidths for control and treatment groups, coverage error optimal bandwidths, and optimal bandwidth for fuzzy designs).

For technical and methodological details see:

*   Calonico, Cattaneo and Titiunik (2014): [Robust Nonparametric Confidence Intervals for Regression-Discontinuity Designs](), _Econometrica_ 82(6): 2295-2326. [[Supplemental appendix]()]
*   Calonico, Cattaneo and Titiunik (2015): [Optimal Data-Driven Regression Discontinuity Plots](), _Journal of the American Statistical Association_ 110(512): 1753-1769. [[Supplemental Appendix]()]
*   Calonico, Cattaneo and Farrell (2018): [On the Effect of Bias Estimation on Coverage Accuracy in Nonparametric Inference](), _Journal of the American Statistical Association_ 113(522): 767-779. [[Supplemental Appendix]()]
*   Calonico, Cattaneo, Farrell and Titiunik (2018): [Regression Discontinuity Designs Using Covariates](), _Review of Economics and Statistics_, forthcoming. [[Supplemental Appendix]()]
*   Calonico, Cattaneo and Farrell (2018): [Coverage Error Optimal Confidence Intervals](). [[Supplemental Appendix]()]
*   Calonico, Cattaneo and Farrell (2018): [Optimal Bandwidth Choice for Robust Bias Corrected Inference in Regression Discontinuity Designs](). [[Supplemental Appendix]()]

For software and implementation details see:

*   Calonico, Cattaneo and Titiunik (2014): [Robust Data-Driven Inference in the Regression-Discontinuity Design](), _Stata Journal_ 14(4): 909-946.
*   Calonico, Cattaneo and Titiunik (2015): [**rdrobust**: An R Package for Robust Nonparametric Inference in Regression-Discontinuity Designs](), _R Journal_ 7(1): 38-51.
*   Calonico, Cattaneo, Farrell and Titiunik (2017): [**rdrobust**: Software for Regression Discontinuity Designs](), _Stata Journal_ 17(2): 372-404.

**Implementation in Stata:**

*   To install/update in Stata type:  
```  
· net install rdrobust, from(https://sites.google.com/site/rdpackages/rdrobust/stata) replace replace
```  
  or  
```  
· github install iphone7725/rdrobust
```  
*   Help files: [**rdrobust**](), [**rdbwselect**](), [**rdplot**]() -- Replication files: [do-file](), [data-senate]()
*   Repository for manual installation: [https://sites.google.com/site/rdpackages/rdrobust/stata]()

**Implementation in R:**

*   To install/update in R type:  
```  
· install.packages('rdrobust')
``` 
*   [Manual](https://cran.r-project.org/web/packages/rdrobust/rdrobust.pdf) -- Replication files: [R-script](), [data-senate]()
*   [CRAN repository](https://cran.r-project.org/package=rdrobust)

**Last update**: September 25, 2018.