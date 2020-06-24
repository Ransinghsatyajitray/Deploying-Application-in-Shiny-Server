#Theme: in the UI section:

library(shiny)

top_10_names <- babynames %>% na.omit() %>% 
    top_n(10, prop)

ui <- fluidPage(
    # CODE BELOW: Add a titlePanel with an appropriate title
    titlePanel('Top Trendy Names'),
    # MODIFY CODE BELOW: Add theme = shinythemes::shinytheme() with appropriate theme
    #theme = shinythemes::shinytheme("cerulean"),
    shinythemes::themeSelector(),
    sidebarLayout(
        sidebarPanel(
            selectInput('name', 'Select Name', top_10_names$name)
        ),
        mainPanel(
            tabsetPanel(
                tabPanel('Plot', plotly::plotlyOutput('plot_trendy_names')),
                tabPanel('Table', DT::DTOutput('table_trendy_names'))
            )
        )
    )
)


server <- function(input, output, session){
    # Function to plot trends in a name
    plot_trends <- function(){
        babynames %>% 
            filter(name == input$name) %>% 
            ggplot(aes(x = year, y = n)) +
            geom_col()
    }
    output$plot_trendy_names <- plotly::renderPlotly({
        plot_trends()
    })
    
    output$table_trendy_names <- DT::renderDT({
        babynames %>% 
            filter(name == input$name)
    })
}


shinyApp(ui = ui, server = server)