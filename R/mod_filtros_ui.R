# mod_filtros_ui.R
mod_filtros_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    h3("Filtros"),
    # Cambiar el título del filtro a 'Ciudad' y usar el selector como un deslizador
    selectInput(ns("city"), "Ciudad", choices = c("Bogotá", "Medellín", "Cali")),
    
    # Cambiar el título a 'Periodo' y mantener el deslizador de años
     selectInput(ns("year"), "Periodo", choices = 2013:2024),
    # Cambiar el título del filtro a 'Grupo'
    selectInput(ns("group"), "Grupo", choices = c("Grupo 1", "Grupo 2", "Grupo 3")),
    
    actionButton(ns("submit"), "Aplicar Filtros")
  )
}
