#' project1_05contactAuthors UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project1_05contactAuthors_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
    shinydashboardPlus::box(width = 6,
                            title =  "Working Group leader",
                            p("Dr. Anna Beniermann*"),
                            p("Humboldt-Universität zu Berlin"),
                            p("Biology Education"),
                            HTML("<a href = 'anna.beniermann@hu-berlin.de'>anna.beniermann@hu-berlin.de</a>"),
                            footer = "*corresponding author")),
    fluidRow(shinydashboardPlus::box(width = 6,
                            title =  "Working Group vice leader",
                            p("Prof. Dr. Rianne Pinxten"),
                            p("University of Antwerp"),
                            p("Didactics of Biology"),
                            HTML("<a href = 'annie.pinxten@uantwerpen.be'>annie.pinxten@uantwerpen.be</a>"))),
             fluidRow( shinydashboardPlus::box(width = 6,
                            title =  "Principal Investigator",
                            p("Paul Kuschmierz"),
                            p("Justus Liebig University of Giessen"),
                            p("Didactics of Biology"),
                            HTML("<a href = 'paul.kuschmierz@didaktik.bio.uni-giessen.de'>paul.kuschmierz@didaktik.bio.uni-giessen.de</a>"))
  ))
}
    
#' project1_05contactAuthors Server Functions
#'
#' @noRd 
mod_project1_05contactAuthors_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_project1_05contactAuthors_ui("project1_05contactAuthors_ui_1")
    
## To be copied in the server
# mod_project1_05contactAuthors_server("project1_05contactAuthors_ui_1")
