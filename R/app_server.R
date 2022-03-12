#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  # 
  mod_project1_00global_server("project1_00global_ui_1")
  mod_project0_01global_server("project0_01global_ui_1")
  mod_project2_01global_server("project2_01global_ui_1")
}
