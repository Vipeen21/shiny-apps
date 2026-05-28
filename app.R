library(shiny)

# 1. User Interface (UI) - Controls how the app looks
ui <- fluidPage(
  titlePanel("My First Shiny App"),
  
  sidebarLayout(
    sidebarPanel(
      # A slider input to choose the number of bins
      sliderInput(
        inputId = "bins",
        label = "Number of bins:",
        min = 1,
        max = 50,
        value = 30
      )
    ),
    
    mainPanel(
      # A placeholder where the plot will be displayed
      plotOutput(outputId = "distPlot")
    )
  )
)

# 2. Server Logic - Controls how the app calculates and functions
server <- function(input, output) {
  # This matches the "distPlot" placeholder in the UI
  output$distPlot <- renderPlot({
    # Generate random data
    x    <- faithful$waiting
    # Calculate bin breaks based on the slider's value
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # Draw the histogram
    hist(
      x, 
      breaks = bins, 
      col = "#75AADB", 
      border = "white",
      xlab = "Waiting time to next eruption (in mins)",
      main = "Histogram of Waiting Times"
    )
  })
}

# 3. Combine UI and Server to run the application
shinyApp(ui = ui, server = server)
