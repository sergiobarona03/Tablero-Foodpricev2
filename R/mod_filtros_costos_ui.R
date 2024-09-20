# mod_filtros_costos_ui.R
mod_filtros_costos_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    h3("Filtros"),
    selectInput(ns("region"), "Región", choices = c("Cali", "Bogotá", "Medellín", "Barranquilla")),
    selectInput(ns("periodo"), "Periodo", choices = 2013:2024),
    selectInput(ns("dieta"), "Dieta", choices = c("CoCA", "CoNA", "CoRD")),
    selectInput(ns("grupo"), "Grupo Demográfico", choices = c("Grupo 1", "Grupo 2", "Grupo 3")),
    actionButton(ns("submit"), "Aplicar Filtros")
  )
}
