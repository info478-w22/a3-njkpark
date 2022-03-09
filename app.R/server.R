#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library("shiny")
source("./analysis.R")

my_server <- function(input, output) {
    # define output reactive expressions
  output$transmission_img <- renderUI({
    tags$img(src = "https://c8.alamy.com/comp/2BPR46H/vector-illustration-of-transmission-probability-of-covid-19-in-percent-wearing-or-not-protective-mask-profile-of-multiracial-people-2BPR46H.jpg", 
             height="50%", width="50%", align="right")
  })
  output$plot1 <- renderPlot({
    param <- param.dcm(inf.prob = 0.632, act.rate = c(input$slider))
    init <- init.dcm(s.num = 999, i.num = 10)
    control <- control.dcm(type = "SI", nsteps = 50)
    
    
    mod <- dcm(param, init, control)
    mod
    plot(mod)
  })
  
  output$plot2 <- renderPlot({
      if(input$plot2var == "Carrier and Healthy no masks") {
      plot(mod.icm)
    } else if(input$plot2var == "Carrier no mask, Healthy with mask") {
      plot(mod.icm1)
    } else if(input$plot2var == "Carrier with mask, Healthy no mask") {
      plot(mod.icm2)
    } else if(input$plot2var == "Carrier and Healthy with masks") {
      plot(mod.icm3)
    }
  })
}

shinyServer(my_server)
