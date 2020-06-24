
# load shiny
library(shiny)

# Create the UI with HTML function fluidpage
#
ui <- fluidPage(
    textInput("name","Enter a name:"),  #name will be used as input of renderText function
    textOutput("q")
    )

# Define the custom function to create the server
server <- function(input,output,session){
    output$q <- renderText({
        paste("Do you prefer dogs or cats,",
              input$name,"?")})
}

# Run the app
shinyApp(ui=ui, server=server)


# As we have added textOutput we can see the output mentioned inside renderText
# textInput (name) in ui -> renderText in server -> text output in output$any_object_name
# -> ui output in textOutput