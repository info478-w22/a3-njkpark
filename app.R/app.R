#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library("shiny")
library("rsconnect")
source("ui.R")
source("server.R")

# Run the application 
shinyApp(ui = my_ui, server = my_server)

