

library(shiny)
library(ggplot2)
library(reshape2)
library(tidyr)



ui <- fluidPage(
   
   # Application title
   titlePanel("Future Savings"),
   
   # widgets
   fluidRow(
     
     column(4,
            sliderInput(inputId = "initial",
                        label = "Initial Amount",
                        min = 1, max = 100000, value = 1000, step = 500),
            sliderInput(inputId = "annual",
                        label = "Annual Contribution",
                        min = 0, max = 50000, value = 2000, step = 500)
      ),
     
     column(4,
            sliderInput(inputId = "return",
                        label = "Return Rate (in %)",
                        min = 0, max = 20, value = 5, step = 0.1),
            sliderInput(inputId = "growth",
                        label = "Growth Rate (in %)",
                        min = 0, max = 20, value = 2, step = 0.1)
     ),
     
     column(4,
            sliderInput(inputId = "year",
                        label = "Years",
                        min = 0, max = 50, value = 20, step = 1),
            selectInput(inputId = "facet",
                        label = "Facet?",
                        choices = c("Yes", "No"), selected = "No")
     )
    ),
      
   hr(),
   
      # Show a plot of savings and data table
   h4(strong("Timelines")),
   plotOutput("distPlot"),
   
   h4(strong("Balances")),
   verbatimTextOutput("dataTable")
)

# Define server logic required to draw a plot and table
server <- function(input, output) {
  modalities <- reactive({
    
    future_value <- function(amount, rate, years){
      fv = amount * ((1 + rate)^(years))
      return(fv)
    }
    annuity <- function(contrib, rate, years){
      fva = contrib*((((1+rate)^years)-1) / rate)
      return(fva)
    }
    growing_annuity <- function(contrib, rate, growth, years){
      ga = contrib * ((((1 + rate)^years)-((1+growth)^years)) / (rate - growth))
      return(ga)
    }
    
    n <- input$initial
    a <- input$annual
    
    
    mode1 <- vector()
    mode2 <- vector()
    mode3 <- vector()
    
    
    for (i in 0:input$year) {
      term_1 <- future_value(amount = n, rate = input$return / 100 , years = i)
      mode1[i+1] <- term_1
      
      term_2 <- future_value(amount = n, rate = input$return / 100, years = i) +
        annuity(contrib = a, rate = input$return / 100, years = i)
      mode2[i+1] <- term_2
      
      term_3 <- future_value(amount = n, rate = input$return / 100, years = i) +
        growing_annuity(contrib = a, rate = input$return / 100, growth = input$growth / 100, years = i)
      mode3[i+1] <- term_3
    }
    
    
    modalities <- data.frame(
      year = 0:input$year,
      no_contrib = mode1,
      fixed_contrib = mode2,
      growing_contrib = mode3
    )  
    
    return(modalities)
    
  })
  
  
   output$distPlot <- renderPlot({
     
     modalities <- gather(modalities(), key = modality, 
                          value = value, no_contrib, fixed_contrib, growing_contrib, factor_key = TRUE)
     colnames(modalities) <- c("year", "modality", "value")
      
     s <- ggplot(data = modalities, aes(x = year, y = value, col = modality))+
       geom_line()+
       geom_point()+labs(x = "Year", y = "Value", title = "Growth of Investment") 
     
     
     if(input$facet == "Yes") {
       s <- s + facet_wrap( ~ modality) + 
         geom_area(aes(fill = modality), alpha = 0.4, show.legend = FALSE) +
         theme_bw()
       
       
     }
    return(s) 
     
   })
   
   output$dataTable <- renderPrint({modalities()})
}


# Run the application 
shinyApp(ui = ui, server = server)

