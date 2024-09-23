# CC216--TP-2024-2
Trabajo Parcial Fundamentos de Data Science "Hotel booking demand"

Integrantes:

- Ilan André Núñez Del Arco u202217100

- Julio Cesar Meza Alfaro u202218912

- Jose Agustin Valdivia Guzman u201822153

Objetivo del Trabajo:

- Tenemos como objetivo limpiar y realizar un análisis exploratorio de datos (EDA) del conjunto de datos de reservas de hotel modificado, denominado "Hotel booking demand". Generando visualizaciones, preparando los datos y extrayendo conclusiones iniciales utilizando R/RStudio como herramienta de software.

Descripcion del Dataset:
- En este conjunto de datos se recopilan datos de un hotel urbano y otro de tipo resort. Incluye
información de cuándo se realizó la reserva, la duración de la estadía, la cantidad de espacios de
estacionamiento disponibles, cantidad de huéspedes adultos, niños y/o bebés, entre otros datos.

- Variables del dataset:

| **Nombre de la Variable**           | **Tipo de Dato** | **Descripción**                                                                 |
|-------------------------------------|------------------|---------------------------------------------------------------------------------|
| hotel                               | Categórico       | Tipo de hotel (Resort Hotel o City Hotel)                                        |
| is_canceled                         | Numérico         | Si la reserva fue cancelada (1) o no (0)                                         |
| lead_time                           | Numérico         | Número de días entre la reserva y la llegada                                     |
| arrival_date_year                   | Numérico         | Año de llegada                                                                  |
| arrival_date_month                  | Categórico       | Mes de llegada                                                                  |
| arrival_date_week_number            | Numérico         | Número de semana del año en que el huésped llegó                                 |
| arrival_date_day_of_month           | Numérico         | Día del mes en que el huésped llegó                                              |
| stays_in_weekend_nights             | Numérico         | Número de noches de fin de semana que el huésped se quedó                        |
| stays_in_week_nights                | Numérico         | Número de noches entre semana que el huésped se quedó                            |
| adults                              | Numérico         | Número de adultos                                                               |
| children                            | Numérico         | Número de niños                                                                 |
| babies                              | Numérico         | Número de bebés                                                                 |
| meal                                | Categórico       | Preferencia de comida reservada                                                  |
| country                             | Categórico       | País de origen del huésped                                                       |
| market_segment                      | Categórico       | Segmento de mercado del cual proviene la reserva                                 |
| distribution_channel                | Categórico       | Canal de distribución de la reserva                                              |
| is_repeated_guest                   | Numérico         | Si el huésped es repetido (1) o no (0)                                           |
| previous_cancellations              | Numérico         | Número de cancelaciones anteriores                                               |
| previous_bookings_not_canceled      | Numérico         | Número de reservas anteriores no canceladas                                      |
| reserved_room_type                  | Categórico       | Tipo de habitación reservada                                                     |
| assigned_room_type                  | Categórico       | Tipo de habitación asignada (puede ser diferente a la reservada)                 |
| booking_changes                     | Numérico         | Número de cambios en la reserva                                                  |
| deposit_type                        | Categórico       | Si el cliente ha recibido un depósito (No Depósito, Reembolsable, No Reembolsable)|
| agent                               | Numérico         | ID del agente de la reserva                                                      |
| company                             | Numérico         | ID de la empresa para reservas corporativas                                      |
| days_in_waiting_list                | Numérico         | Número de días en la lista de espera                                             |
| customer_type                       | Categórico       | Tipo de cliente (Transitorio, Grupo transitorio, Contrato, Grupo)                |
| adr                                 | Numérico         | Tarifa diaria promedio por cliente                                               |
| required_car_parking_spaces         | Numérico         | Número de espacios de estacionamiento requeridos                                 |
| total_of_special_requests           | Numérico         | Número de solicitudes especiales hechas por el cliente                           |
| reservation_status                  | Categórico       | Estado de la reserva (Check-Out, Cancelada, etc.)                                |
| reservation_status_date             | Categórico       | Fecha de la última actualización del estado de la reserva                        |

Conclusiones:

- El City Hotel es el tipo de alojamiento preferido, la demanda muestra un crecimiento hasta mediados de 2016, con picos de reserva en ciertos meses. Los meses de verano experimentan no solo alta demanda, sino también mayores tasas de cancelación. Las necesidades de estacionamiento son bajas, lo que sugiere que los hoteles pueden priorizar otras áreas de servicio.

- Recomendaciones:

Optimizar recursos en temporadas altas y ajustar tarifas durante los meses de menor demanda.

Revisar políticas de cancelación especialmente en los meses de verano, ya que presentan las mayores tasas de cancelación.

Considerar que, aunque el estacionamiento es valorado por algunos, la mayoría de los clientes no lo solicita, lo que permite a los hoteles enfocar recursos en otras áreas.

Aumentar la promoción y campañas dirigidas a familias que viajan con niños, dada la moderada cantidad de reservas con este perfil.

Licencia:

- MIT License


