#' project1_02sampleDescription UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project1_02sampleDescription_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      shinydashboardPlus::box(title = "Explore Map", 
                                     width = 12,
                                     leaflet::leafletOutput(ns("map"))
                              ),
      shinydashboardPlus::box(title = "Variable Description",
                                      collapsible = TRUE,
                                      collapsed=FALSE,
                                      width = 12,
                                      mod_project1_02sampletable_ui(ns("project1_02sampletable_ui_1"))
                                      ),
      shinydashboardPlus::box(title = "Descriptive Statistics",
                                    collapsible = TRUE,
                                    collapsed=F,
                                    width = 12,
                                    mod_project1_02descriptiveStats_ui(ns("project1_02descriptiveStats_ui_1"))
                                    )
    )
  )
}
    
#' project1_02sampleDescription Server Functions
#'
#' @noRd 
mod_project1_02sampleDescription_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    mod_project1_02sampletable_server("project1_02sampletable_ui_1")
    mod_project1_02descriptiveStats_server("project1_02descriptiveStats_ui_1")
    
    output$map <- leaflet::renderLeaflet({
      m
    })
    
  })
}
    
## To be copied in the UI
# mod_project1_02sampleDescription_ui("project1_02sampleDescription_ui_1")
    
## To be copied in the server
# mod_project1_02sampleDescription_server("project1_02sampleDescription_ui_1")
