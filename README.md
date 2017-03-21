dissem
======



[dissem.in](http://dissem.in/) client

API docs: <http://dev.dissem.in/api.html>

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
diss("10.1016/j.paid.2009.02.013")
#> <dissemin record>
#>   No. records: 1
#>   Title: Refining the conceptualization of a future-oriented self-regulatory behavior: Proactive coping
#>   Type: journal-article
```

## many DOIs


```r
diss(c("10.1016/j.paid.2009.02.013", "10.1186/s40687-015-0044-7"))
#> [[1]]
#> <dissemin record>
#>   No. records: 1
#>   Title: Refining the conceptualization of a future-oriented self-regulatory behavior: Proactive coping
#>   Type: journal-article
#> 
#> [[2]]
#> <dissemin record>
#>   No. records: 1
#>   Title: Proof of the umbral moonshine conjecture
#>   Type: journal-article
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/dissem/issues).
* License: MIT
* Get citation information for `dissem` in R doing `citation(package = 'dissem')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
