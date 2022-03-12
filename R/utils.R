# projectdescription <- openxlsx::read.xlsx("www/projectdescription.xlsx") #10kb zu 2.2kb und 30x schneller

load("www/projectdescription.Rdata")
basic_data <- readRDS("www/basic_dataset.rds")

countries <- basic_data$Country%>%unique()%>%as.character()
basic_data_names <- basic_data%>%dplyr::select(-ID)%>%names()
basic_data_names_factor <- basic_data%>%dplyr::select(where(is.factor))%>%names()

# mod_project0_01generalDescription_ui() ----
# urls links
url1 <- a("www.euroscitizen.eu", href="http://www.euroscitizen.eu/")
url2 <- a("www.cost.eu", href="https://www.cost.eu/")

# colorblindPlatte for project1_03plot
cbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7","#999999")

theme_example <- function(){
        return_theme <- 
                ggplot2::theme_classic()+
                ggplot2::theme(axis.text=ggplot2::element_text(size=12),
                               axis.title=ggplot2::element_text(size=20, face="bold"),
                               legend.title =ggplot2::element_text(size=14, face="bold"),
                               panel.background= ggplot2::element_rect(fill="#ecf0f5"),
                               plot.title = ggplot2::element_text(size = 20, face="bold"))
}


ggplot2::theme_set(theme_example())
ggplot2::update_geom_defaults("boxplot", list(fill = cbPalette[2]))
ggplot2::update_geom_defaults("bar", list(fill = cbPalette[2]))

evo_plot <- function(data, x, y, group1=NULL) {
        
        # Klassen der Inputs bestimmen
        class_x = class(data[[x]])
        class_y =class(data[[y]])
        
        # Plot mit Titel erzeugen
        p <- ggplot2::ggplot(data) +
                ggplot2::ggtitle(paste0(x, " to ", y), 
                                 subtitle = paste0("Number of Observations ",nrow(data)))+
                ggplot2::labs(caption = "Data from EuroScitzen Project")
        
        # geom zum plot hinzufügen nach Klasse von input
        if (class_x=="numeric" & class_y=="numeric") {
                p +
                        ggplot2::geom_jitter(ggplot2::aes_string(x, y, color= group1)) +
                        ggplot2::scale_color_manual(values=cbPalette)
                
        } else if (class_x=="factor" & class_y=="numeric") {
                p +
                        ggplot2::geom_boxplot(ggplot2::aes_string(x, y, fill= group1)) +
                        ggplot2::scale_fill_manual(values=cbPalette)
                
        } else if (class_x=="numeric" & class_y=="factor") {
                p +
                        ggplot2::geom_boxplot(ggplot2::aes_string(x, y, fill= group1)) +
                        ggplot2::scale_fill_manual(values=cbPalette)
                
        } else {
                p +
                        ggplot2::ggtitle(paste0(x, " by ", group1)) +
                        ggplot2::geom_bar(ggplot2::aes_string(x, group= group1, fill=group1),position = "dodge") +
                        ggplot2::scale_fill_manual(values=cbPalette)
        }
}



# mod_project2_021euroMap_server() ----
# Data cleaning for module 
# mydata <- openxlsx::read.xlsx("www/map_data_test.xlsx")
# mydata <- mydata %>%
#  dplyr::select(-Latitude, - Longitude)
# 
# mydata$Lat <- stringr::str_extract(mydata$Information, "(?<=@)-?[0-9]{1,3}\\.[0-9]*")
# mydata$Long <- stringr::str_extract(mydata$Information, "(?<=,)-?[0-9]{1,3}\\.[0-9]*")
# 
# mydata_clean <- mydata %>%
#  dplyr::filter(ShareRepo == "Yes") %>%
#  head(5)
# 
# mydata_clean$Lat <- as.numeric(mydata_clean$Lat)
# mydata_clean$Long <- as.numeric(mydata_clean$Long)
# 
# mydata_clean$label <- with(mydata_clean, paste(
#  "<p style=`color:blue;font-size:18px;`> <b>", NameActivity, "</b> </br>",
#  "</p>",
#  "<b>Type:</b>", TypeActivity, "</br>",
#  "<b>Topic:</b>", Topic,"</br>",
#  "<b>Duration:</b>", Duration,"</br>",
#  "<b>Target Audience:</b>", Audience,"</br>",
#  "<b>Type of Insitution:</b>", TypeInstitution,"</br>",
#  "<b>Institution:</b>", PlaceNames,"</br>",
#  "<b>Address:</b>", Adresses,"</br>",
#  "<b><a href=",InstitutionWebsite,"> Website</a>" ,"</br>",
#  "</p>"))
# load("www/mydata_clean.RData") # von 60kb zu 5.2kb und 72x schneller

# mod_project2_021euroMap_server() ----
# function for used in module
conditional <- function(condition, success) {
 if (condition) success else TRUE
}
# mod_project1_02sampletable_server() ----
# data for knit table


load("www/map.RData")
mytext$Sample <- NULL
Sample <- c(277L, 196L, 82L, 159L, 400L, 214L, 748L, 1049L, 161L, 394L, 
            230L, 733L, 176L, 196L, 399L, 444L, 460L, 149L, 675L, 322L, 212L, 
            34L, 68L, 85L, 91L, 1246L)

mybins <- c(seq(0,1000,200),Inf)#c(0,10,20,50,100,1000,Inf)
mypalette <- leaflet::colorBin( palette="YlOrBr", domain=Sample, na.color="transparent", bins=mybins)

m <- leaflet::leaflet(test) %>% 
        leaflet::addTiles()  %>% 
        leaflet::setView( lat=55, lng=10 , zoom=3) %>%
        leaflet::addPolygons( 
                fillColor = ~mypalette(Sample), 
                stroke=TRUE, 
                fillOpacity = 0.9, 
                color="white", 
                weight=0.3,
                label = mytext,
                labelOptions = leaflet::labelOptions( 
                        style = list("font-weight" = "normal", padding = "3px 8px"), 
                        textsize = "13px", 
                        direction = "auto"
                )
        ) %>%
        leaflet::addLegend(pal=mypalette, values=~mypalette(Sample), opacity=0.9, title = "Sample Size", position = "bottomleft" )

m[["x"]][["calls"]][[3]][["args"]][[1]][["labels"]][[6]] <- ">1,000"
m

# histogram(basic_data$sex)
# 
# 
# ggplot(basic_data)+
#         geom_histogram(aes(sex), stat="count")
# 
# base::summary(basic_data$sex)
# 
# eval(parse(text="test"))

# basic_data <- readRDS("www/basic_dataset.rds")
# for(i in 1:15){
#         print(summary(basic_data[[i]]) )    
# }

## Only run examples in interactive R sessions

proptable <- function(df= basic_data, variable="Sex") {
        
        #variable <- enquo(variable)
        
        df%>%
                dplyr::select(.data[[variable]])%>%
                dplyr::group_by(.data[[variable]])%>%
                dplyr::summarise(count = dplyr::n()) %>%
                dplyr::mutate(prop = count/sum(count))%>%
                tidyr::gather(key = key, value = value, 2:ncol(.)) %>% 
                tidyr::spread(key = names(.)[1], value = "value")%>%
                dplyr::rename(" "=key)%>%
                gt::gt()%>%
                gt::fmt_percent(
                        columns = !" ",
                        rows = 2,
                        decimals = 2
                )
}