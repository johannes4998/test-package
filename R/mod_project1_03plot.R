#' project1_03plot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project1_03plot_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      shinydashboard::box(width = 3,
      selectInput(ns("input1"), 
                  h3("Select X"),
                  choices = basic_data_names, selected = "Evo.meaning"),
      selectInput(ns("input2"), 
                  h3("Select Y"),
                  choices = basic_data_names, selected = "Personal.faith"),
      selectInput(ns("filter1"), 
                  h3("Filter by Country"),
                  choices = c("All Countries"="", countries), selected = "All Countries", multiple=TRUE),
      selectizeInput(ns("group1"), 
                  h3("Group by"),
                  choices = c(basic_data_names_factor),
                  multiple=TRUE,
                  options = list(maxItems = 1)),
      checkboxInput(ns("na_filter"), "Filter Missing Values", value = TRUE),
        downloadButton(ns("downloadData"), "Download Data.csv"),
        downloadButton(ns("downloadPlot"), "Download Plot")
      ),
      # selectInput("group2", 
      #             tagList(h3("Select Plot Type",p("prototype"))),
      #             
      #             choices = c("point", "barchart"), selected = "sex"),
             shinydashboard::box(width = 9,
               plotOutput(ns("plot"))
                                 )
    )
    )
      
}
    
#' project1_03plot Server Functions
#'
#' @noRd 
mod_project1_03plot_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    data_filtered <- reactive({
      
      data_filtered <- basic_data%>%
        # Select variables needed
        dplyr::select(input$input1,input$input2, input$group1, Country) %>%
        #Filter country
        dplyr::filter(
          conditional(!is.null(input$filter1), Country == input$filter1)
        )%>%
        #Filter na
        dplyr::filter(
          conditional(input$na_filter, !is.na(.data[[input$input1]]) & !is.na(.data[[input$input2]]))
        )
      
      data_filtered
    })
    
    plot_ready <- reactive({
      evo_plot(data = data_filtered(), x=input$input1, y=input$input2, group1 = input$group1)
    })


    output$plot <- renderPlot({
      plot_ready()
    })

    output$downloadData <- downloadHandler(
      filename = function() { paste0("Data_", input$input1,"_",input$input2,".csv")},
      content = function(file) {write.csv(data_filtered(), file = file, row.names = FALSE)}
    )

    output$downloadPlot <- downloadHandler(
      filename = function() { paste0("Data_", input$input1,"_",input$input2,".png") },
      content = function(file) {
        ggplot2::ggsave(file, plot = plot_ready(), device = "png")
      }
    )
  })
}
    
## To be copied in the UI
# mod_project1_03plot_ui("project1_03plot_ui_1")
    
## To be copied in the server
# mod_project1_03plot_server("project1_03plot_ui_1")
