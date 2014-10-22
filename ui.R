library(shiny)
library(MASS)
# ui.R

# Define UI for dataset viewer application
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Medicare Advantage Penetration in the US"),
        
        # Sidebar with controls to select a dataset and specify the
        # number of observations to view
        sidebarLayout(
                sidebarPanel(
                        sliderInput("pene","Penetration % less than:", min=0, max = 100, value = 25),
                        numericInput("elig", "Number of Eligibles greater than (in thousands):", value = 10)
                        )
                ,
                
                # Show a summary of the dataset and an HTML table with the 
                # requested observations
                mainPanel(
                        dataTableOutput("SumTable")
                )
        )
))