
# setwd( "C:/Users/jdlecy/Documents/GitHub/hedonic-prices" )

source( "Step 05 - Count Nearby Crimes.R" )





dat$school <- dat$elementary + dat$middle + dat$high



m.01 <- lm( price ~ sqft + lot.size +  bath + as.factor(garage) + year + school + as.factor(highway), data=dat )  

options( scipen=6 )

summary( m.01 )



m.02 <- lm( price ~ sqft + lot.size +  bath + as.factor(garage) + year + 
                    school + as.factor(highway) + crime.count + prop.black, data=dat )  

options( scipen=6 )

summary( m.02 )




library( memisc )

mtab <- mtable( 
                "Model 1"=m.01, 
                "Model 2"=m.02, 
                summary.stats=c("R-squared","N", "p"), 
                digits=2 
               )