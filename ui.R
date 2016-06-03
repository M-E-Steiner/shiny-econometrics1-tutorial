## app.R ##
library(shinydashboard)

source("modules.r")

ui <- dashboardPage(
  
  dashboardHeader(title = "Übungsaufgaben: Ökonometrie 1", titleWidth = 400),
  
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem(
        "Grundbegriffe", tabName = "grund", 
        menuSubItem("Aufgabe 1", tabName = "grundA1", icon = icon("chevron-right")),
        menuSubItem("Aufgabe 2", tabName = "grundA2", icon = icon("chevron-right")),
        menuSubItem("Aufgabe 3", tabName = "grundA3", icon = icon("chevron-right"))
      ),
      menuItem(
        "Häufigkeitsverteilungen", tabName = "häufig",
        menuSubItem("Aufgabe 1", tabName = "häufigA1", icon = icon("chevron-right")),
        menuSubItem("Aufgabe 2", tabName = "häufigA2", icon = icon("chevron-right")),
        menuSubItem("Aufgabe 3", tabName = "häufigA3", icon = icon("chevron-right"))
      ) # END menuItem
    ) # END sidebarMenu
  ), # END dashboardSidebar
  
  dashboardBody(
    withMathJax(), # adds mathJax, which enables rendering of latex-like
                   # math equations. Has to be called once within the app
    tabItems(
      tabItem(
        tabName = "home",
        fluidRow(
          box(width = 8, uiOutput("home1")),
          box(width = 4, uiOutput("home2"))
        ) # END fluidRow
      ), # END tabItem "home"
      
      tabItem(
        tabName = "grundA1",
        fluidRow(
          box(width = 8, uiOutput("grund")),
          box(width = 4, uiOutput("grundA1_2"))
        )
      ),
      
      tabItem(
        tabName = "grundA2",
        fluidRow(
          box(width = 8, tableOutput("text1"))
        )
      ),
      
      exerciseCreateUI("häufigA1")
    ) # END tabItems
  ) # END dashboardBody
) # END dashboardPage