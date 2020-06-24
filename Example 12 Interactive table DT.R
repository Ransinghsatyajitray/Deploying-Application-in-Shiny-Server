#Outputs:
# tableOutput() or dataTableOutput
# imageOutput()
# plotOutput()

#Non Shiny output and render functions:
# DT Table is searchable, sortable and interactive

library(shiny)
library(dplyr)
library(babynames)
ui <- fluidPage(
    DT::DTOutput("babynames_table")
)

server <- function(input,output){
    output$babynames_table <- DT::renderDT({
        babynames %>% dplyr::sample_frac(.1)
    })
}

shinyApp(ui=ui,server=server)