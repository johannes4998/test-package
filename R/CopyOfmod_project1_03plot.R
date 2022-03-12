#' #' project1_03plot UI Function
#' #'
#' #' @description A shiny Module.
#' #'
#' #' @param id,input,output,session Internal parameters for {shiny}.
#' #'
#' #' @noRd 
#' #'
#' #' @importFrom shiny NS tagList 
#' mod_project1_03plot_ui <- function(id){
#'   ns <- NS(id)
#'   tagList(
#'     fluidRow(
#'       shinydashboard::box(width = 3,
#'       selectInput(ns("input1"), 
#'                   h3("Select X"),
#'                   choices = basic_data_names, selected = "Evo.meaning"),
#'       selectInput(ns("input2"), 
#'                   h3("Select Y"),
#'                   choices = basic_data_names, selected = "Personal.faith"),
#'       selectInput(ns("filter1"), 
#'                   h3("Filter by Country"),
#'                   choices = c("All Countries"="", countries), selected = "All Countries", multiple=TRUE),
#'       selectInput(ns("group1"), 
#'                   h3("Group by"),
#'                   choices = c("No group"="", basic_data_names_factor), selected = "No group"),
#'       checkboxInput(ns("na_filter"), "Filter Missing Values", value = TRUE),
#'         downloadButton(ns("downloadData"), "Download Data.csv"),
#'         downloadButton(ns("downloadPlot"), "Download Plot")
#'       ),
#'       # selectInput("group2", 
#'       #             tagList(h3("Select Plot Type",p("prototype"))),
#'       #             
#'       #             choices = c("point", "barchart"), selected = "sex"),
#'              shinydashboard::box(width = 9,
#'                plotOutput(ns("plot"))
#'                                  )
#'     )
#'     )
#'       
#' }
#'     
#' #' project1_03plot Server Functions
#' #'
#' #' @noRd 
#' mod_project1_03plot_server <- function(id){
#'   moduleServer( id, function(input, output, session){
#'     ns <- session$ns
#'     
#'     plot_ready <- reactive({
#'       
#' 
#'       data_filtered <- basic_data%>%
#'         dplyr::filter(
#'           conditional(!is.null(input$filter1), Country == input$filter1)
#'         )
#'         
#'       na <- input$na_filter
#'       x = input$input1
#'       y = input$input2
#'       class_x = class(basic_data[[x]])
#'       class_y =class(basic_data[[y]])
#'       group1 = input$group1
#'       
#'       print(class_x)
#'       print(data_filtered)
#'       
#'       
#'       
#'       if (class_x=="numeric" & class_y=="numeric") {
#'         ggplot2::ggplot(data_filtered) +
#'           ggplot2::geom_jitter(ggplot2::aes(eval(parse(text = x)), 
#'                                            eval(parse(text = y)),
#'                                            fill=eval(parse(text=group1)),
#'                                            color=eval(parse(text=group1))
#'           )) +
#'           ggplot2::scale_fill_discrete(name = group1) +
#'           ggplot2::scale_color_discrete(name = group1) +
#'           ggplot2::xlab(x) +
#'           ggplot2::ylab(y) 
#'       #  + ggplot2::ggtitle("Best plot")
#'       } else if (class_x=="factor" & class_y=="numeric") {
#'         ggplot2::ggplot(data_filtered) +
#'           ggplot2::geom_boxplot(ggplot2::aes(eval(parse(text = x)), 
#'                                              eval(parse(text = y)),
#'                                              fill=eval(parse(text=group1)),
#'                                              color=eval(parse(text=group1))
#'           )) +
#'           ggplot2::scale_fill_discrete(name = group1) +
#'           ggplot2::scale_color_discrete(name = group1) +
#'           ggplot2::xlab(x) +
#'           ggplot2::ylab(y) 
#'       } else if (class_x=="numeric" & class_y=="factor") {
#'         ggplot2::ggplot(data_filtered) +
#'           ggplot2::geom_boxplot(ggplot2::aes(eval(parse(text = x)), 
#'                                              eval(parse(text = y)),
#'                                              fill=eval(parse(text=group1)),
#'                                              color=eval(parse(text=group1))
#'           )) +
#'           ggplot2::scale_fill_discrete(name = group1) +
#'           ggplot2::scale_color_discrete(name = group1) +
#'           ggplot2::xlab(x) +
#'           ggplot2::ylab(y) 
#'       } else {
#'         ggplot2::ggplot(data_filtered) +
#'           ggplot2::geom_bar(ggplot2::aes(eval(parse(text = x)), 
#'                                          group=eval(parse(text = y)),
#'                                          fill=eval(parse(text = y))
#'           ), position = "dodge") +
#'           ggplot2::scale_fill_discrete(name = y) +
#'           ggplot2::xlab(x) +
#'           ggplot2::ylab(y) 
#'       }
#'       
#'     })
#'     
#'     
#'     output$plot <- renderPlot({
#'       plot_ready()+
#'         ggplot2::scale_x_discrete(na.translate = !input$na_filter)+
#'         ggplot2::theme(axis.text=ggplot2::element_text(size=12),
#'                        axis.title=ggplot2::element_text(size=14,face="bold"))
#'     })
#'     
#'     output$downloadData <- downloadHandler(
#'       filename = function() { paste0("Data_", input$input1,"_",input$input2,".csv")},
#'       content = function(file) {write.csv(basic_data, file = file, row.names = FALSE)}
#'     )
#'     
#'     output$downloadPlot <- downloadHandler(
#'       filename = function() { paste0("Data_", input$input1,"_",input$input2,".png") },
#'       content = function(file) {
#'         ggplot2::ggsave(file, plot = plot_ready(), device = "png")
#'       }
#'     )
#'   })
#' }
#'     
#' ## To be copied in the UI
#' # mod_project1_03plot_ui("project1_03plot_ui_1")
#'     
#' ## To be copied in the server
#' # mod_project1_03plot_server("project1_03plot_ui_1")
