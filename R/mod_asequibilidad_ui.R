# mod_filtros_asequibilidad_ui.R
mod_filtros_asequibilidad_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    h3("Filtros"),
    selectInput(ns("region"), "Región", choices = c("Cali", "Bogotá", "Medellín", "Barranquilla")),
    selectInput(ns("periodo"), "Periodo", choices = 2013:2024),
    selectInput(ns("dieta"), "Dieta", choices = c("CoCA", "CoNA", "CoRD")),
    actionButton(ns("submit"), "Aplicar Filtros")
  )
}
