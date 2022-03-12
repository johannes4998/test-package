#' project0_01global UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project0_01global_ui <- function(id){
  ns <- NS(id)
  tagList(
    mod_project0_01generalDescription_ui(ns("project0_01generalDescription_ui_1"))
  )
}
    
#' project0_01global Server Functions
#'
#' @noRd 
mod_project0_01global_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    mod_project0_01generalDescription_server("project0_01generalDescription_ui_1")
  })
}
    
## To be copied in the UI
# mod_project0_01global_ui("project0_01global_ui_1")
    
## To be copied in the server
# mod_project0_01global_server("project0_01global_ui_1")
