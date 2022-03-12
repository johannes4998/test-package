#' project2_021euroMap UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_project2_021euroMap_ui <- function(id){
  ns <- NS(id)
  tagList(
    tags$style("
        #controls {
          background-color: #008ec1;
          opacity: 0.5;
        }
        #controls:hover{
          opacity: 1;
        }
               "),
    #control color alternative: ##1f2d33
    #tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
    leaflet::leafletOutput(ns("mymap") #width = "100%", height = "100%"
    ),
    p(),
    shinydashboard::box(selectInput(ns("selectTopic"), h4("Select Topic"),
                                    choices = c("All", 
                                                "Evolution in general",
                                                "Evolutionary mechanisms",
                                                "Evidence of evolution",
                                                "Biodiversity",
                                                "Biogeography",
                                                "Origin and evolutionary history of life",
                                                "Variation",
                                                "Transmission",
                                                "Constraints",
                                                "Species and speciation",
                                                "Outcomes of evolution",
                                                "Phylogeny",
                                                "Origin and evolutionary history of life",
                                                "Evidence of evolution",
                                                "Application of evolution",
                                                "Adaptation to climate change",
                                                "Eco/Evo/Devo",
                                                "Human genome",
                                                "Fossils",
                                                "Nutrition and DNA",
                                                "Extinctions"),
                                    selected = 1,
                                    multiple = F),
                        selectInput(ns("selectType"), h4("Select Type"),
                                    choices = c("All",
                                                "School activity",
                                                "Exhibition",
                                                "Social media",
                                                "Games",
                                                "Workshop",
                                                "Guided Visits",
                                                "Field trip",
                                                "Science cafe",
                                                "Citizen Science",
                                                "Educational program"),
                                    selected = 1,
                                    multiple = F)),
    
    shinydashboard::box(selectInput(ns("selectDuration"), h4("Select Duration"),
                                    choices = c("All", 
                                                "Permanent", "Temporary", "Regularly"),
                                    selected = 1,
                                    multiple = F),
                        selectInput(ns("selectAudience"), h4("Select Audience"),
                                    choices = c("All",
                                                "General public",
                                                "Kindergarten",
                                                "Primary school",
                                                "High school",
                                                "Teachers/Educators",
                                                "University students",
                                                "Media",
                                                "Government/policy makers"),
                                    selected = 1,
                                    multiple = F)),
    shinydashboard::box(textInput(ns("filterAll"), h4("Search Database Manually"),
                                  value = "",
                                  placeholder = "Your search query"))
  )
}


#' euromap Server Functions
#'
#' @noRd 
mod_project2_021euroMap_server  <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    # mydata <- openxlsx::read.xlsx("www/map_data_test.xlsx")
    # 
    # mydata <- mydata %>%
    #   dplyr::select(-Latitude, - Longitude)
    # 
    # mydata$Lat <- stringr::str_extract(mydata$Information, "(?<=@)-?[0-9]{1,3}\\.[0-9]*")
    # mydata$Long <- stringr::str_extract(mydata$Information, "(?<=,)-?[0-9]{1,3}\\.[0-9]*")
    # 
    # mydata_clean <- mydata %>%
    #   dplyr::filter(ShareRepo == "Yes")# %>%
    #   #head(5)
    # 
    # mydata_clean$Lat <- as.numeric(mydata_clean$Lat)
    # mydata_clean$Long <- as.numeric(mydata_clean$Long)
    # 
    # mydata_clean$label <- with(mydata_clean, paste(
    #   "<p style=`color:blue;font-size:18px;`> <b>", NameActivity, "</b> </br>","</p>",
    # 
    #   "<b>Type:</b>", TypeActivity, "</br>",
    #   "<b>Topic:</b>", Topic,"</br>",
    #   "<b>Duration:</b>", Duration,"</br>",
    #   "<b>Target Audience:</b>", Audience,"</br>",
    #   "<b>Type of Insitution:</b>", TypeInstitution,"</br>",
    #   "<b>Institution:</b>", PlaceNames,"</br>",
    #   "<b>Address:</b>", Adresses,"</br>",
    #   "<b><a href=",InstitutionWebsite,"> Website</a>" ,"</br>",
    #   "</p>"))
    
    load("www/mydata_clean.RData")

    # conditional <- function(condition, success) {
    #   if (condition) success else TRUE
    # }
    #


    data_filtered <- reactive({

      mydata_clean %>%
        dplyr::filter(
          conditional(input$selectTopic != "All", stringr::str_detect(Topic, input$selectTopic)),
          conditional(input$selectType != "All", stringr::str_detect(TypeActivity, input$selectType)),
          conditional(input$selectDuration != "All", stringr::str_detect(Duration, input$selectDuration)),
          conditional(input$selectAudience != "All", stringr::str_detect(Audience, input$selectAudience)),
          conditional(input$filterAll != "", stringr::str_detect(Topic, stringr::regex(input$filterAll, ignore_case = T)) |
                        stringr::str_detect(TypeActivity, stringr::regex(input$filterAll, ignore_case = T)) |
                        stringr::str_detect(Duration, stringr::regex(input$filterAll, ignore_case = T)) |
                        stringr::str_detect(Audience, stringr::regex(input$filterAll, ignore_case = T)))
        )
    })
    
    # observe(print(data_filtered()))

    # data_filtered <- reactive({
    #
    #  if(input$selectTopic == "All"){
    #   mydata_clean
    #  } else {
    #
    #   mydata_clean %>%
    #    dplyr::filter(str_detect(Topic, input$selectTopic))
    #  }
    #
    # })
    #

    output$mymap <- leaflet::renderLeaflet({
      leaflet::leaflet(mydata_clean)%>%
        leaflet::addProviderTiles(leaflet::providers$Stamen.TonerLite,
                                  options = leaflet::providerTileOptions(noWrap = T))%>%
        leaflet::addMarkers(lat = ~ Lat, lng = ~ Long, popup = ~label)
    })

    observe({

      leaflet::leafletProxy(ns("mymap"), data = data_filtered()) %>%
        leaflet::clearMarkers() %>%
        leaflet::addMarkers(lat = ~ Lat, lng = ~ Long, popup = ~label)

    })

  })
}

## To be copied in the UI
# mod_project2_021euroMap_ui("project2_021euroMap_ui_1")

## To be copied in the server
# mod_project2_021euroMap_server("project2_021euroMap_ui_1")
