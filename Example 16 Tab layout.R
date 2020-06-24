# Tab layout: Inside main panel



library(shiny)

top_10_names <- babynames %>% na.omit() %>% 
    top_n(10, prop)


ui <- fluidPage(
    sidebarLayout(
        sidebarPanel(
            selectInput('name', 'Select Name', top_10_names$name)
        ),
        mainPanel(
            # MODIFY CODE BLOCK BELOW: Wrap in a tabsetPanel
            tabsetPanel(
                # MODIFY CODE BELOW: Wrap in a tabPanel providing an appropriate label
                tabPanel('Plot', plotly::plotlyOutput('plot_trendy_names')),
                # MODIFY CODE BELOW: Wrap in a tabPanel providing an appropriate label
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