


# create plot function with desired aesthetics

plotFun <- function( x1, x2=price, lab1, lab2="House Price" )
{

	plot( x1, x2,
	      pch=19, 
	      col=gray(0.6, alpha = 0.2), 
	      cex=3.5,  
	      bty = "n",
	      xlab=lab1, 
	      ylab=lab2, cex.lab=1.5 )

	lines( lowess(x2~x1), col="red", lwd=3 )

}






# CREATE GRAPHS AND SAVE AS PDF


dir.create( "Results" ) # set up a results directory



pdf( "./Results/Predictors of Price.pdf" )


# HOUSE SIZE (SQFT)

plotFun( x1=dat$sqft, x2=dat$price, lab1="Size (Square Feet)", lab2="House Price" )


# LOT SIZE

plotFun( x1=dat$lot.size, x2=dat$price, lab1="Lot Size (Square Feet)", lab2="House Price", xlim=c(0,20000) )



# AGE vs PRICE

plotFun( x1=(2014-dat$year), x2=dat$price, lab1="Age (Years)", lab2="House Price" )



# AGE vs SIZE

plotFun( x1=(2014-dat$year), x2=dat$sqft, lab1="Age (Years)", lab2="Size (Square Feet)" )



# WALK SCORE

plotFun( x1=dat$walk, x2=dat$price, lab1="Walk Score", lab2="House Price" )



# SCHOOL

school <- dat$elementary + dat$middle + dat$high

plotFun( x1=school, x2=dat$price, lab1="School Quality", lab2="House Price" )



# DIST TO RESTAURANT

plotFun( x1=dat$restaurant, x2=dat$price, lab1="Dist to Good Restaurant", lab2="House Price" )



# DIST TO STARBUCKS

plotFun( x1=dat$starbucks, x2=dat$price, lab1="Distance to Starbucks", lab2="House Price" )



# DIST TO PARK

plotFun( x1=dat$park, x2=dat$price, lab1="Dist to Park", lab2="House Price" )



# DIST TO Mall

plotFun( x1=dat$restaurant, x2=dat$price, lab1="Dist to Mall", lab2="House Price" )





plot( as.factor(dat$garage), dat$price, ylab="House Price", xlab="Garage" )
tapply( dat$price, as.factor(dat$garage), mean )


plot( as.factor(dat$bath), dat$price, ylab="House Price", xlab="Number of Bathrooms", cex.lab=1.5 )
tapply( dat$price, as.factor(dat$bath), mean )


plot( as.factor(dat$beds), dat$price, ylab="House Price", xlab="Number of Bedrooms", cex.lab=1.5 )
tapply( dat$price, as.factor(dat$beds), mean )


plot( as.factor(dat$highway), dat$price, ylab="House Price", xlab="Near a Highway?", cex.lab=1.5 )
tapply( dat$price, as.factor(dat$highway), mean )



dev.off()  # end of pdf call

