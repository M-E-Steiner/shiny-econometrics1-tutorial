
server <- function(input, output) {
  
  output$home1 <- renderUI({
    withMathJax(includeMarkdown("data/other/home1.md"))
  })
  
  output$home2 <- renderUI({
    includeMarkdown("data/other/home2.md")
  })
  
  output$grund <- renderUI({
    withMathJax(includeMarkdown("data/other/FDistribution.md"))
  })
  
  output$grundA1_2 <- renderUI({
    withMathJax(includeMarkdown("data/other/Aufgabe1_2.md"))
  })
  
  callModule(createExercise, "häufigA1", path = "data/exercises/ass4.csv")
}