## server.R: server-side scripting

## GNU General Public License version 2 or any later version 
## (c) 2016 National Records of Scotland

library(shiny)
library(dygraphs) # renderDygraph
library(stringr) # str_trim, str_to_title

load("babynames1974_2015.RData")

shinyServer(function(input, output) {
  
  output$dygraph_plot <- renderDygraph({
    
    dygraph_data<-as.data.frame(cbind(1974:2015, 
                                      as.numeric(dat[dat$firstname==str_trim(str_to_title(input$Name)) & dat$gender==as.numeric(input$Gender), -(1:2)])))
    
    main_lb<-""
    if (input$Name!="") {
    main_lb<-ifelse(input$Gender == 1, 
                    paste("Girls named", str_trim(str_to_title(input$Name))), 
                    paste("Boys named", str_trim(str_to_title(input$Name))))
    }
    
    dygraph(dygraph_data, main = main_lb) %>%

    dyAxis("x", label = "Year")  %>%
    dyAxis("y", label = "Number of babies") %>%
        
    dySeries("V2", label = "Number of babies", strokeWidth=3, color = ifelse(input$Gender == 1, "#703989", "#FF780E")) %>%
        
    dyOptions(fillGraph = T, fillAlpha = 0.4, drawGrid = F, includeZero = T, drawPoints = T, pointSize=4)  %>%
        
    dyHighlight(highlightCircleSize=8, highlightSeriesBackgroundAlpha = 1)

  })
})