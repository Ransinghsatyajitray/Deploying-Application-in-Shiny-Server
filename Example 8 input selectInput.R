# Input function (used in ui)

# selectInput("inputId","label",choices=c("A","B","C"))

# sliderInput("inputId","label",value=1900,min=1800,max=2000)

library(shiny)

ui <- fluidPage(
    textInput("name","Enter a name:"),
    selectInput("animal","Dogs or Cats",choices=c("dogs","cats")),
    textOutput("greetings"),
    textOutput("answer")
)


server <- function(input,output,session){
    output$greetings <- renderText({
        paste("Do you prefer dogs or cats",input$name,"?")
    })
    output$answer <- renderText({paste("I prefer",input$animal,"!")})
}

# Run the app
shinyApp(ui=ui, server=server)
