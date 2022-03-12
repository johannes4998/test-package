#' testmodul UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_testmodul_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' testmodul Server Functions
#'
#' @noRd 
mod_testmodul_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_testmodul_ui("testmodul_ui_1")
    
## To be copied in the server
# mod_testmodul_server("testmodul_ui_1")
