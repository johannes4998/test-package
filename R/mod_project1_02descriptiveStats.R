#' project1_02descriptiveStats UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project1_02descriptiveStats_ui <- function(id){
  ns <- NS(id)
  tagList(
          selectInput(ns("variable"),
                       h3("Select Variable"),
                       choices = basic_data_names, selected = "bio"),
          plotOutput(outputId = ns("plot")),
          br(),
          gt::gt_output(outputId = ns("console"))
  )
}
    
#' project1_02descriptiveStats Server Functions
#'
#' @noRd 
mod_project1_02descriptiveStats_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$plot <- renderPlot({
      ggplot2::ggplot(basic_data)+
        ggplot2::geom_histogram(ggplot2::aes(eval(parse(text=input$variable))),
                       stat="count")+
        ggplot2::xlab(input$variable)+
        ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90))+
        ggplot2::theme(axis.text=ggplot2::element_text(size=12),
              axis.title=ggplot2::element_text(size=14,face="bold"))
    })
    
    output$console <- gt::render_gt({
      proptable(basic_data, input$variable)
    })
  })
}
    
## To be copied in the UI
# mod_project1_02descriptiveStats_ui("project1_02descriptiveStats_ui_1")
    
## To be copied in the server
# mod_project1_02descriptiveStats_server("project1_02descriptiveStats_ui_1")
