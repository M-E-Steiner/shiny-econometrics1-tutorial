### Give the path to the csv files containing the questions and answers

path_grundA1 <- "exercises/csv/Grundbegriffe_Aufgabe1.csv"
path_grundA2 <- "exercises/csv/Grundbegriffe_Aufgabe2.csv"
path_grundA3 <- "exercises/csv/Grundbegriffe_Aufgabe3.csv"

path_häufigA1 <- "exercises/csv/Häufig_Aufgabe1.csv"
path_häufigA2 <- "exercises/csv/Häufig_Aufgabe2.csv"
path_häufigA3 <- "exercises/csv/Häufig_Aufgabe3.csv"

### Module to create exercises and corresponding answers -----------------------

createExerciseUI <- function(id, box_width = 8, path) {
  ns <- NS(id)

  d <- read_csv2(path)
  
  answers <- list()
  for(i in seq_along(d$answer_type)) {
    
    if(d$answer_type[i] == "choice") {
      
      answers[[i]] <- createCheckboxAnswerUI(paste0("lab", i), path = path, question = i)
      
    } else {
      
      answers[[i]] <- createNumericAnswerUI(paste0("lab", i), path = path, question = i)
      
    }
  }

  tabItem(
    tabName = id,
    fluidRow(
      box(width = box_width, uiOutput(ns("question"))),
      box(width = 12 - box_width,
          answers
          )
    )
  )
}

createExercise <- function(input, output, session, path){
  
  d <- reactive({read_csv2(path)})

  output$question <- renderUI({
    withMathJax(includeMarkdown(as.character(d()$path[1])))
  })
}

### Modules for different answer types -----------------------------------------

### Checkboxes ----------

createCheckboxAnswerUI <- function(id, path, question) {
  ns <- NS(id)
  d <- read_csv2(path)
  i <- question
  
  tagList(
    helpText(paste("Antwort zu Frage", i)),
    checkboxGroupInput(ns("answer"), label = NULL, inline = TRUE,
      choices = if(d$choice_number[i] == 2) {
        c(d$choiceA[i], d$choiceB[i])
      } else if(d$choice_number[i] == 3) {
        c(d$choiceA[i], d$choiceB[i], d$choiceC[i])
      } else if(d$choice_number[i] == 4) {
        c(d$choiceA[i], d$choiceB[i], d$choiceC[i], d$choiceD[i])
      } else if(d$choice_number[i] == 5) {
        c(d$choiceA[i], d$choiceB[i], d$choiceC[i], d$choiceD[i], d$choiceE[i])
      } else {
        stop("The maximum number of choices is 5.")
      }) 
  )
}

createCheckboxAnswer <- function(input, output, session, path) {
  
}

### Numeric input -------------

createNumericAnswerUI <- function(id, path, question) {
  ns <- NS(id)
  i <- question
  
  tagList(
    helpText(paste("Antwort zu Frage", i)),
    numericInput(ns("numeric_answer"), label = NULL, value = NULL)
  )
}

createNumericAnswer <- function(input, output, session, path) {
  
}