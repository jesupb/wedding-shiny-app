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
    
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "fonts.css")
    ),

    # Application title
    titlePanel(h1("Boda Pacheco Medina")),

    tabsetPanel(                
        type = "pills",
        tabPanel(
        
            "Distribucion de mesas",
            h4("Por favor, ingrese su nombre o apellido en la barra de busqueda."),
            br(),
            DT::dataTableOutput("mytable")
        ),
        tabPanel(
            "Menu",
            img(src="menu.jpg", align = "center")
        ),
        tabPanel(
            "Menú del coctel",
            img(src="menu_coctel", align = "center")
        ),
        tabPanel(
            "Bebidas",
            img(src="bebidas.jpg", align = "center")
        ),
        tabPanel(
            "Cronograma",
            img(src="cronograma.jpg", align = "center")
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
