# Default Shiny app good for simple apps but not good when app become complicated

#Sidebar layout:
#tab layout: tabsetPanel added inside main panel

# theme done in ui and not in server code:

library(shiny)
library(dplyr)
library(babynames)
library(ggplot2)


top_10_names <- babynames %>% na.omit() %>% 
    top_n(10, prop)

ui <- fluidPage(
    # MODIFY CODE BLOCK BELOW: Wrap in a sidebarLayout
    sidebarLayout(
        # MODIFY CODE BELOW: Wrap in a sidebarPanel
        sidebarPanel(
            selectInput('name', 'Select Name', top_10_names$name)
        ),
        # MODIFY CODE BELOW: Wrap in a mainPanel
        mainPanel(
            plotly::plotlyOutput('plot_trendy_names'),
            DT::DTOutput('table_trendy_names')
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
