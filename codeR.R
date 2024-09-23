

# 
# library(ggplot2)
# library(cowplot)
# library(scales)
# library(patchwork)
# library(gridExtra)
# library(grid)
# library(viridis)
# library(knitr)
# library(tidyr)



# Borrar datos anteriores
rm(list=ls(all=TRUE))
graphics.off()
cat("\014")

### CARGAR DATOS
setwd("I:/My Drive/upc/Fundamentos de Data Science/TB1/TB1-R")

hotel_booking <- read.csv('hotel_bookings.csv', header = TRUE, sep = ",")
View(hotel_booking)

### INSPECCION DE DATOS
summary(hotel_booking) 

### PRE-PROCESAMIENTO


## IDENTIFICIACION DE DATOS FALTANTES

# CANTIDAD DE VALORES TIPO -> NA:
cat("Valores NA: ", sum(is.na(hotel_booking)))

# CANTIDAD DE VALORES TIPO -> NULL:

en_blanco <- function(x) {
  for(i in 1:ncol(x)) {
    null_count <- sum(x[, i] == "NULL")
    cat(null_count, ":", colnames(x)[i], "\n")
  }
}
en_blanco(hotel_booking)

# Resumen de valores tipo NULL y NA

c1<-null_count <- sum(hotel_booking$country == "NULL")
c2<-null_count <- sum(hotel_booking$agent == "NULL")
c3<-null_count <- sum(hotel_booking$company == "NULL")
cat("Valores tipo NULL","\n",
    "country : ",c1,"\n",
    "agent : ",c2,"\n",
    "company : ",c3,"\n"
    )

summary(hotel_booking$children)

## TRATAMIENTO DE DATOS FALTANTES

# convertir a factor los datos con valores NULL
hotel_booking$country<-as.factor(hotel_booking$country)
hotel_booking$agent<-as.factor(hotel_booking$agent)
hotel_booking$company<-as.factor(hotel_booking$company)

# convertir a NA todos los valores "NULL"
hotel_booking[hotel_booking == "NULL"] <- NA

# inspeccionar cambios
cat(
  "Valores NA","\n",
  "country: ",sum(is.na(hotel_booking$country)),"\n",
  "agent: ",sum(is.na(hotel_booking$agent)),"\n",
  "company: ",sum(is.na(hotel_booking$company))
  )
summary(hotel_booking)

# Aplicamos el reemplazo de valores NA con (moda CATEGORICOS) y (mediana NUMERICOS)
library(mlr)
hotel_booking_new <- impute(
  hotel_booking,
  classes = list(factor = imputeMode(),
                 integer = imputeMode(),
                 numeric = imputeMedian()),
  dummy.classes = c("integer", "factor"), 
  dummy.type = "numeric"
)

hotel_booking_new <- hotel_booking_new$data[, 1:min(ncol(hotel_booking))]
View(hotel_booking_new)

# inspeccionar cambios
cat(
  "Valores NA","\n",
  "children: ",sum(is.na(hotel_booking_new$children)),"\n",
  "country: ",sum(is.na(hotel_booking_new$country)),"\n",
  "agent: ",sum(is.na(hotel_booking_new$agent)),"\n",
  "company: ",sum(is.na(hotel_booking_new$company))
)
summary(hotel_booking_new)

# Guardamos el nuevo dataset 
write.csv(hotel_booking_new,'hotel_booking_2.csv',row.names= TRUE)

hotel_booking_2 <- read.csv('hotel_booking_2.csv', header = TRUE, sep = ",")
View(hotel_booking_2)
summary(hotel_booking_2)



## Identificación de Datos Atípicos (Outliers)

# Borrar datos anteriores
rm(list=ls(all=TRUE))
graphics.off()
cat("\014")

### CARGAR DATOS
setwd("I:/My Drive/upc/Fundamentos de Data Science/TB1/TB1-R")
hotel_booking_2 <- read.csv('hotel_booking_2.csv', header = TRUE, sep = ",")
View(hotel_booking_2)

library(ggplot2)
library(cowplot)
library(dplyr)

# cambiar a factor o numerico

hotel_booking_2$arrival_date_month<-as.factor(hotel_booking_2$arrival_date_month)

hotel_booking_2$meal<-as.factor(hotel_booking_2$meal)
hotel_booking_2$country<-as.factor(hotel_booking_2$country)
hotel_booking_2$market_segment<-as.factor(hotel_booking_2$market_segment)
hotel_booking_2$distribution_channel<-as.factor(hotel_booking_2$distribution_channel)
hotel_booking_2$deposit_type<-as.factor(hotel_booking_2$deposit_type)

hotel_booking_2$reservation_status<-as.factor(hotel_booking_2$reservation_status)
hotel_booking_2$customer_type<-as.factor(hotel_booking_2$customer_type)

# resumen

str(hotel_booking_2$meal)
str(hotel_booking_2$country)
str(hotel_booking_2$market_segment)
str(hotel_booking_2$distribution_channel)
str(hotel_booking_2$deposit_type)

str(hotel_booking_2$reservation_status)
str(hotel_booking_2$customer_type)

summary(hotel_booking_2$arrival_date_month)

summary(hotel_booking_2$meal)
summary(hotel_booking_2$country)
summary(hotel_booking_2$market_segment)
summary(hotel_booking_2$distribution_channel)
summary(hotel_booking_2$deposit_type)

summary(hotel_booking_2$reservation_status)
summary(hotel_booking_2$customer_type)

# graficos de boxplot

par(mfrow = c(1, 5))  

boxplot(hotel_booking_2$lead_time, main = "lead_time",col = 1, ylab = "Conteo")
boxplot(hotel_booking_2$arrival_date_year,main = "arrival_date_year",col = 2, ylab = "Conteo")
boxplot(hotel_booking_2$arrival_date_month,main = "arrival_date_month",col = 3, ylab = "Conteo")
boxplot(hotel_booking_2$arrival_date_week_number,main = "arrival_date_week_number",col = 4, ylab = "Conteo")
boxplot(hotel_booking_2$arrival_date_day_of_month, main = "arrival_date_day_of_month",col = 5, ylab = "Conteo")

par(mfrow = c(1, 5))  

boxplot(hotel_booking_2$stays_in_weekend_nights, main = "stays_in_weekend_nights",col = 1, ylab = "Conteo")
boxplot(hotel_booking_2$stays_in_week_nights, main = "stays_in_week_nights",col = 2, ylab = "Conteo")
boxplot(hotel_booking_2$adults, main = "adults",col = 3, ylab = "Conteo")
boxplot(hotel_booking_2$children, main = "children",col = 4, ylab = "Conteo")
boxplot(hotel_booking_2$babies, main = "babies",col = 5, ylab = "Conteo")

par(mfrow = c(1, 5))  

boxplot(hotel_booking_2$meal, main = "meal",col = 1, ylab = "Conteo")
boxplot(hotel_booking_2$country, main = "country",col = 2, ylab = "Conteo")
boxplot(hotel_booking_2$market_segment, main = "market_segment",col = 3, ylab = "Conteo")
boxplot(hotel_booking_2$distribution_channel, main = "distribution_channel",col = 4, ylab = "Conteo")
boxplot(hotel_booking_2$deposit_type, main = "deposit_type",col = 5, ylab = "Conteo")

par(mfrow = c(1, 5))  

boxplot(hotel_booking_2$customer_type, main = "customer_type",col = 1, ylab = "Conteo")
boxplot(hotel_booking_2$reservation_status, main = "reservation_status",col = 2, ylab = "Conteo")


## Tratamiento de Datos Atípicos


# Usamos el método del IQR para detectar y eliminar outliers

remove_outliers <- function(data, column) {
  q1 <- quantile(data[[column]], 0.25, na.rm = TRUE)
  q3 <- quantile(data[[column]], 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower_bound <- q1 - 1.5 * iqr
  upper_bound <- q3 + 1.5 * iqr
  return(data[data[[column]] >= lower_bound & data[[column]] <= upper_bound, ])
}

new_limpio <- c(
  "lead_time", "stays_in_weekend_nights", "stays_in_week_nights",
  "adults", "children", "babies", "meal", "distribution_channel", 
  "deposit_type", "customer_type")

cleaned_hotel_booking_2 <- hotel_booking_2

for (col in new_limpio) { cleaned_hotel_booking_2 <- remove_outliers(cleaned_hotel_booking_2, col)}

head(cleaned_hotel_booking_2)

# exportar dataset "cleaned_hotel_booking_2.csv"
write.csv(cleaned_hotel_booking_2,'cleaned_hotel_booking_2.csv',row.names= TRUE)


par(mfrow = c(4, 6),mar = c(4, 4, 2, 1))
boxplot(hotel_booking_2$lead_time, main = "con Outliers",row=1,col = 1, ylab = "lead_time")
boxplot(cleaned_hotel_booking_2$lead_time, main = "sin Outliers",row=1,col = 2, ylab = "lead_time")

boxplot(hotel_booking_2$stays_in_weekend_nights, main = "con Outliers",row=1,col = 3, ylab = "stays_in_weekend_nights")
boxplot(cleaned_hotel_booking_2$stays_in_weekend_nights, main = "sin Outliers",row=1,col = 4, ylab = "stays_in_weekend_nights")

boxplot(hotel_booking_2$stays_in_week_nights, main = "con Outliers",row=1,col = 5, ylab = "stays_in_week_nights")
boxplot(cleaned_hotel_booking_2$stays_in_week_nights, main = "sin Outliers",row=1,col = 6, ylab = "stays_in_week_nights")

boxplot(hotel_booking_2$adults, main = "con Outliers",row=2,col = 1, ylab = "adults")
boxplot(cleaned_hotel_booking_2$adults, main = "sin Outliers",row=2,col = 2, ylab = "adults")

boxplot(hotel_booking_2$children, main = "con Outliers",row=2,col = 3, ylab = "children")
boxplot(cleaned_hotel_booking_2$children, main = "sin Outliers",row=2,col = 4, ylab = "children")

boxplot(hotel_booking_2$babies, main = "con Outliers",row=2,col = 5, ylab = "babies")
boxplot(cleaned_hotel_booking_2$babies, main = "sin Outliers",row=2,col = 6, ylab = "babies")

boxplot(hotel_booking_2$meal, main = "con Outliers",row=3,col = 1, ylab = "meal")
boxplot(cleaned_hotel_booking_2$meal, main = "sin Outliers",row=3,col = 2, ylab = "meal")

boxplot(hotel_booking_2$market_segment, main = "con Outliers",row=3,col = 3, ylab = "market_segment")
boxplot(cleaned_hotel_booking_2$market_segment, main = "sin Outliers",row=3,col = 4, ylab = "market_segment")

boxplot(hotel_booking_2$distribution_channel, main = "con Outliers",row=3,col = 5, ylab = "distribution_channel")
boxplot(cleaned_hotel_booking_2$distribution_channel, main = "sin Outliers",row=3,col = 6, ylab = "distribution_channel")

boxplot(hotel_booking_2$deposit_type, main = "con Outliers",row=4,col = 1, ylab = "deposit_type")
boxplot(cleaned_hotel_booking_2$deposit_type, main = "sin Outliers",row=4,col = 2, ylab = "deposit_type")

boxplot(hotel_booking_2$customer_type, main = "con Outliers",row=4,col = 3, ylab = "customer_type")
boxplot(cleaned_hotel_booking_2$customer_type, main = "sin Outliers",row=4,col = 4, ylab = "customer_type")


### VISUALIZACION DE DATOS 


# Contar las reservas por tipo de hotel
g1<- ggplot(cleaned_hotel_booking_2, aes(x =hotel,fill=hotel)) + 
  geom_bar() +
  labs(title = "Reservas x Tipo de hotel", )+
  theme_classic()
g1
# segun la grafica la gente prefiere el "City Hotel"


# Grafica de Reservas x Nro de semana 
# Contar reservas por semana
reservas_por_semana <- cleaned_hotel_booking_2 %>%
  count(arrival_date_week_number, name = "cantidad_reservas_por_semana")

g2 <- ggplot(reservas_por_semana, aes(
  x = arrival_date_week_number, 
  y = cantidad_reservas_por_semana,
  group = 1)) +
  geom_smooth(se = FALSE, color = "blue", method = "loess") +
  geom_point(color = "red", size = 2) +  
  labs(title = "Cantidad de Reservas x Nro de semana",
       x = "Número de Semana",
       y = "Cantidad de Reservas") +
  theme_classic()
g2

summary(cleaned_hotel_booking_2$arrival_date_week_number)

# Grafica de Reservas x Año 
# Contar reservas por semana
reservas_por_anno <- cleaned_hotel_booking_2 %>%
  count(arrival_date_year, name = "cantidad_reservas_por_anno")
head(cantidad_reservas_por_anno)

g3 <- ggplot(reservas_por_anno, aes(
  x = arrival_date_year, 
  y = cantidad_reservas_por_anno, 
  group = 1
)) +
  geom_smooth(se = FALSE, color = "blue", method = "loess") +
  geom_point(color = "red", size = 2) +   
  
  labs(title = "Cantidad de Reservas X Año de llegada",
       x = "Año de Llegada",
       y = "Cantidad de Reservas") +
  theme_classic()
g3


# Contar las reservas por tipo de hotel
summary(cleaned_hotel_booking_2$hotel)
summary(cleaned_hotel_booking_2$arrival_date_month)
summary(cleaned_hotel_booking_2$arrival_date_year)

g4 <- ggplot(cleaned_hotel_booking_2, aes(
  x = arrival_date_month,
  fill = hotel)) + 
  geom_bar(position = "stack") +
  facet_wrap(~arrival_date_year) +
  labs(title = "Cantidad de Reservas por Tipo de Hotel y Mes",
       x = "Mes",
       y = "Cantidad de Reservas",
       fill = "Tipo de Hotel") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

g4


cleaned_hotel_booking_2 <- cleaned_hotel_booking_2 %>%
  mutate(RowNumber = row_number())
head(cleaned_hotel_booking_2)



##Bebes vs Niños 
head(cleaned_hotel_booking_2[c("children", "babies")])
# Filtrar los datos de reservas que tienen al menos un niño o un bebé
data_filtered <- cleaned_hotel_booking_2 %>%
  filter(children > 0 | babies > 0) %>%
  select(children, babies)
# Crear un nuevo dataframe que acumule las reservas de niños y bebés
data_summary <- data_filtered %>%
  summarise(total_children = sum(children), total_babies = sum(babies))
# Convertir el resumen en un formato largo para usarlo en el gráfico
data_long <- data_summary %>%
  tidyr::gather(key = "type", value = "count", total_children, total_babies)
# Crear el gráfico de barras
ggplot(data_long, aes(x = type, y = count, fill = type)) +
  geom_bar(stat = "identity") +
  labs(title = "Comparación de Reservas: Niños vs Bebés",
       x = "Tipo",
       y = "Cantidad de Reservas") +
  scale_fill_manual(values = c("total_children" = "skyblue", "total_babies" = "lightpink")) +
  theme_minimal()

# grafico sin limpieza

totales <- c(sum(hotel_booking_2$children), sum(hotel_booking_2$babies))
nombres <- c("Niños", "Bebés")
barplot(totales, names.arg = nombres, col = c("skyblue", "lightpink"),
        main = "(sin limpieza) Reservas: Niños vs Bebés",
        xlab = "Tipo", ylab = "Cantidad de Reservas",
        width = 0.5) 



# Grafico reserva de espacio en est
parking_data <- cleaned_hotel_booking_2 %>%
  group_by(required_car_parking_spaces) %>%
  summarise(reservations = n())
# Crear un gráfico de barras para mostrar las reservas según la cantidad de espacios de estacionamiento requeridos
g6<-ggplot(parking_data, aes(x = as.factor(required_car_parking_spaces), y = reservations, fill = as.factor(required_car_parking_spaces))) +
  geom_bar(stat = "identity") +
  labs(title = "Reservas según Espacios de Estacionamiento Requeridos",
       x = "Espacios de Estacionamiento Requeridos",
       y = "Cantidad de Reservas") +
  scale_fill_manual(values = c("0" = "lightblue", "1" = "darkblue")) +
  theme_minimal()
g6



#Grafico por cancelacion de reseva
cancelled_data <- cleaned_hotel_booking_2 %>%
  filter(is_canceled == 1) %>%
  group_by(arrival_date_month) %>%
  summarise(cancelations = n()) %>%
  arrange(match(arrival_date_month, month.name)) # Ordenar por el nombre del mes
# Crear el gráfico de barras de cancelaciones por mes
g7<-ggplot(cancelled_data, aes(x = factor(arrival_date_month, levels = month.name), y = cancelations, fill = arrival_date_month)) +
  geom_bar(stat = "identity") +
  labs(title = "Cancelaciones de Reservas por Mes",
       x = "Mes",
       y = "Cantidad de Cancelaciones") +
  scale_fill_viridis_d() +  # Escala de color
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Girar nombres de los meses
g7



