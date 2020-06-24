library(shiny)
library(plotly)
library(babynames)
library(dplyr)


# This just an example: we can modify as per our requirement:, first we write the data objevt then use the name column in the selectInput
top_10_names <- babynames %>% na.omit() %>% 
    top_n(10, prop)

ui <- fluidPage(
    selectInput('name', 'Select Name', top_10_names$name),
    # CODE BELOW: Add a plotly output named 'plot_trendy_names'
    plotly::plotlyOutput('plot_trendy_names')
)

server <- function(input, output, session){
    # Function to plot trends in a name
    plot_trends <- function(){
        babynames %>% 
            filter(name == input$name) %>% 
            ggplot(aes(x = year, y = n)) +
            geom_col()
    }
    # CODE BELOW: Render a plotly output named 'plot_trendy_names'
    output$plot_trendy_names <- plotly::renderPlotly({
        plot_trends()
    })
}
shinyApp(ui = ui, server = server)