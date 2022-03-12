#' project1_03exploreDataset UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project1_03exploreDataset_ui <- function(id){
  ns <- NS(id)
  tagList(
    mod_project1_03plot_ui(ns("project1_03plot_ui_1"))
  )
}
    
#' project1_03exploreDataset Server Functions
#'
#' @noRd 
mod_project1_03exploreDataset_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    mod_project1_03plot_server("project1_03plot_ui_1")
  })
}
    
## To be copied in the UI
# mod_project1_03exploreDataset_ui("project1_03exploreDataset_ui_1")
    
## To be copied in the server
# mod_project1_03exploreDataset_server("project1_03exploreDataset_ui_1")
