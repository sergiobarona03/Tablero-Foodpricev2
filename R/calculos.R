# proceseso_data_medellin.R

# install.packages("devtools")
# library(devtools)
# devtools::install_github("Foodprice/Foodprice", force = TRUE)
 library(Foodprice)
 library(dplyr)

source("R/funciones.R")

# Medellin
# Llamar a la función y almacenar todos los datos en la variable 'data_total'
data_total_medellin <- data_costos(2013, 2023, "Medellin")
# Convertir la lista a un data.frame
data_total_df_medellin <- bind_rows(data_total_medellin, .id = "year_month")
# Guarda lo procesado
saveRDS(data_total_df_medellin, file = "data/Medellin.rsd")


# Cali
# Llamar a la función y almacenar todos los datos en la variable 'data_total'
data_total_cali <- data_costos(2013, 2023, "Cali")
# Convertir la lista a un data.frame
data_total_df_cali <- bind_rows(data_total_medellin, .id = "year_month")
# Guarda lo procesado
saveRDS(data_total_df_cali, file = "data/Cali.rsd")








