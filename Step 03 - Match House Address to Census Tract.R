
# setwd( "C:/Users/jdlecy/Documents/GitHub/hedonic-prices" )

source( "Step 02 - Geocode House Addresses.R" )





### MATCH GEOCODED ADRESSES TO A CENSUS TRACT

# to add census data we need to associate a house with a census tract

# use census API:

# # https://transition.fcc.gov/form477/censustracts.html



require( RCurl )



tract.id <- NULL

for( i in 1:nrow(lat.long) )
{

	print( i )
	
	aURL <- paste( "http://data.fcc.gov/api/block/2010/find?latitude=",lat.long$lat[i],"&longitude=",lat.long$lon[i], sep="" )

	x <- getURL( aURL )

	start.here <- regexpr( "Block FIPS", x )

	this.one <- substr( x, (start.here+12), (start.here+26) )

	# FIPS: 360670040001007  36=state, 067=county, 004000=census.tract 1007=block.group

	tract.id[i] <- substr( this.one, 6, 11 )

}





# combine house data with lat lon coordinates and census tract IDs

dat <- cbind( dat, tract.id )

rm( tract.id )

rm( lat.long )
