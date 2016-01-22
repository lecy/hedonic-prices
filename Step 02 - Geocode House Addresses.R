
# setwd( "C:/Users/jdlecy/Documents/GitHub/hedonic-prices" )

source( "Step 01 - Load Housing Data.R" )


houses <- dat[ , c("address","zip") ]


houses$address <- gsub( ",", "", houses$address )
houses$address <- gsub( "\\.", "", houses$address )

addresses <- paste( houses$address, "Syracuse, NY", houses$zip, sep=", " )

head( addresses )


library( ggmap )


# translate street address to latitude longitude coordinates
#
# lat.long <- geocode( addresses )
#
# takes about 5 min to run



# pre-geocoded version of dataset for demo

lat.long <- read.csv( "Data/lat.long.csv" )

head( lat.long )





syracuse <- get_map(  
                      location='syracuse, ny', 
                      zoom = 12, 
                      color="bw"
                    ) 



syr.map <- ggmap( 
                  syracuse, 
                  extent = "device"                    
                ) 


                  

syr.map + geom_point( 
                      data=lat.long, 
                      aes(x=lon, y=lat), 
                      size=2, 
                      col="red", 
                      alpha=1     
                    ) 




dat <- cbind( dat, lat.long )

rm( houses )
rm( addresses )