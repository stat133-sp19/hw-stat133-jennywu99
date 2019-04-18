# Workout02: Savings & Investment Model
## Outputs:
##    timeline of savings balance for each investment mode
##    table of savings balance for each investment mode

library(shiny)
library(dplyr)
library(ggplot2)

#functions 
future_value <- function(amount = 0, rate = 0, years = 0) {
  fv <- amount*(1 + rate)^years
  return(fv)
}
annuity <- function(contrib = 0, rate = 0, years = 0) {
  fva <- contrib*(((1+rate)^years-1)/rate)
  return(fva)
}
growing_annuity <- function(contrib = 0, rate = 0, growth = 0, years = 0) {
  fvga <- contrib*(((1+rate)^years - (1+growth)^years)/(rate-growth))
  return(fvga)
}

ui <- fluidPage(
  
  titlePanel("Comparing Investment Modalities"),
  
  fluidRow(
    column(width = 4, 
           sliderInput("initial", 
                       "Initial Amount",
                       min = 0, 
                       max = 100000, 
                       value = 1000, 
                       step = 500), 
           sliderInput("contrib", 
                       "Annual Contribution", 
                       min = 0, 
                       max = 50000, 
                       value = 2000, 
                       step = 500)), 
    column(width = 4, 
           sliderInput("return", 
                       "Return Rate (%)", 
                       min = 0, 
                       max = 20, 
                       value = 5, 
                       step = 0.1), 
           sliderInput("growth", 
                       "Growth Rate (%)", 
                       min = 0, 
                       max = 20, 
                       value = 2, 
                       step = 0.1)), 
    column(width = 4, 
           sliderInput("years", 
                       "Years", 
                       min = 0, 
                       max = 50, 
                       value = 20, 
                       step = 1), 
           selectInput("facet", 
                       "Facet?", 
                       c("No", "Yes"))), 
    
    fluidRow(  
      column(width = 12, 
             h4("Timelines"), 
             plotOutput("graph"), 
             h4("Balances"), 
             tableOutput("table"))
    )
  )
)

server <- function(input, output) {
  
  output$graph <- renderPlot({
    #data
    year <- c(0:input$years)
    no_contrib <- rep(0, input$years + 1)
    fixed_contrib <- rep(0, input$years + 1)
    growing_contrib <- rep(0, input$years + 1)
    
    return <- input$return/100
    growth <- input$growth/100
    
    for (t in year) {
      no_contrib[t+1] <- future_value(input$initial, return, t)
      fixed_contrib[t+1] <- future_value(input$initial, return, t) + annuity(input$contrib, return, t)
      growing_contrib[t+1] <- future_value(input$initial, return, t) + growing_annuity(input$contrib, return, growth, t)
    }
    
    #no facet data
    modalities <- as.data.frame(
      matrix(c(year, 
               no_contrib, 
               fixed_contrib, 
               growing_contrib), 
             input$years + 1, 4, 
             dimnames = 
               list(1:(input$years + 1), 
                    c("year", 
                      "no_contrib", 
                      "fixed_contrib", 
                      "growing_contrib"))))
    
    modalities[,2:4] <- round(modalities[,2:4], 2)
    
    #with facet data
    modalities2 <- as.data.frame(
      matrix(c(no_contrib,
               fixed_contrib, 
               growing_contrib), 
             3*(length(no_contrib)), 1, 
             dimnames = 
               list(1:(3*length(no_contrib)), 
                    c("balances")))
    )
    
    modalities2 <- mutate(modalities2,
                          year = rep(0:input$years, 3), 
                          variable = c(
                            rep("no_contrib", input$years + 1), 
                            rep("fixed_contrib", input$years + 1), 
                            rep("growing_contrib", input$years + 1)
                          ))
    
    modalities2$variable <- factor(modalities2$variable, 
                                   levels = c(
                                     "no_contrib", 
                                     "fixed_contrib", 
                                     "growing_contrib"
                                   ))
    
    #graph
    if (input$facet == "No") {
      cols <- c("no_contrib" = 2, "fixed_contrib" = 3, "growing_contrib" = 4)
      print(ggplot(modalities) + 
        geom_line(aes(x=year, y=no_contrib, color = "no_contrib"), size=1, alpha=.5) + 
        geom_point(aes(x=year, y=no_contrib, color = "no_contrib"), size=.7, alpha=.5) + 
        geom_line(aes(x=year, y=fixed_contrib, color = "fixed_contrib"), size=1, alpha=.5) + 
        geom_point(aes(x=year, y=fixed_contrib, color = "fixed_contrib"), size=.7, alpha=.5) + 
        geom_line(aes(x=year, y=growing_contrib, color = "growing_contrib"), size=1, alpha=.5) + 
        geom_point(aes(x=year, y=growing_contrib, color = "growing_contrib"), size=.7, alpha=.5) + 
        scale_color_manual("variables", 
                           breaks = c(
                             "no_contrib", 
                             "fixed_contrib", 
                             "growing_contrib"), 
                           values = cols) + 
        labs(title = "Three Modes of Investing", x = "time (years)", y = "future value of investment (dollars)"))
    } else {
      print(ggplot(modalities2) + 
        geom_area(aes(x = year, y = balances, color = variable, fill = variable), alpha = .5) + 
        geom_point(aes(x = year, y = balances, color = variable), size = .5) + 
        theme_bw() + 
        facet_grid(.~variable) + 
        labs(title = "Three Modes of Investing", x = "time (years)", y = "future value of investment (dollars)"))
    }
    
  })
  
  output$table <- renderTable({
    #data
    year <- c(0:input$years)
    no_contrib <- rep(0, input$years + 1)
    fixed_contrib <- rep(0, input$years + 1)
    growing_contrib <- rep(0, input$years + 1)
    
    return <- input$return/100
    growth <- input$growth/100
    
    for (t in year) {
      no_contrib[t+1] <- future_value(input$initial, return, t)
      fixed_contrib[t+1] <- future_value(input$initial, return, t) + annuity(input$contrib, return, t)
      growing_contrib[t+1] <- future_value(input$initial, return, t) + growing_annuity(input$contrib, return, growth, t)
    }
    
    modalities <- as.data.frame(matrix(c(year, no_contrib, fixed_contrib, growing_contrib), input$years + 1, 4, dimnames = list(0:input$years, c("year", "no_contrib", "fixed_contrib", "growing_contrib"))))
    
    modalities[,2:4] <- round(modalities[,2:4], 2)
    
    modalities
  })
}

shinyApp(ui = ui, server = server)

