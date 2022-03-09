#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library("shiny")
library("shinythemes")

introduction <- tabPanel(
    titlePanel("Introduction"),
    mainPanel(
      h1("Disease Modeling - COVID-19"),
      p("This assignment will utilize the Deterministic Compartmental Model (DCM) - SI and the Stochastic Individual
        Contact Models (ICM) SIR by the EpiModel R Package in order to demonstrate the risk and probability of 
        contracting COVID-19 given different situations. For the DCM model, users are able to see a graph where
        the infection probability rate of COVID-19 at maximum is 63.2%, and users will be able to change theacts per 
        person per unit time (the amount of interactions between people). The ICM model showcases 4 different scenarios
        based on the visual represented on this page. The user will be able to select graphs that visualize the probability
        of risk of COVID-19 given if two people were wearing masks or not.")
    ),
    sidebarPanel(
      uiOutput("transmission_img")
    )
)

#social distancing
panel1 <- tabPanel(
  titlePanel("Deterministic Model"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider","Amount of Interactions - Amount of Interactions", min=1, max=6.5, step =.1, value=1)
  ),
  mainPanel(
    plotOutput("plot1")
  )
)
)

#masks
panel2 <- tabPanel(
  titlePanel("Stochastic Model"),
  sidebarLayout(
    sidebarPanel(
      selectInput("plot2var", "Transmission Probability", choices = 
                    c("Carrier and Healthy no masks", "Carrier no mask, Healthy with mask", 
                      "Carrier with mask, Healthy no mask", "Carrier and Healthy with masks"),
                  selected = "Carrier and Healthy no masks")
    ),
    mainPanel(
      plotOutput("plot2")
    )
  )
)

insights <- tabPanel(
  titlePanel("Insights"),
  mainPanel(
    h1("Insights and Interpretations"),
    p("From the visual models, we can see that there are a lot of factors that can limit the spread of COVID-19."),
    h2("DCM"),
    p("This graph is an SI model, where the infection probablity was 0.632 (63.2%) and the act.rate (interactions)
      are interactive based on the user's input. The simulation has 999 susceptible individuals and 10 infected individuals.
      The nsteps (timeline) is set to 50. As we can see from the initial graph, where act.rate = 1, the graph demonstrates
      that it would take much slower for people to move from the susceptible to infected group, indicating that with social
      distancing during the COVID-19 pandemic, the risk of contracting COVID is very low. Compare this to act.rate = 2, we 
      can already see that the graphs shifts in a manner where it's a little faster for people to move between groups. This
      trend continues to speed up the rate of infections the more interactions a person has."),
    h2("ICM"),
    p("The ICM graphs are SIR models, each demonstrating the result of having a healthy person and COVID infected person
      interact with eachother, with and without masks. Based on the visualization from the introduction page, there is 
      a higher risk of transmission between these two people if both people are not wearing masks, compared to if they are
      both wearing masks. Thus, the inf.prob (infection probablity) has been adjusted as demonstrated on the visual, with
      the interaction rates remaining the same. From the four graphs that has been produced, we can see not only the uncertainty 
      in the lines, but the 'Carrier and Healthy no mask' graph demonstrates the steep infection risk within a fast amount
      of time. The 'Carrier no mask, Healthy with mask' has a similar visual to the first graph, however the i.num line does
      become a little less steep and may take more time or interactions than the first graph to contract COVID-19. 'Carrier 
      with mask, Healthy no mask' and 'Carrier and Healthy with mask' both show similar drastic results compared to the first two
      visuals. Here, we can see hardly any transmission, even more so in the graph where both carrier and healthy persons
      are wearing masks."),
    h2("Overall"),
    p("The COVID-19 pandemic has ensued since late 2019 and has continued to become a problem in 2022. This project supports
      the idea that individuals must continue to socially distance and wear masks to reduce transmission. With the invention
      of the COVID-19 vaccines, we are starting to see a slower rate of transmissions for COVID-19. Thus, it is important
      to follow state regulations, to get vaccinated, and be mindful of interacting with people.")
  )

)
my_ui <- navbarPage(
    theme = shinytheme("flatly"),
    tags$div("A3 INFO 478"),
    introduction,
    panel1,
    panel2,
    insights
)
shinyUI(my_ui)
