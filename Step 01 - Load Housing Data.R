

# load package to read URL data
library( RCurl )

# address of google spreadsheet
my.url <- "https://docs.google.com/spreadsheets/d/1W0vM5sCRhZjkQh6A0WGV8j1rhQAjecCrQW7PguHft-E/pub?gid=1989082857&single=true&output=csv"

housing.raw <- getURL( my.url, ssl.verifypeer=FALSE )

dat <- read.csv( textConnection(housing.raw), stringsAsFactors=FALSE )

head( dat )


# RENAME VARIABLES

names( dat ) <- c("timestamp","price","X1","X2","sqft","your.name","lot.size","beds",
                  "bath","garage","year","elementary","middle","high","walk","tax","highway",
                  "restaurant","starbucks","park","mall","address","zip","tract" )


# remove commas from numbers

dat$price <- as.numeric( gsub( ",","", dat$price ) )
dat$tax <- as.numeric( gsub( ",","", dat$tax ) )
dat$lot.size <- as.numeric( gsub( ",","", dat$lot.size ) )
dat$sqft <- as.numeric( gsub( ",","", dat$sqft ) )

dat$lot.size[ is.na( dat$lot.size ) ] <- mean( dat$lot.size, na.rm=T )
               