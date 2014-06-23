# ui.R

shinyUI(fluidPage(
  titlePanel("Motor Cars MPG"),
  
  sidebarLayout(
    sidebarPanel(
      helpText(h3("Estimate MPG for a car")),
      
      selectInput("cylinders", 
                  label = "Choose number of cylinders",
                  choices = list("4" = 4, "6" = 6,
                                 "8" = 8), selected = 4),
 
      radioButtons("transmission", 
                    label = h3("Transmission Type"), 
                    choices = list("Automatic" = 0, 
                                    "Manual" = 1),
                         selected = 1),
    
      sliderInput("weight", 
                  label = "Weight of Car (in 1000s of Pounds):",
                  min = 1, max = 10, value = 3)
    ),
    
    mainPanel(
      h4("Estimated MPG", textOutput("mpgout")),
      plotOutput("residuals")
    )
  )
))

