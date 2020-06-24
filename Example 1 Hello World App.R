# What is a web app?
# Updates based on user input/interaction
# Made up of UI and Server

# Client -> User interface
# Server -> for computation

# Shiny allows to write app
# Why not web developer build it? Cluster analysis when number of cluster increase


# Building "Hello World" Shiny app.

# load shiny
library(shiny)

# Create the UI with HTML function fluidpage
ui <- fluidPage(
    "Hello, world"
)

# Define the custom function to create the server
server <- function(input,output,session){
    
}

# Run the app
shinyApp(ui=ui, server=server)