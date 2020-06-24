
library(shiny)

ui <- fluidPage(
    titlePanel("What's in a Name"),
    selectInput("sex","Select Sex",choices = c("F","M")),
    plotOutput("plot_top_10_names")
)

server <- function(input,output,session){

    output$plot_top_10_names <- renderPlot({
        library(dplyr)
        library(ggplot2)
        library(babynames)
        
        
        top_10_names <- babynames %>% #it can be used directly , In example 9 we got an error because for babyname dateset we created object. babynames package conatins baby name dataset which can be used directly
            filter(sex==input$sex) %>%  
            filter(year==1900) %>% 
            top_n(10,prop)
        
        ggplot(top_10_names,aes(x=name,y=prop))+geom_col(fill="#263e63")
        
    })
}




shinyApp(ui=ui,server=server)