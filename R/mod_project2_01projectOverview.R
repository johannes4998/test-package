#' project2_01projectOverview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project2_01projectOverview_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(shinydashboardPlus::box(title = "What is this project about?",
                                     collapsible = TRUE,
                                     collapsed=FALSE,
                                     width = 12,
                                     HTML(projectdescription[projectdescription$infobox == "infop2a" &
                                                               projectdescription$project == "project2",
                                                             "info"])
                                     ),
             shinydashboardPlus::box(title = "How was the project structured?",
                                     collapsible = TRUE,
                                     collapsed=TRUE,
                                     width = 12,
                                     HTML(projectdescription[projectdescription$infobox == "infop2b" &
                                                               projectdescription$project == "project2",
                                                             "info"])),
             shinydashboardPlus::box(title = "Who was part of the project?",
                                     collapsible = TRUE,
                                     collapsed=TRUE,
                                     width = 12,
                                     HTML(projectdescription[projectdescription$infobox == "infop2c" &
                                                               projectdescription$project == "project2",
                                                             "info"])),
             shinydashboardPlus::box(title = "What will You learn about the project?",
                                     collapsible = TRUE,
                                     collapsed=TRUE,
                                     width = 12,
                                     HTML(projectdescription[projectdescription$infobox == "infop2d" &
                                                               projectdescription$project == "project2",
                                                             "info"])
             )
  )
  )
}
    
#' project2_01projectOverview Server Functions
#'
#' @noRd 
mod_project2_01projectOverview_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
  })
}
    
## To be copied in the UI
# mod_project2_01projectOverview_ui("project2_01projectOverview_ui_1")
    
## To be copied in the server
# mod_project2_01projectOverview_server("project2_01projectOverview_ui_1")
