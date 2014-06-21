# ui.R
# Author: Raman Raja
# This is the user interface code for the Tiny Shiny web application.
# It is hosted at https://ramanraja.shinyapps.io/shiny2/

library(shiny)

shinyUI(pageWithSidebar (
	# Application title
  	headerPanel("Tiny Shiny App"),
  
  	# Sidebar with a drop down box for the model to be fitted
  	sidebarPanel(
    		selectInput("id1", "Choose a model:", 
                choices = c("Linear", "Quadratic")),
    		helpText("Choose a model and click the button to view the fitted curve overlaid on the scatter plot"),
		# button to activate the model
    		submitButton("Show Model Fit")
  	),
   
	# Show a plot of the original data and the model
  	mainPanel(
		h2 ('Regression Analysis'),
     	h3 ('Car Weight Vs Mileage'),
    		plotOutput("distPlot"),
     	p ('This scatter plot shows the regression between car weight and miles per gallon (mpg).'),
     	p ('For more details:'),
     	a (href='Readme.html', 'click here')
  	)
))
