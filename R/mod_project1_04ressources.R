#' project1_04ressources UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project1_04ressources_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
    shinydashboardPlus::box(width = 6,
                            title="Towards common ground in measuring acceptance of evolution and knowledge about evolution across Europe",
                            p("Kuschmierz, P., Meneganzin, A., Pinxten, R., Pievani, T., Cvetković, D., Mavrikaki, E., Graf, D. & Beniermann, A. (2020). Towards common ground in measuring acceptance of evolution and knowledge about evolution across Europe: a systematic review of the state of research. Evolution: Education and Outreach, 13(1), 1-24.",
                              HTML('<a href="https://doi.org/10.1186/s12052-020-00132-w">https://doi.org/10.1186/s12052-020-00132-w</a>')))
    ),
    fluidRow(
           shinydashboardPlus::box(width = 6,
                                   title="Evolution Education Questionnaire on Acceptance and Knowledge (EEQ)",
                                   p("Beniermann, A., Kuschmierz, P., Pinxten, R. Aivelo, T., Bohlin, G., Brennecke, J. S., Cebesoy, U. B., Cvetković, D., Đorđević, M., Dvořáková, R. M., Futo, M., Geamana, N., Korfiatis, K., Lendvai, A., Mogias, A., Paolucci, S., Petersson, M., Pietrzak, B, Porozovs, J., Realdon, G., Savković, U., Sofonea, M. T., Šorgo, A., Stermin, A. N., Torkar, G., Uitto, A., Vázquez-Ben, L., & Graf, D. (2021, February 22). Evolution Education Questionnaire on Acceptance and Knowledge (EEQ) – Standardised and ready-to-use protocols to measure acceptance of evolution and knowledge about evolution in an international context. Zenodo.",
                              HTML('<a href="http://doi.org/10.5281/zenodo.4554742">http://doi.org/10.5281/zenodo.4554742</a>'))),
    )
  )
}

    
#' project1_04ressources Server Functions
#'
#' @noRd 
mod_project1_04ressources_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_project1_04ressources_ui("project1_04ressources_ui_1")
    
## To be copied in the server
# mod_project1_04ressources_server("project1_04ressources_ui_1")
