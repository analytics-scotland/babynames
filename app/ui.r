## ui.R: app user interface 

## GNU General Public License version 2 or any later version 
## (c) 2016 National Records of Scotland

library(shiny)
library(dygraphs)

# -- Layout ------------------------------------------------------------------
#
#   ?--------------------------------?    titlePanel(), 
#   ?  Title                         ?    dygraphOutput(),
#   ?                                ?
#   ?              PLOT              ?
#   ?                                ?
#   ?                                ?
#   ?----------?----------?----------?    fluidRow(
#   ?          ?          ?          ?      column(),
#   ?  Menus   ?  Text    ? Text     ?      column(),
#   ?          ?          ?          ?      column()
#   ?          ?          ?          ?    )
#   ?----------?----------?----------?
#
# ----------------------------------------------------------------------------

shinyUI(fluidPage(
  fluidRow(
    column(3, img(src = "nrs_logo.png", height = 67, width = 235)),
    column(9, titlePanel("Baby names trends in Scotland since 1974"))
  ),
  br(),
  h4("Enter a", strong("name,"), "select the", strong("gender"), "and click on", strong("'Apply'"), "to see how a name's popularity has changed over the years."),
  h4("App might be slow at busy times. Please be patient."),
  br(),
  br(),
  fluidRow(
    column(2, offset=1, textInput("Name", "Name", placeholder="Enter name", width='150px')),
    column(2, selectInput("Gender", "Gender", choices = list("Female" = 1, "Male" = 2), selected = 1, width='150px')),
    column(4, 
           br(),
           submitButton(text="Apply"))),
  br(),
  br(),
  dygraphOutput("dygraph_plot"),
  br(),
  br(),
  
  fluidRow(
    column(3, offset=1,
           h6(strong("How to use this app")),
           h6("Hover over years to highlight individual values"),
           h6("Click and drag to zoom"),
           h6("Double-click to zoom out"),
           br()),
    column(4,
           h6("Data: ", a("Baby names, Scotland, 1974-2015 (xlsx)", 
                href="http://www.nrscotland.gov.uk/files//statistics/nrs-visual/baby-names-1974-2015.xlsx",
                target="_blank")),
           h6("Publications: ", a("Baby names, Scotland, 1974-2015", 
                href="http://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/names/babies-first-names", 
                target="_blank")),
           br()),
    column(4,
           h6(a("National Records of Scotland", href="http://www.nrscotland.gov.uk", target="_blank")),
           h6("© Crown Copyright 2016 - ",
              a("Copyright conditions", href="http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/", target="_blank")),
           h6("Follow us on Twitter - ", 
              a("@NatRecordsScot", href="https://twitter.com/NatRecordsScot", target="_blank")),
           h6("See more ", a("Infographics & Visualisations", href="http://www.nrscotland.gov.uk/statistics-and-data/statistics/stats-at-a-glance/infographics-and-visualisations", 
                             target="_blank")),
           br())
    ) # End of fluidRow
  ) # End of fluidPage
) # End of shinyUI





#######
#input<-data.frame("a"=1)
#input$Gender=1
#input$Name="Victoria"
