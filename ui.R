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
                        sliderInput("pene","Penetration % less than:"
                                    , min=0
                                    , max = 100
                                    , value = 25),
                        numericInput("elig", "Number of Eligibles greater than (in thousands):"
                                     , min = 0
                                     , max = 3103
                                     , value = 10),
                        
                        # adding the new div tag to the sidebar            
                        tags$div(class="header"
                                 ,checked=NA
                                 ,tags$p("Change the values for 'Penetration % less than' using the slider above. This 
                                      is an integer value. So, an input of 25 will return a data set where the percentage enrolled is
                                        less than 25%.")
                                 ,tags$p("Change the values for 'Number of Eligibles greater than (in thousands)' using the input box above. 
                                        This value is in thousands (i.e. 1,000). So, an input of 10 would return a
                                        data set where the number of eligibles were greater than 10,000. ")
                                 ,tags$p("You can also sort the data set by clicking on the header labels. Clicking again
                                         will change the sort order.")
                                 ,tags$p("You may also use the 'Search' box. For example, type in a state abbreviation 
                                         to return a data set with the results from that state.")
                                 ,tags$p("To return the entire data set, set 'Penetration %' to 100% and 
                                         'Number of Eligibles' to zero.")
                        )
                        )
                ,
                
                # Show a summary of the dataset and an HTML table with the 
                # requested observations
                mainPanel(
                        dataTableOutput("SumTable")
                )
        )
))