# server.R
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(function(input, output)
{
    ethnicity <- ""
    legend_title <- ""
    
    output$map <- renderPlot(
    {
        if (input$var == "Percent White")
        {
            ethnicity <- counties$white
            legend_title <- "Population (Percent White)"
        }
        
        else if (input$var == "Percent Black")
        {
            ethnicity <- counties$black
            legend_title <- "Population (Percent Black)"
        }
        
        else if (input$var == "Percent Hispanic")
        {
            ethnicity <- counties$hispanic
            legend_title <- "Population (Percent Hispanic)"
        }
        
        else
        {
            ethnicity <- counties$asian
            legend_title <- "Population (Percent Asian)"
        }
        
        percent_map(var=ethnicity, color=input$color_choice, legend.title=legend_title, max=max(input$range), min=min(input$range))
    })
})