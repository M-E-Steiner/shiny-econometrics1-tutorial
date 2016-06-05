
server <- function(input, output) {
  
  output$home1 <- renderUI({
    withMathJax(includeMarkdown("exercises/markdown/Home/home1.md"))
  })
  
  output$home2 <- renderUI({
    includeMarkdown("exercises/markdown/Home/home2.md")
  })
  
  output$progressBox <- renderValueBox({
    valueBox(
      "24 %", "Anteil richtiger Antworten", icon = icon("list"),
      color = "purple"
    )
  })

  output$progressBox2 <- renderValueBox({
    valueBox(
      "24 %", "Anteil bearbeiteter Aufgaben", icon = icon("list"),
      color = "blue"
    )
  })
  
  callModule(createExercise, "grundA1", path = path_grundA1)
  callModule(createExercise, "grundA2", path = path_grundA2)
  callModule(createExercise, "grundA3", path = path_grundA3)
  callModule(createExercise, "häufigA1", path = path_häufigA1)
  callModule(createExercise, "häufigA2", path = path_häufigA2)
  callModule(createExercise, "häufigA3", path = path_häufigA3)
}