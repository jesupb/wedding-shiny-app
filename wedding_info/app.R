#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Distribucion de mesas"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                type = "tabs",
                tabPanel(
                    "Distribucion de mesas",
                     h2("Por favor, ingrese su nombre o apellido"),
                     br(),
                     DT::dataTableOutput("mytable")
                    ),
                tabPanel(
                    "Menu",
                    img(src="menu.png", align = "center")
                    ),
                tabPanel(
                    "Bebidas",
                    img(src="menu.png", align = "center")
                    ),
                tabPanel(
                    "Cronograma",
                    img(src="menu.png", align = "center")
                    )
            )
            
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    filedata <- read.csv(url("https://raw.githubusercontent.com/jesupb/wedding-shiny-app/main/wedding_info/sitting_distro.csv"))
    #filedata <- read.csv("sitting_distro.csv")
    
    output$mytable = DT::renderDT(
        filedata, options = list(dom = 'f'),rownames= FALSE
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
