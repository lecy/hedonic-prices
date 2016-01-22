
# setwd( "C:/Users/jdlecy/Documents/GitHub/hedonic-prices" )

source( "Step 05 - Count Nearby Crimes.R" )




### PLOT DEMOGRAPHIC VARIABLES VS HOME PRICES



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





pdf( "Results/Demographic Factors.pdf" )


# CRIME

plotFun( x1=dat$crime.count, x2=dat$price, lab1="Num of Nearby Crimes", lab2="House Price" )



# POVERTY

pov.vec <- as.numeric( as.factor( dat$poverty ) )

plotFun( x1=pov.vec, x2=dat$price, lab1="Poverty Rate", lab2="House Price" )



# BLACK

plotFun( x1=dat$prop.black, x2=dat$price, lab1="Proportion of Population Black", lab2="House Price" )


dev.off()


