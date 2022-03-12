#' project2_01global UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project2_01global_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      h2("Evolution Education Sites"),
      tabsetPanel(type = "tabs",
                  tabPanel("Project Overview",mod_project2_01projectOverview_ui(ns("project2_01projectOverview_ui_1"))),
                  tabPanel("Explore Map", mod_project2_02exploreMap_ui(ns("project2_02exploreMap_ui_1"))),
                  tabPanel("Ressources", mod_project2_03ressources_ui(ns("project2_03ressources_ui_1"))),
                  tabPanel("Contact Authors", mod_project2_04contactAuthors_ui(ns("project2_04contactAuthors_ui_1")))
      )
    )
  )
}

#' project2_01global Server Functions
#'
#' @noRd 
mod_project2_01global_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    mod_project2_01projectOverview_server("project2_01projectOverview_ui_1")
    mod_project2_02exploreMap_server("project2_02exploreMap_ui_1")
    mod_project2_03ressources_server("project2_03ressources_ui_1")
    mod_project2_04contactAuthors_server("project2_04contactAuthors_ui_1")
  })   
}

## To be copied in the UI
# mod_project2_01global_ui("project2_01global_ui_1")

## To be copied in the server
# mod_project2_01global_server("project2_01global_ui_1")
