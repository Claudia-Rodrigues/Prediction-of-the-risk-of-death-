
library(shiny)

#install.packages("shinythemes")
library(shinythemes)



# Define UI for application 
shinyUI(fluidPage(
    
    tags$head(
        tags$link(rel="stylesheet", type="text/css", href="styles.css")
    ),
    
    # Change the appearance of the Shiny application using the shinythemes package
    theme = shinytheme("sandstone"),
    
    # Title of the application in the browser window
    
    titlePanel(title = " ", windowTitle = "Prediction of risk of death in VLBW newborn"),
    #Browser bar
    navbarPage("VLBWNB", position = "fixed-top",id="nav",
               tabPanel("Home page ", icon = icon("home", lib = "glyphicon"), value='initial',fluidRow(h1(id="cover", "Prediction of the risk of death in very low birth weight newborns")) ),
               
               tabPanel("About",icon = icon("info-circle"),
                        wellPanel(id="wp_about",
                                  
                                  h3(strong("Author")), 
                                  p("The application was developed by " ,strong("Claudia Gouveia Rodrigues"), ", under the guidance of", strong("Professor Doctor Ana Cristina da Silva Braga"),". Its construction was part of the conclusion of the Master's thesis in Systems Engineering at the University of Minho."),
                                  br(),
                                  h3(strong("Purpose of the application")),
                                  p("The purpose of this application is to facilitate the estimation, in real-time, of the probability of death risk in very low birth weight newborns, helping so health professionals to make the best decisions in the planning of prenatal and postnatal care."),
                                  br(),
                                  h3(strong("Prediction model implemented in the application")),
                                  p("The algorithm implemented in this application is a logistic regression model that presents an", em(strong("accuracy")), "of 0.926, as well as an", strong("AUC"), "(area under the curve) of 0.891 and 0.797 for internal and external validation, respectively. This model consists of 9 independent variables, which are:"),
                                  tags$ul(tags$li(strong("Gestational Age (in days)"), "– values between 160 and 280 days;"),
                                          tags$li(strong("Length at Birth (in cm)"), "– values between 25.0 and 49.0;"),
                                          tags$li(strong("Prenatal Corticosteroids"), "– possible options include “No”, that is, the mother did not recieved corticosteroids before the birth of her child, “Partial” if the birth happened before 24 hours after the take of the first dose of corticosteroids or more than a week after the last dose of corticosteroids and “Complete” if the birth happened more than 24 hours and less than a week, after at least one dose of corticosteroids;"),
                                          tags$li(strong("Insufflator Resuscitation"), "- possible options include “Yes” if the newborn received any type of positive pressure through a mask and insufflator and “No” otherwise;"),
                                          tags$li(strong("Diagnosis of NEC"), "- possible options include “Yes” if the newborn has been diagnosed with Necrotizing Enterocolitis (NEC) and “No” otherwise;"),
                                          tags$li(strong("Major Congenital Malformation"), "- possible options include “Yes” if the newborn has been diagnosed with a major congenital malformation and “No” otherwise;"),
                                          tags$li(strong("Average Apgar Score"), "– variable that corresponds to the average of the values of the Apgar indicators at the 1st, 5th and 10th minute. The possible values to choose are between 1 and 10; "),
                                          tags$li(strong("Gender"), "- possible options include “Male” and “Female”;"),
                                          tags$li(strong("Administration of Ibuprofen for treatment of PDA"), "- possible options include “Yes” if  was given to the newborn Ibuprofen, after his birth, for the treatment of persistent ductus arteriosus (PDA) and “No” otherwise.")),
                                  br(),
                                  h3(strong("Tools used")),
                                  p("This application was built using the programming language", tags$a(href="https://www.r-project.org/","R"), "(version 4.0.1), the environment", tags$a(href="https://rstudio.com/","RStudio"),  "(version 1.3.959), the package", tags$a(href="https://shiny.rstudio.com/","Shiny"),  "(version 1.5.0) and CSS3."),
                                  br(),
                                  fluidRow(column(1, tags$img(id="img_r", src = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/R_logo.svg/724px-R_logo.svg.png", width = "70px", height = "70px")),
                                           column(1, tags$img(id="img_shiny", src = "https://d33wubrfki0l68.cloudfront.net/e62783af4506cdd661cc3d282e5e726179cf41a2/01ff7/img/cursos/hex/shiny.png", width = "70px", height = "70px")),
                                           column(1,tags$img(id="img_rstudio",src = "https://rstudio.com/wp-content/uploads/2018/10/RStudio-Logo.png", width = "100px", height = "70px")),
                                           column(1,tags$img(id="img_css3",src = "https://www.kanix.com.br/images/css3.svg", width = "100px", height = "70px"))) ,
                                  br(),br()
                        )),
               
               
               tabPanel("Prevision", icon = icon("line-chart"),
                        fluidRow(id="fr1",wellPanel(id="wp",br(),br(), h1(id="prevision","Calculation of the prediction of the admission status of a very low birth weight newborn"))),
                        
                        
                        sidebarLayout(sidebarPanel(id="sp",fluidRow(column(6, sliderInput("GestationalAge", "Gestational Age (days):", min=160, max = 280, value = 160)),
                                                                    column(6, sliderInput("LengthBirth", "Length at Birth (cm):", min=25.00, max = 49.00, value = 25.00, step = 0.10))),
                                                   
                                                   fluidRow(column(6,selectInput("PrenatalCorticosteroids","Prenatal Corticosteroids:", c("No"="1", "Partial"="2","Complete"="3"))),
                                                            column(6,selectInput("InsufflatorResuscitation","Insufflator Resuscitation:", c("Yes"="1", "No"="0")))),

                                                   fluidRow(column(6,selectInput("MajorCongenitalMalformation", "Major Congenital Malformation:", c("Yes"="1", "No"="0") )), 
                                                            column(6,selectInput("DiagNec", "Diagnosis of NEC:", c("Yes"="1", "No"="0")) ) ),
                                                   
                                                   fluidRow(column(6,sliderInput("AverageApgar", "Average Apgar Score:", min = 1, max = 10, value = 1)),
                                                            column(6,selectInput("PdaTerapeutic", "Administration of Ibuprofen for treatment of PDA:", c("Yes"="1", "No"="0")))),
                                                   
                                                   fluidRow(column(6,radioButtons("Sex", "Gender:", c("Male"="1", "Female"="2") )),br(),
                                                   
                                                  column(6, div(style="display:inline-block;width:98%;text-align: right;",actionButton("calculate", "Calculate", icon = icon("refresh"))))), width = 6
                        ),mainPanel( id="prev_mp",
                                     h4(strong("Result of prediction of mortality risk in very low birth weight newborns:")),br(),
                                     h5(textOutput("result")),br(), width = 6)
                        ) )
    ))
)



