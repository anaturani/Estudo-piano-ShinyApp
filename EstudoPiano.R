library(shiny)
library(bslib)

notas <- c("C", "C#", "Db", "D", "D#", "Eb", "E", "F", "F#", "Gb", "G", "G#", "Ab", "A", "A#", "Bb", "B")
tipos <- c(
  "Maior",
  "Menor",
  "Diminuto",
  "Aumentado",
  "com 7ª maior (X7M)",
  "com 7ª (X7)",
  "menor com 7ª maior (Xm7M)",
  "menor com 7ª (Xm7)",
  "Formação 3 5 7 9",
  "Formação 7 9 3 5",
  "Formação 3 7"
)

ui <- page_sidebar(
  title = "Sorteador para estudo",
  theme = bs_theme(bootswatch = "darkly"),
  
  sidebar = sidebar(
    numericInput("qtd", "Quantidade de gerações:", value = 1, min = 1, max = 8),
    actionButton("btn_sortear", "Gerar novo", class = "btn-primary btn-lg w-100"),
    hr()
  ),
  
  card(
    card_header("Resultados"),
    uiOutput("cards_estudo")
  )
)

server <- function(input, output, session) {
  
  sorteio <- eventReactive(list(input$btn_sortear, input$qtd), ignoreNULL = FALSE, {
    n <- input$qtd
    data.frame(
      id = 1:n,
      nota = sample(notas, n, replace = TRUE),
      tarefa = sample(tipos, n, replace = TRUE)
    )
  })
  
  output$cards_estudo <- renderUI({
    dados <- sorteio()
    
    lapply(1:nrow(dados), function(i) {
      div(
        class = "p-3 mb-3 border rounded bg-secondary text-white",
        div(
          class = "d-flex justify-content-between align-items-center",
          h3(class = "m-0 text-warning", paste0(dados$nota[i])),
          span(class = "badge bg-info fs-6", dados$tarefa[i])
        )
      )
    })
  })
}

shinyApp(ui = ui, server = server)
