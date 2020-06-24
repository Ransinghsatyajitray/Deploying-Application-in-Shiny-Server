
# load shiny
library(shiny)

# Create the UI with HTML function fluidpage
#
ui <- fluidPage(
    textInput("name","Enter a name:")  #name will be used as input of renderText function
)

# Define the custom function to create the server
server <- function(input,output,session){
    output$q <- renderText({
        paste("Do you prefer dogs or cats,",
              input$name,"?")})
}

# Run the app
shinyApp(ui=ui, server=server)

# Here we dont have any area to take the output
# This code is fairly similar to not writing anything inside server function


# # load shiny
# library(shiny)
# 
# # Create the UI with HTML function fluidpage
# #
# ui <- fluidPage(
#     textInput("name","Enter a name:")  #name will be used as input of renderText function
# )
# 
# # Define the custom function to create the server
# server <- function(input,output,session){
#     
# }
# 
# # Run the app
# shinyApp(ui=ui, server=server)