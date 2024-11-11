# calculos.R
# este código permite guardar el listado de los alimentos que requieren imputación 
# de sus valores de contenido 


# install.packages("devtools")
# library(devtools)
# devtools::install_github("Foodprice/Foodprice", force = TRUE)
 library(Foodprice)
 library(dplyr)

source("R/funciones.R")


# Medellin----------------------------------------------------------------------
 # Redirigir la salida de la consola al archivo output.txt
 sink("txt-imputacion/output_Medellin.txt")
  # Llamar a la función y almacenar todos los datos en la variable 'data_total'
data_total_medellin <- data_costos(2013, 2023, "Medellin")
# Convertir la lista a un data.frame
data_total_df_medellin <- bind_rows(data_total_medellin, .id = "year_month")
# Guarda lo procesado
saveRDS(data_total_df_medellin, file = "data/Medellin.rsd")
# Cerrar la redirección de la salida a la consola
sink()



# Cali -------------------------------------------------------------------------
# Redirigir la salida de la consola al archivo output.txt
sink("txt-imputacion/output_Cali.txt")
# Llamar a la función y almacenar todos los datos en la variable 'data_total'
data_total_cali <- data_costos(2013, 2023, "Cali")
# Convertir la lista a un data.frame
data_total_df_cali <- bind_rows(data_total_medellin, .id = "year_month")
# Guarda lo procesado
saveRDS(data_total_df_cali, file = "data/Cali.rsd")
# Cerrar la redirección de la salida a la consola
sink()
#-------------------------------------------------------------------------------



# Bogota -------------------------------------------------------------------------
# Redirigir la salida de la consola al archivo output.txt
sink("txt-imputacion/output_Bogota.txt")
# Llamar a la función y almacenar todos los datos en la variable 'data_total'
data_total_bogota <- data_costos(2013, 2023, "Bogota")
# Convertir la lista a un data.frame
data_total_df_bogota <- bind_rows(data_total_bogota, .id = "year_month")
# Guarda lo procesado
saveRDS(data_total_df_bogota, file = "data/Bogota.rsd")
# Cerrar la redirección de la salida a la consola
sink()
#-------------------------------------------------------------------------------


# Barranquilla -------------------------------------------------------------------------
# Redirigir la salida de la consola al archivo output.txt
sink("txt-imputacion/output_Barranquilla.txt")
# Llamar a la función y almacenar todos los datos en la variable 'data_total'
data_total_barranquilla <- data_costos(2013, 2023, "Barranquilla")
# Convertir la lista a un data.frame
data_total_df_barranquilla <- bind_rows(data_total_bogota, .id = "year_month")
# Guarda lo procesado
saveRDS(data_total_df_barranquilla, file = "data/Barranquilla.rsd")
# Cerrar la redirección de la salida a la consola
sink()
#-------------------------------------------------------------------------------


# Pasto -------------------------------------------------------------------------
# Redirigir la salida de la consola al archivo output.txt
sink("txt-imputacion/output_Pasto.txt")
# Llamar a la función y almacenar todos los datos en la variable 'data_total'
data_total_pasto <- data_costos(2013, 2023, "Pasto")
# Convertir la lista a un data.frame
data_total_df_pasto <- bind_rows(data_total_pasto, .id = "year_month")
# Guarda lo procesado
saveRDS(data_total_df_pasto, file = "data/Pasto.rsd")
# Cerrar la redirección de la salida a la consola
sink()
#-------------------------------------------------------------------------------



















# segmenta la data por dietas
data_CoCA_Cali <-  subset(data_total_df_cali, diet =="CoCA")
data_CoN_Cali <-  subset(data_total_df_cali, diet =="CoNA")
data_CoRD_Cali <-  subset(data_total_df_cali, diet =="CoRD")


# -----------------------------------------------------------------------------
library(tidyr)
library(dplyr)

# Convertir el dataframe a formato ancho
data_CoCA_Cali <- data_CoCA_Cali %>%
  pivot_wider(
    names_from = c(Demo_Group, Sex), # Utiliza Demo_Group y Sex para crear nombres de columnas únicos
    values_from = cost_day,          # Los valores a colocar en las nuevas columnas
    names_sep = "-"                  # Para separar Demo_Group y Sex en los nombres de las nuevas columnas
  )


