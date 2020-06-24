#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



# Observer dont return a value , they just send value to the web browser


library(shiny)

ui <- fluidPage(
    textInput("name","Enter your name")
)


server <- function(input,output,session){
    observe({
        showNotification(paste("You entered the name",input$name))  #side effect and no value is returned
    })
}


shinyApp(ui=ui,server=server)



# Reactive flow:



# # Create your own reactive values:
# reactiveValues(), reactiveFileReader(), reactivePoll(), *Input()
# 
# # Trigger arbitrary code:
# oberverEvent(), observe()
# 
# 
# # Schedule updates:
# invalidateLater()
# 
# # Modularize Reaction:
# reactive()
# 
# # Prevent Reaction:
# isolate()
# 
# # Delay Reactions:
# eventReactive()
# 
# # Render reactive output:
# render*()


# library(MASS)  # does have side effect 
# 25 / 40   # this doesnt have side effect as it returns a value
# x <<- 10  # does have side effect 
# source("utils.R")  # does have side effect 