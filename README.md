------------------------------------------------------------------------

editor_options: markdown: wrap: 72 ---

# App Shiny - Estudo de Piano

Um aplicativo interativo desenvolvido em **R** e **Shiny** para ajudar a estudar formações de acordes.

Foi inicialmente pensado para o estudo das formações de acordes no piano, mas pode ser usado para outros instrumentos também!

Há habilidades importantes para um músico, dentre elas: 1. **Agilidade na Formação de Acordes e Consciência Harmônica (Chord Voicing):** a construção de tríades, tétrades e tensões (como nonas, décimas primeiras e décimas terceiras) depende diretamente da superposição de intervalos. Sem a imediata identificação da terça ou da quinta de uma nota, a formação de inversões, acordes alterados e voicings no instrumento torna-se um processo mecânico lento, em vez de uma resposta instantânea. 2. **Condução de Vozes e Arranjo (Voice Leading):** no arranjo e na composição, o movimento harmônico preciso exige que o músico saiba exatamente para onde cada nota deve se mover. Compreender a distância exata de uma quarta justa ou de uma quinta aumentada permite prever e guiar resoluções harmônicas de maneira fluida, evitando paralelos proibidos e otimizando a condução de vozes. 3. **Fluência na Transposição de Tonalidades:** realizar uma transposição exige a habilidade de replicar com exatidão a mesma sequência de intervalos a partir de uma nova nota fundamental. 4. **Improvisação Coerente e Mapeamento de Escalas:** a improvisação de alto nível baseia-se na aplicação de escalas e modos sobre harmonias específicas. O conhecimento intervalar permite ao músico identificar instantaneamente as "notas de intenção" ou notas características de cada modo. 5. **Desenvolvimento do Ouvido Relativo (Percepção Auditiva):** associar a nomenclatura técnica ao som exato de uma quinta justa ou de uma sétima maior eleva a percepção auditiva.

Vale lembrar que o estudo da teoria musical e da prática instrumental frequentemente converge para a necessidade de automatização de processos cognitivos. Para essas habilidades indispensáveis, é necessário um treino prático de percepção, agilidade e memória muscular no instrumento e também a identificação instantânea de intervalos musicais a partir de qualquer nota é uma base estrutural para o desenvolvimento de competências musicais avançadas. Esse aplicativo interativo permite exatamente realizar esse estudo.

## Sobre o aplicativo

O objetivo do aplicativo é gerar combinações aleatórias de **notas fundamentais** e **tipos de acordes/formações** para que o estudante pratique a montagem imediata das harmonias no instrumento.

### Funcionalidades

- **Sorteio Aleatório Dinâmico:** Gera combinações instantâneas combinando notas fundamentais e estruturas harmônicas.
- **Configuração de Quantidade:** Permite sortear de 1 a 10 exercícios por rodada de estudo.
- **Diversidade Harmônica:**
  - **Notas:** C, C#, Db, D, D#, Eb, E, F, F#, Gb, G, G#, Ab, A, A#, Bb, B.
  - **Tríades:** Maior, Menor, Diminuto, Aumentado.
  - **Tétrades / Sétimas:** X7M, X7, Xm7M, Xm7.
  - **Voicings e Inversões:** Formação 3 5 7 9, Formação 7 9 3 5, Formação 3 7.
- Mais funcionalidades, como novos módulos de expansão harmônica, ainda em desenvolvimento!

## Executar o Shiny App

### 1. Executar diretamente pelo R / RStudio

Com o R, RStudio e a biblioteca `shiny` instalados, você pode rodar o aplicativo diretamente do GitHub executando o seguinte comando no seu console do R:

``` r
# Certifique-se de ter os pacotes instalados:

# install.packages(c("shiny", "bslib"))

shiny::runGitHub(repo = "Estudo-piano-ShinyApp", username = "anaturani")
```

### 2. Acesso rápido - online
Você pode utilizar a aplicação diretamente no seu navegador, sem precisar instalar nada, através do link:

**[https://anaturani.shinyapps.io/sorteador-harmonico-estudo/](https://anaturani.shinyapps.io/sorteador-harmonico-estudo/)**
------------------------------------------------------------------------

Desenvolvido por Ana Luiza Turani \| [analuizaturani.contato\@gmail.com](mailto:analuizaturani.contato@gmail.com){.email}

Sinta-se à vontade para enviar sugestões ou contribuir com novas ideias de exercícios!
