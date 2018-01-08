dissem
======



[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/ropenscilabs/dissem.svg?branch=master)](https://travis-ci.org/ropenscilabs/dissem)
[![codecov.io](https://codecov.io/github/ropenscilabs/dissem/coverage.svg?branch=master)](https://codecov.io/github/ropenscilabs/dissem?branch=master)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/dissem)](https://github.com/metacran/cranlogs.app)

[dissem.in](https://dissem.in/) client

API docs: <https://dev.dissem.in/api.html>

## Install

Development version


```r
devtools::install_github("ropenscilabs/dissem")
```


```r
library("dissem")
```

## single DOI


```r
diss_dois("10.1016/j.paid.2009.02.013")
#> [[1]]
#> <dissemin record>
#>   No. records: 5
#>   Title: Refining the Conceptualization of an Important Future-Oriented Self-Regulatory Behavior: Proactive Coping
#>   Type: journal-article
```

## many DOIs


```r
diss_dois(c("10.1016/j.paid.2009.02.013", "10.1186/s40687-015-0044-7"))
#> [[1]]
#> <dissemin record>
#>   No. records: 5
#>   Title: Refining the Conceptualization of an Important Future-Oriented Self-Regulatory Behavior: Proactive Coping
#>   Type: journal-article
#> 
#> [[2]]
#> <dissemin record>
#>   No. records: 2
#>   Title: Proof of the Umbral Moonshine Conjecture
#>   Type: journal-article
```

## search


```r
(res <- diss_search(query = "cellular biology"))
#> <dissemin records>
#>   Papers found: 1990
#>   Papers returned: 20
#>   (see `x$papers` for results)
#>   Stats: 
#>        id value                          label
#> 1      oa   118   Available from the publisher
#> 2      ok   511      Available from the author
#> 3 couldbe   858 Could be shared by the authors
#> 4     unk   465 Unknown/unclear sharing policy
#> 5  closed    38      Publisher forbids sharing
```

dig into individual results


```r
res$papers[1:2]
#> [[1]]
#> <dissemin record>
#>   No. records: 2
#>   Title: Molecular and cellular analysis of immunity in the phytoplasma vector Euscelidius variegatus: exploiting immunity to improve biological control strategies
#>   Type: journal-article
#> 
#> [[2]]
#> <dissemin record>
#>   No. records: 2
#>   Title: A cellular model for the investigation of depot-specific human adipocyte biology
#>   Type: journal-article
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/dissem/issues).
* License: MIT
* Get citation information for `dissem` in R doing `citation(package = 'dissem')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
