
exerciseCreateUI <- function(id, box_width = 8) {
  ns <- NS(id)
  
  tabItem(
    tabName = id,
      fluidRow(
        box(width = box_width, uiOutput(ns("question"))),
        box(width = 12 - box_width, 
            checkboxGroupInput(ns("answer1"), label = NULL, inline = TRUE,
                               choices = c("A", "B", "C", "D", "E")),
            checkboxGroupInput(ns("answer2"), label = NULL, inline = TRUE,
                               choices = c("A", "B", "C", "D", "E")))
      )
  )
}

exerciseCreate <- function(input, output, session, path, ...){
  
  data <- read.csv(path, sep = ";")

  output$question <- renderUI({
    withMathJax(includeMarkdown(as.character(data$path)))
  })

}