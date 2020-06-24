
#This function has error at get_top_names function 

library(shiny)


ui <- fluidPage(
    titlePanel("Most Popular Names"),
    sidebarLayout(
        sidebarPanel(
            selectInput('sex', 'Select Sex', c("M", "F")),
            sliderInput('year', 'Select Year', 1880, 2013, 1900)
        ),
        mainPanel(
            tabsetPanel(
                tabPanel('Plot', plotOutput('plot')),
                tabPanel('Table', tableOutput('table'))
            )
        )
    )
)

server <- function(input, output, session) {
    output$plot <- renderPlot({
        d <- get_top_names(input$year, input$sex) 
        qplot(name, prop, data = d, geom = 'col')
    })
    
    output$table <- renderTable({
        get_top_names(input$year, input$sex) 
    })
}
shinyApp(ui = ui, server = server)