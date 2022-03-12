#' project1_02sampletable UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project1_02sampletable_ui <- function(id){
  ns <- NS(id)
  tagList(
    gt::gt_output(ns("sample_kable"))
  )
}
    
#' project1_02sampletable Server Functions
#'
#' @noRd 
mod_project1_02sampletable_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    sample_table <- dplyr::tibble(
      Variable = c("ID",
                   "Country",
                   "Age",
                   "Sex",
                   "Subject",
                   "Bio.classes",
                   "Bio.interest",
                   "Evo.meaning",
                   "Evo.school",
                   "Denomination",
                   "Personal.faith",
                   "Evo.knowledge",
                   "Evo.acceptance"),
      Description = c("Participants' Identifyer; a unique character variable for each participant",
                      "Participants' Country; a factor variable with 26 levels",
                      "Participants' Age; a numeric variable",
                      "Participants' Gender; a factor variable with three levels (female, male, other)",
                      "Participants' Subject of Study; a factor variable with two levels (Bio, Non-Bio); Bio = biology-related subject; Non-Bio = no biology-related subject",
                      "Timespan between last biology class at school and graduation; a  factor variable with five levels (no Biology at school, until >4yrs before graduation, until 3-4 yrs before graduation, until 1-2yrs before graduation  until graduation)",
                      "Participants' Interest in Biology; a factor variable with seven levels (very low to very high)",
                      "Participants' self-declared knowledge about evolution in biology; a factor variable with five levels (yes, only in parts, thereabout, no, other)",
                      "Evolution taught in participants' school",
                      "Participants' Denomination; a factor variable with seven levels (Orthodox, Catholic, Christian free churches, Protestant, Muslim, Other, None)",
                      "Participants' Personal Religious Faith; a numeric variable ranging betwen 10 (not religious at all) to 50 (very religious)",
                      "Participants' Knowledge about Evolution; the sum score of 12 items from the KAEVO scale",
                      "Participants' Acceptance of Evolution; the sum score of 8 items from the ATEVO scale")
    )
    
    output$sample_kable <- gt::render_gt({
      gt::gt(sample_table)
      })
    })
}
    
## To be copied in the UI
# mod_project1_02sampletable_ui("project1_02sampletable_ui_1")
    
## To be copied in the server
# mod_project1_02sampletable_server("project1_02sampletable_ui_1")
