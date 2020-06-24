
# load shiny
library(shiny)

# Create the UI with HTML function fluidpage
#
ui <- fluidPage(
    textInput("name","Enter a name:")  #name will be used as input of renderText function
)

# Define the custom function to create the server
server <- function(input,output,session){

}

# Run the app
shinyApp(ui=ui, server=server)