
# setwd( "C:/Users/jdlecy/Documents/GitHub/hedonic-prices" )

source( "Step 04 - Download Census Data.R" )



### HOW MANY NEARBY CRIMES

# 2014 data downloaded from:  http://www.syracuse.com/crime/police-reports/
# 
# It has been geocoded using block locations:

crime.dat <- read.csv( "Data/crime.lat.lon.csv" )

library( ggmap )

syracuse <- get_map( location='syracuse, ny', zoom = 11, color="bw" ) 

syr.map <- ggmap( syracuse, extent = "device" ) 

syr.map + geom_point( 
                      data=crime.dat, 
                      aes(x=lon, y=lat), 
                      size=3, 
                      col="steel blue", 
                      alpha=0.5     
                    ) 



# reference for distance formula: sqrt( (43.056353-43.062111)^2 + (-76.140454 - -76.128620)^2 )


crime.count <- NULL

for( i in 1:nrow(lat.long) )
{
   lat.i <- lat.long$lat[i]
   lon.i <- lat.long$lon[i]
   
   dist.c <- sqrt( (lat.i - crime.dat$lat)^2 + (lon.i - crime.dat$lon)^2 )
   
   crime.count[i] <- sum( dist.c < 0.01 )
    
}


dat <- cbind( dat, crime.count )




####   MERGE DATA


m.dat <- merge( dat, cen.dat, by.x="tract.id", by.y="tract" )




names( m.dat )

rm( lat.long )