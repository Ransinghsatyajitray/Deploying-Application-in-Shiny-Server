library(shiny)

# Create the UI with HTML function fluidpage

ui <- fluidPage(
    titlePanel("Baby Name Explorer"),  #name will be used as input of renderText function
    textInput("name","Enter Name","David"), #Here David is default 
    plotOutput("trend")
)

# Define the custom function to create the server
server <- function(input,output,session){
    output$trend <- renderPlot({
        library(ggplot2)
        ggplot()})
}

# Run the app
shinyApp(ui=ui, server=server)