# mod_info_ui.R
mod_info_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    h3("Información Adicional"),
    tableOutput(ns("tabla_info")),  # Tabla placeholder para resultados futuros
    verbatimTextOutput(ns("text_info"))  # Información adicional o detalles
  )
}
