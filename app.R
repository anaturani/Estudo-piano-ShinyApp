library(shiny)
library(bslib)

# Definição dos temas
tema_escuro <- bs_theme(bootswatch = "darkly")
tema_claro  <- bs_theme(bootswatch = "flatly")

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

ui <- page_fluid(
  theme = tema_escuro,
  
  #Estilização própria  
  tags$head(
    tags$style(HTML("
      body { 
        padding: 15px; 
        padding-bottom: 80px; /* Margem inferior para o botão fixo não cobrir nada */
      }
      
      #qtd {
        max-width: 75px;
        text-align: center;
        font-weight: bold;
      }
      
      /* Estilos condicionais do input baseados no tema ativo */
      .bslib-as-darkly #qtd {
        background-color: transparent !important;
        color: #ffffff !important;
        border: 1px solid #6c757d !important;
      }
      
      .bslib-as-flatly #qtd {
        background-color: #ffffff !important;
        color: #212529 !important;
        border: 1px solid #ced4da !important;
      }
      
      .card { background-color: transparent !important; }
      
      /* Classe para fixar o botão no canto inferior direito */
      .btn-tema-fixo {
        position: fixed;
        bottom: 20px;
        right: 20px;
        z-index: 1000;
      }
    "))
  ),
  
  #Cabeçalho
  div(
    class = "text-center mb-3",
    h4(class = "fw-bold mb-1", "Sorteador Harmônico"),
    p(class = "text-muted small mb-0", "Gere combinações aleatórias de notas fundamentais e estruturas harmônicas para praticar a montagem no piano.")
  ),
  
  #Controles
  div(
    class = "d-flex justify-content-between align-items-center mb-3 px-2",
    div(
      class = "d-flex align-items-center gap-2",
      tags$label(`for` = "qtd", class = "small m-0", "Quantidade:"),
      numericInput("qtd", label = NULL, value = 5, min = 1, max = 10)
    ),
    actionButton(
      "btn_sortear", 
      "Gerar novo", 
      class = "btn-sm text-white fw-semibold border-0 px-3 py-1",
      style = "background-color: #151982;"
    )
  ),
  
  #Área de exercicios
  uiOutput("cards_estudo"),
  
  div(
    class = "btn-tema-fixo",
    actionButton(
      "btn_tema", 
      "Modo claro", 
      class = "btn-sm text-white fw-semibold border-0 px-3 py-1 shadow-sm",
      style = "background-color: #151982;"
    )
  )
)

server <- function(input, output, session) {
  
  modo_escuro <- reactiveVal(TRUE)
  
  #Troca de tema
  observeEvent(input$btn_tema, {
    if (modo_escuro()) {
      session$setCurrentTheme(tema_claro)
      updateActionButton(session, "btn_tema", label = "Modo escuro")
      modo_escuro(FALSE)
    } else {
      session$setCurrentTheme(tema_escuro)
      updateActionButton(session, "btn_tema", label = "Modo claro")
      modo_escuro(TRUE)
    }
  })
  
  sorteio <- eventReactive(list(input$btn_sortear, input$qtd), ignoreNULL = FALSE, {
    n <- input$qtd
    data.frame(
      id = 1:n,
      nota = sample(notas, n, replace = TRUE),
      tarefa = sample(tipos, n, replace = TRUE)
    )
  })
  
  gerar_card <- function(nota, tarefa) {
    div(
      class = "py-2 px-3 mb-2 rounded border border-secondary bg-transparent d-flex justify-content-center align-items-center gap-3",
      span(class = "fs-3 fw-bold", style = "color: #FF8E0D;", nota),
      span(class = "badge fs-5 fw-normal px-3 py-2 text-white rounded-pill", style = "background-color: #151982;", tarefa)
    )
  }
  
  output$cards_estudo <- renderUI({
    dados <- sorteio()
    n <- nrow(dados)
    
    if (n == 0) return(NULL)
    
    if (n == 1) {
      return(
        div(
          class = "row justify-content-center",
          div(class = "col-md-6", gerar_card(dados$nota[1], dados$tarefa[1]))
        )
      )
    }
    
    meio <- ceiling(n / 2)
    
    col1_indices <- 1:meio
    col2_indices <- (meio + 1):n
    
    col1_items <- lapply(col1_indices, function(i) gerar_card(dados$nota[i], dados$tarefa[i]))
    col2_items <- lapply(col2_indices, function(i) gerar_card(dados$nota[i], dados$tarefa[i]))
    
    div(
      class = "row g-3",
      div(class = "col-6", col1_items),
      div(class = "col-6", col2_items)
    )
  })
}

shinyApp(ui = ui, server = server)