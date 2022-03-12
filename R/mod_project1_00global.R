#' project1_00global UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project1_00global_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("Acceptance of Evolution across Europe"),
    tabsetPanel(type = "tabs",
                tabPanel("Project Overview",  mod_project1_01projectOverview_ui(ns("project1_01projectOverview_ui_1"))),
                tabPanel("Sample Description",mod_project1_02sampleDescription_ui(ns("project1_02sampleDescription_ui_1"))),
                tabPanel("Explore Dataset", mod_project1_03exploreDataset_ui(ns("project1_03exploreDataset_ui_1"))),
                tabPanel("Ressources",mod_project1_04ressources_ui(ns("project1_04ressources_ui_1"))),
                tabPanel("Contact Authors",mod_project1_05contactAuthors_ui(ns("project1_05contactAuthors_ui_1")))
                )
  )
}

#' project1_00global Server Functions
#'
#' @noRd 
mod_project1_00global_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    mod_project1_01projectOverview_server("project1_01projectOverview_ui_1")
    mod_project1_02sampleDescription_server("project1_02sampleDescription_ui_1")
    mod_project1_03exploreDataset_server("project1_03exploreDataset_ui_1")
    mod_project1_04ressources_server("project1_04ressources_ui_1")
    mod_project1_05contactAuthors_server("project1_05contactAuthors_ui_1")

  })
}
    
## To be copied in the UI
# mod_project1_00global_ui("project1_00global_ui_1")
    
## To be copied in the server
# mod_project1_00global_server("project1_00global_ui_1")
