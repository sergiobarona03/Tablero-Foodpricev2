# mod_resultados_ui.R
mod_resultados_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    h3("Resultados Visuales"),
    plotOutput(ns("plot_coca")),  # Aquí se visualizará el gráfico del modelo CoCA
    plotOutput(ns("plot_cona")),  # Gráfico del modelo CoNA
    plotOutput(ns("plot_cord"))   # Gráfico del modelo CoRD
  )
}
