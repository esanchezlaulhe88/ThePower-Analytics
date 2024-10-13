
ui <- fluidPage(
  titlePanel("DiamondsApp"),
  p("Esta App muestra datos del Dataset diamonds de R"),
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Selecciona una Variable a estudiar", choices = c("carat", "cut", "color", "clarity")),
      sliderInput("muestra", "Tamaño de la muestra",
                  min = 1000,
                  max = nrow(diamonds),
                  value = min(5000, nrow(diamonds)), step = 500, round = 0)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Gráfico de Dispersión", plotOutput("scatterplot")),
        tabPanel("Gráfico de Barras", plotOutput("bar")),
        tabPanel("Tabla", tableOutput("tabla"))
      )
    )
  )
)

server <- function(input, output) {
  output$scatterplot <- renderPlot({
    ggplot(data = diamonds[sample(nrow(diamonds), input$muestra),],
           aes_string(x = input$variable, y = "price")) +
      geom_point()
  })
  output$bar<-renderPlot({
    ggplot(data = diamonds[sample(nrow(diamonds), input$muestra),],
           aes_string(x = input$variable)) +
      geom_bar()
  })
  output$tabla<-renderTable({
    diamonds[sample(nrow(diamonds), input$muestra),]
  })
}

shinyApp(ui = ui, server = server)



