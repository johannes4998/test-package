#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    includeCSS("www/my_themes.css"),
    # Your application UI logic 
    shinydashboardPlus::dashboardPage(
      #options = list(sidebarExpandOnHover = TRUE),
      header = shinydashboardPlus::dashboardHeader(title = "EuroScitizen"),
      sidebar = 
        shinydashboardPlus::dashboardSidebar(
          id = "sidebar",
          #minified = TRUE,
          #collapsed = FALSE,
          shinydashboard::sidebarMenu(
            shinydashboard::menuItem("General Information", icon = icon("th"), tabName = "generalinformation"),
            shinydashboard::menuItem("Assessment", icon = icon("th"), tabName = "project1",
                                     badgeLabel = "WG1", badgeColor = "green"),
            shinydashboard::menuItem("Informal Education", icon = icon("th"), tabName = "project2",
                                     badgeLabel = "WG3", badgeColor = "green"),
            shinydashboard::menuItem("Contact", icon = icon("th"), tabName = "contact")
          )),
      shinydashboard::dashboardBody(
        shinydashboard::tabItems(
          shinydashboard::tabItem(tabName = "generalinformation",
                                  h2("The EU-funded COST Action EuroScitizen"),
                                  fluidRow(
                                    shinydashboard::box(width = 12, 
                                                        mod_project0_01global_ui("project0_01global_ui_1")
                                                        ))),
          # Project_ui
          # go to mod_projectX_01global_ui to see more details of the views
          shinydashboard::tabItem(tabName = "project1", mod_project1_00global_ui("project1_00global_ui_1")),
          shinydashboard::tabItem(tabName = "project2", mod_project2_01global_ui("project2_01global_ui_1")),
          shinydashboard::tabItem(tabName = "contact", mod_contact_ui("contact_ui_1"))
        )
      ),
      footer = shinydashboardPlus::dashboardFooter(
        left = tagList(img(src="https://cdn.discordapp.com/attachments/828303910631768067/909852463476117534/COST_LOGO_HighRes.png", height= "75px")),
        right = tagList(img(src="https://cdn.discordapp.com/attachments/828303910631768067/888401003072876584/01-Logo-Euroscitizen_Final_OK.png",height = "75px"),
                        img(src="https://i2.wp.com/empiriks.de/wp-content/uploads/2020/12/Empiriks1_PrimaryLogo_Large-1.png?fit=8409%2C4242&ssl=1", height = "75px")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  tags$head(
    favicon(ext= "png"),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'EuroCitizen'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

