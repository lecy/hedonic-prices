## Running Files from GitHub

If you want to run the program straight from GitHub, then do the following:

Load this helper function to read R files from the GitHub pages.

~~~{r}
source_github <- function(u) {
  # load package
  require(RCurl)
 
  # read script lines from website
  script <- getURL(u, ssl.verifypeer = FALSE)
 
  # parase lines and evealuate in the global environement
  eval(parse(text = script), envir= .GlobalEnv)
}
~~~

For example:

~~~{r}

source_github("https://raw.githubusercontent.com/lecy/hedonic-prices/master/Step%2001%20-%20Load%20Housing%20Data.R")

~~~