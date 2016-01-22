
### DOWNLOAD CENSUS DATA THROUGH API

# http://www.census.gov/developers/


library(RCurl)
library( jsonlite )

APIkey <- "b431c35dad89e2863681311677d12581e8f24c24"



# use this function to convert json data format to a data frame

json.to.data <- function( x )
{
	a.matrix <- fromJSON(x)  # converts json table to a matrix

	c.names <- a.matrix[ 1 , ]  # column names are the first row

	a.matrix <- a.matrix[ -1 , ]

	my.dat <- data.frame( a.matrix )

	names( my.dat ) <- c.names
	
	return( my.dat )
}



# you need to find variable codes in data dictionary:
    
# poverty: DP03_0119PE
# total pop: DP05_0028E
# pop black: DP05_0033E

fieldnm <- "DP03_0119PE" # poverty
state <- "36"
county <- "067"


resURL <-  paste("http://api.census.gov/data/2013/acs5/profile/?get=",fieldnm,
               "&for=tract:*&in=state:",state,"+county:",county,"&key=",
               APIkey,sep="")


### Fetch the data



poverty <- getURL( resURL, ssl.verifypeer = FALSE )

poverty <- json.to.data( poverty )

# tract.id2 <- paste( poverty$state, poverty$county, poverty$tract, sep="" )




fieldnm <- "DP05_0033E" # black

resURL <-  paste("http://api.census.gov/data/2013/acs5/profile/?get=",fieldnm,
               "&for=tract:*&in=state:",state,"+county:",county,"&key=",
               APIkey,sep="")
               
black <- getURL( resURL, ssl.verifypeer = FALSE )

black <- json.to.data( black )

black <- as.numeric( as.character( black[,1] ) )


fieldnm <- "DP05_0028E" # tot.pop

resURL <-  paste("http://api.census.gov/data/2013/acs5/profile/?get=",fieldnm,
               "&for=tract:*&in=state:",state,"+county:",county,"&key=",
               APIkey,sep="")
               
tot.pop <- getURL( resURL, ssl.verifypeer = FALSE )

tot.pop <- json.to.data(tot.pop)

tot.pop <- as.numeric( as.character( tot.pop[,1] ) )

prop.black <- black / tot.pop


cen.dat <- cbind( poverty, prop.black )

names( cen.dat ) <- c( "poverty", "state", "county", "tract", "prop.black" )

