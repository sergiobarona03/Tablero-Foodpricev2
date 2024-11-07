# funciones.R

# install.packages("devtools")
# library(devtools)
# devtools::install_github("Foodprice/Foodprice", force = TRUE)
library(Foodprice)
library(dplyr)

# Función de proceso datos
# Calcula los costos para un mes/año/ciudad
costos_city <- function(MONTH, YEAR, CITY){
  data.aux <- Foodprice::DataCol(Month = MONTH,
                                 Year = YEAR,
                                 City = CITY)
  
  CoCA.aux <- Foodprice::CoCA(data.aux, EER = EER) 
  CoNA.aux <- Foodprice::CoNA(data.aux, EER_LL = EER_LL, UL = UL)
  CoRD.aux <- Foodprice::CoRD(data.aux, serv = serv, diverse = diverse)
  
  total.cost <- rbind(CoCA.aux$cost[c("Demo_Group", "Sex", "cost_day")] %>% mutate(diet ="CoCA"),
                      CoNA.aux$cost[c("Demo_Group", "Sex", "cost_day")] %>% mutate(diet ="CoNA"),
                      CoRD.aux$cost[c("Demo_Group", "Sex", "cost_day")] %>% mutate(diet ="CoRD")
  )
  total.cost$month <- MONTH
  total.cost$year <- YEAR
  total.cost$city <-CITY
  
   return(total.cost)
}

#-------------------------------------------------------------------------------
# Función para procesar la data historica
#  2013 a 2023 


data_costos <- function(start_year, end_year, CITY){
  resultados <- list()
  for (year in start_year:end_year) {
    for (month in 1:12) {
      data <- costos_city(month, year, CITY)
      resultados[[paste(year, month, sep = "-")]] <- data
      
    }
  }
  return(resultados)
}

## Ejemplo de uso --------------------------------------------------------------
## Medellin
## Llamar a la función y almacenar todos los datos en la variable 'data_total'
 # data_total_medellin <- data_costos(2013, 2023, "Medellin")
## Convertir la lista a un data.frame
 # data_total_df_medellin <- bind_rows(data_total_medellin, .id = "year_month")
## Guarda lo procesado
 # saveRDS(data_total_df_medellin, file = "data/Medellin.rsd")
