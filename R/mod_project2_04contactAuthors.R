#' project2_04contactAuthors UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project2_04contactAuthors_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' project2_04contactAuthors Server Functions
#'
#' @noRd 
mod_project2_04contactAuthors_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_project2_04contactAuthors_ui("project2_04contactAuthors_ui_1")
    
## To be copied in the server
# mod_project2_04contactAuthors_server("project2_04contactAuthors_ui_1")
