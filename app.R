# Aplicación Food Price
library(shiny)
library(shinythemes)

# Cargar módulos
source("R/mod_costos_ui.R")
source("R/mod_asequibilidad_ui.R")
source("R/mod_filtros_ui.R")
source("R/mod_resultados_ui.R")
source("R/mod_info_ui.R")

# Interfaz de usuario
ui <- navbarPage(
  title = "Food Price",
  theme = shinytheme("cerulean"),  # Aplicar el tema Cerulean
  # Página de Inicio -----------------------------------------------------------
  tabPanel(
    title = "Inicio",
    fluidPage(
     # h3("Bienvenido a la Aplicación Food Price"),
      img(src = "food1.png", height = "800px", width = "1300px"),  # Agregar la imagen con tamaño ajustado
      p("Portal de indicadores de costos mínimos de tres dietas (CoCA, CoNA y CoRD) y la asequibilidad."),
      p("Pontificia Universidad Javeriana Cali - 2024"),
      
      )
  ),
  

  
  # Página de Costos (con menú lateral de filtros)
  tabPanel(
    title = "Costos",
    fluidPage(
      sidebarLayout(
        sidebarPanel(
          mod_filtros_costos_ui("filtros_costos"),
          width = 2  # Asignar 2 columnas al sidebar
        ),
        mainPanel(
          h2("Información sobre Costos de Dieta"),
          p("Esta página mostrará los costos mínimos estimados para dietas."),
          # Aquí puedes añadir los gráficos o tablas relacionadas con los costos
          plotOutput("plot_costos")
        )
      )
    )
  ),
  
  # Página de Asequibilidad ----------------------------------------------------
  tabPanel(
    title = "Asequibilidad",
    fluidPage(
      sidebarLayout(
        sidebarPanel(
          mod_filtros_asequibilidad_ui("filtros_asequibilidad"),
          width = 2  # Asignar 2 columnas al sidebar
        ),
        mainPanel(
        h2("Indicadores de Asequibilidad"),
        p("Aquí se mostrará el análisis de la asequibilidad de las dietas."),
      # Puedes agregar gráficos o análisis relacionados con asequibilidad
     )
    )
    )
  ),
  
  # Página de Información ------------------------------------------------------
  tabPanel(
    title = "Información",
    fluidPage(
      h2("Información sobre la Aplicación"),
      p("Aquí puedes agregar más información sobre el propósito y el uso de esta aplicación."),
      # Puedes añadir texto informativo o tablas adicionales
    )
  )
)

# Servidor
server <- function(input, output, session) {
  
  # Placeholder para gráficos futuros
  output$plot_coca <- renderPlot({
    # Gráfico temporal o placeholder
    plot(1:10, 1:10, type = "l", col = "blue", main = "Gráfico Placeholder CoCA")
  })
  
  output$plot_cona <- renderPlot({
    # Gráfico temporal o placeholder
    plot(1:10, rnorm(10), type = "b", col = "green", main = "Gráfico Placeholder CoNA")
  })
  
  output$plot_cord <- renderPlot({
    # Gráfico temporal o placeholder
    barplot(1:5, col = "red", main = "Gráfico Placeholder CoRD")
  })
  
  # Placeholder para tabla e información adicional
  output$tabla_info <- renderTable({
    # Tabla de ejemplo
    data.frame(Indicador = c("Costo mínimo", "Asequibilidad"), Valor = c("Pendiente", "Pendiente"))
  })
  
  output$text_info <- renderPrint({
    "Aquí se mostrará la información adicional relacionada con los modelos y resultados."
  })
}

# Ejecutar la aplicación
shinyApp(ui = ui, server = server)
