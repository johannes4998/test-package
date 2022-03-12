#' project2_02exploreMap UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project2_02exploreMap_ui <- function(id){
  ns <- NS(id)
  tagList(
    shinydashboard::box(width = 12, mod_project2_021euroMap_ui(ns("project2_021euroMap_ui_1")))
  )
}
    
#' project2_02exploreMap Server Functions
#'
#' @noRd 
mod_project2_02exploreMap_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    mod_project2_021euroMap_server("project2_021euroMap_ui_1")
  })
}
    
## To be copied in the UI
# mod_project2_02exploreMap_ui("project2_02exploreMap_ui_1")
    
## To be copied in the server
# mod_project2_02exploreMap_server("project2_02exploreMap_ui_1")
