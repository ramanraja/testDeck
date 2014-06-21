# server.R
# Author: Raman Raja
# This is the server logic for the Tiny Shiny web application.
# It is hosted at https://ramanraja.shinyapps.io/shiny2/

library(shiny)
data(mtcars)

shinyServer(function(input, output) {
	output$distPlot <- renderPlot({
  	if (input$id1=="Linear"){
	     # draw the scatter plot
	     plot(mtcars$wt, mtcars$mpg, pch=19, main="Linear Model", 
	     	xlab="Weight (1000 lb)", ylab="Miles per Gallon")
	     # fit a linear model
	     lm1 = lm(mtcars$mpg~mtcars$wt)
		# draw the regression line
	     abline(lm1, col="red", lwd=2)
	     # compute sum of square errors and display
	     res = resid(lm1)
	     err = round(sum(res^2),1)
	     legend ("topright", legend=paste("LS Error:", err), cex=1.5)
     }
     else {
        # scatter plot again
	   plot(mtcars$wt, mtcars$mpg, pch=19, main="Quadratic Model",
	         xlab="Weight (1000 lb)", ylab="Miles per Gallon")
	   # fit a quadratic model
	   lm1 = lm(mtcars$mpg~mtcars$wt + I(mtcars$wt^2))
	   pr1 = predict(lm1)
	   # it is essential to plot them in the sorted order
	   ord = order(mtcars$wt)
	   lines(mtcars$wt[ord], pr1[ord], col="red", lwd=2)
	   # compute least square errors and display
	   res = resid(lm1)
	   err = round(sum(res^2),1)
	   legend ("topright", legend=paste("LS Error:", err), cex=1.5)        
	   }
	})
})
