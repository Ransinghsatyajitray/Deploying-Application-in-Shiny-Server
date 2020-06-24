#This is having some error

library(shiny)

ui <- fluidPage(
    titlePanel("Most Popular Names"),
    sidebarLayout(
        sidebarPanel(
            selectInput('sex', 'Select Sex', c("M", "F")),
            sliderInput('year', 'Select Year', 1880, 2013, 1900)
        ),
        mainPanel(
            plotOutput('plot')
        )
    )
)
server <- function(input, output, session) {
    output$plot <- renderPlot({
        top_names_by_sex_year <- get_top_names(input$year, input$sex) 
        ggplot(top_names_by_sex_year, aes(x = name, y = prop)) +
            geom_col()
    })
}
shinyApp(ui = ui, server = server)