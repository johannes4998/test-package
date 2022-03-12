#' project0_01generalDescription UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project0_01generalDescription_ui <- function(id){
  ns <- NS(id)
  tagList(
    HTML(paste("EuroScitizen is an EU funded COST Action (CA17127), a research network which aims to identify targeted strategies that will raise levels of scientific literacy in Europe using evolution as a model.",
               " ",
               "The Action aims to leverage the strengths of diverse stakeholders (evolutionary biologists, education researchers, educators, museum professionals and the media) in order to generate and analyse approaches used to improve the public’s scientific literacy.", 
               " ",
               "Several EuroScitizen working groups have collected data to investigate different research questions associated with evolution outreach, public knowledge and acceptance or scientific literacy.", 
               " ",
               "This interactive dashboard displays data collected in the EuroScitizen COST Action and is our way to transparently disseminate our research results. As research in EuroScitizen is still ongoing, the dashboard only includes data from completed surveys for now. It is planned to expand the dashboard to all data generated in the EuroScitizen COST Action.
               On this interactive dashboard, you can actively explore EuroScitizen data based on your own research questions, create graphs and download data.",
               " ",
               "This article/publication is based upon work from COST Action EuroScitizen, supported by COST (European Cooperation in Science and Technology).",
               " ",
               "COST (European Cooperation in Science and Technology) is a funding agency for research and innovation networks. Our Actions help connect research initiatives across Europe and enable scientists to grow their ideas by sharing them with their peers. This boosts their research, career and innovation.",
               url1,
               url2,
               sep="<br/>"
    ))
  )
}
    
#' project0_01generalDescription Server Functions
#'
#' @noRd 
mod_project0_01generalDescription_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
  })
}
    
## To be copied in the UI
# mod_project0_01generalDescription_ui("project0_01generalDescription_ui_1")
    
## To be copied in the server
# mod_project0_01generalDescription_server("project0_01generalDescription_ui_1")
