library(shiny)
library(MASS)

Sys.setlocale('LC_ALL','C')

# Define server logic required to create a table
shinyServer(function(input, output) {
        
# Read in the data        
  MA.Enrolled.CBSA <- read.csv("./data/MA_Enrolled_CBSA.csv")
  
  # create data table
        output$SumTable <- renderDataTable({
                 
          MA.Enrolled.CBSA[MA.Enrolled.CBSA$Penetration < (input$pene/100) & MA.Enrolled.CBSA$Eligibles >= (input$elig*1000),2:6]
          
        })
})