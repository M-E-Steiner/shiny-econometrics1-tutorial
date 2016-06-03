### Module to create an exercise

createExerciseUI <- function(id, box_width = 8, path) {
  ns <- NS(id)
  
  tabItem(
    tabName = id,
      fluidRow(
        box(width = box_width, uiOutput(ns("question"))),
        box(width = 12 - box_width, 
            numericInput(ns("numeric_answer"), label = NULL, value = data()$numeric_answer))
        # box(width = 12 - box_width, 
        #     createCheckboxAnswerUI(id))
      )
  )
}

createExercise <- function(input, output, session, path, ...){
  
  data <- reactive({read.csv(path, sep = ";")})

  output$question <- renderUI({
    withMathJax(includeMarkdown(as.character(data()$path)))
  })

}

createCheckboxAnswerUI <- function(id) {
  ns <- NS(id)
  
  tagList(
    checkboxGroupInput(ns("answer"), label = NULL, inline = TRUE,
                       choices = c("A", "B", "C", "D", "E"))
  )
}

createCheckboxAnswer <- function(input, output, session, path, ...){
  
  data <- read.csv(path, sep = ";")
  
  output$question <- renderUI({
    withMathJax(includeMarkdown(as.character(data$path)))
  })
  
}