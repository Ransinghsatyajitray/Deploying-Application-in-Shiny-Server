

library(shiny)

ui <- fluidPage(
    titlePanel("What's in a Name?"),
    # CODE BELOW: Add select input named "sex" to choose between "M" and "F"
    selectInput("sex", "Select Sex", choices = c("F", "M")),
    # Add plot output to display top 10 most popular names
    plotOutput("plot_top_10_names")
)

server <- function(input, output, session){
    
    # Render plot of top 10 most popular names
    output$plot_top_10_names <- renderPlot({
        
        library(ggplot2)
        library(babynames)
        library(dplyr)
        
        babynames <- data("babynames")
        # Get top 10 names by sex and year
        top_10_names <- babynames %>% na.omit() %>% 
            # MODIFY CODE BELOW: Filter for the selected sex
            dplyr::filter(sex == quos(input$sex)) %>% 
            dplyr::filter(year == 1900) %>% 
            top_n(10, prop)
        # Plot top 10 names by sex and year
        ggplot(top_10_names, aes(x = name, y = prop)) +
            geom_col(fill = "#263e63")
    })
}

shinyApp(ui = ui, server = server)