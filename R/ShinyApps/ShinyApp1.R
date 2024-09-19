ui<-fluidPage(
  titlePanel("Diamonds App"),
  p("Esta App muestra datos del Dataset Diamonds"),
  sidebarLayout(
    sidebarPanel(
      selectInput("variable","Seleccione una variable",
                  choices = c("carat","cut","color","clarity")),
      sliderInput("muestra","Tamaño de la muestra",
                  min = 1000,
                  max = nrow(diamonds),
                  value = min(5000,nrow(diamonds)),step = 500,round = 0)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Dispersión",plotOutput("scatterplot")),
        tabPanel("Barras",plotOutput("bar")),
        tabPanel("Tabla",tableOutput("table"))
      )
    )
  )
)
server<-function(input,output){
  output$scatterplot<-renderPlot({
    ggplot(data = diamonds[sample(nrow(diamonds),input$muestra),],
           aes_string(x=input$variable,y="price"))+
      geom_point()
  })
  output$bar<-renderPlot({
    ggplot(data = diamonds[sample(nrow(diamonds),input$muestra),],
           aes_string(x=input$variable))+
      geom_bar()
  })
  output$table<-renderTable({
    diamonds[sample(nrow(diamonds),input$muestra),]
  })
}
shinyApp(ui=ui,server = server)
