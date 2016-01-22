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

Note that files are chained together, so if you run Step 05, it will automatically run Step 04 to Step 01 recursively.


