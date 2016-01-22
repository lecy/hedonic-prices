# hedonic-prices

The following was a class exercise in an urban policy course to estimate impact of neighborhood characteristics on home prices.

Home price data was collected from Zillow and entered into a Google form:

https://docs.google.com/forms/d/13RWJ9LR3mFbQBNsX9bnLt5XRotfmZKxkwetYzh-h-oA/viewform

The data is read into R and combined with census data and crime data to perform analysis on factors that impact home prices.


You will need the following packages, if not already installed:

~~~{r}

install.packages( "RCurl" )
install.packages( "ggmap" )
install.packages( "jsonlite" )
install.packages( "memisc" )


~~~


## Instructions

1. Download this file directory to your local computer.

2. Open R and set your working directory to the directory from step 1.

3. Run any step by sourcing it.

~~~{r}
source( "Step 05.02 - Regressions.R" )
~~~




## Running Files from GitHub

Alternatively, if you want to run the program straight from GitHub, then do the following:

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

Run all of the steps in order:

~~~{r}

source_github("https://raw.githubusercontent.com/lecy/hedonic-prices/master/Step%2001%20-%20Load%20Housing%20Data.R")
source_github("https://raw.githubusercontent.com/lecy/hedonic-prices/master/Step%2001.01%20-%20Graph%20Relationships.R")
source_github("https://raw.githubusercontent.com/lecy/hedonic-prices/master/Step%2002%20-%20Geocode%20House%20Addresses.R")
source_github("https://raw.githubusercontent.com/lecy/hedonic-prices/master/Step%2003%20-%20Match%20House%20Address%20to%20Census%20Tract.R")
source_github("https://raw.githubusercontent.com/lecy/hedonic-prices/master/Step%2004%20-%20Download%20Census%20Data.R")
source_github("https://raw.githubusercontent.com/lecy/hedonic-prices/master/Step%2005%20-%20Count%20Nearby%20Crimes.R")
source_github("https://raw.githubusercontent.com/lecy/hedonic-prices/master/Step%2005.01%20-%20Graph%20Demographic%20Predictors.R")
source_github("https://raw.githubusercontent.com/lecy/hedonic-prices/master/Step%2005.02%20-%20Regressions.R")

~~~