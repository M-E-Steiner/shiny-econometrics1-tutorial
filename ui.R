## app.R ##

library(shinydashboard)
library(ggplot2)
library(readr)
library(dplyr)

source("modules.r", encoding = "utf8")

### User Interface -------------------------------------------------------------
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
        ), # END fluidRow
        
        fluidRow(
          box(width = 8,
              helpText("You have won a million dollar bitch"),
              valueBoxOutput("progressBox"),
              valueBoxOutput("progressBox2"))
        )
      ), # END tabItem "home"
      
      createExerciseUI("grundA1", path = path_grundA1),
      createExerciseUI("grundA2", path = path_grundA2),
      createExerciseUI("grundA3", path = path_grundA3),
      
      createExerciseUI("häufigA1", path = path_häufigA1),
      createExerciseUI("häufigA2", path = path_häufigA2),
      createExerciseUI("häufigA3", path = path_häufigA3)
    ) # END tabItems
  ) # END dashboardBody
) # END dashboardPage