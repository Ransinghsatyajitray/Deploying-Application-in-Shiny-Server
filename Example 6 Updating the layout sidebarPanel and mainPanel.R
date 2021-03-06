library(shiny)

# Create the UI with HTML function fluidpage

ui <- fluidPage(
    titlePanel("Baby Name Explorer"),  #name will be used as input of renderText function
    sidebarLayout(
        sidebarPanel(
            textInput("name","Enter Name","David")
    ), #Here David is default 
    mainPanel(
        plotOutput("trend")
        )
    )
)

# Sidebar Layout composed of 2 section that is sidebarPanel and mainPanel


# Define the custom function to create the server
server <- function(input,output,session){
    output$trend <- renderPlot({
        library(ggplot2)
        ggplot()})
}

# Run the app
shinyApp(ui=ui, server=server)