## Load the necessary libraries
library(dplyr)
library(nycflight13)
library(ggplot2)

## Review structure of data
glimpse(flights)
glimpse(weather)
glimpse(airlines)
glimpse(airports)
glimpse(planes)

## Preview the flights and weather datasets
head(flights)
head(weather)

## Problem 1: Which airlines have the best and worst on-time performance?
flights_perf <- flights %>%
  group_by(carrier) %>%
  summarise(avg_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(desc(avg_dep_delay))

# Plot the result
ggplot(flights_perf, aes(x = reorder(carrier, avg_dep_delay), y = avg_dep_delay)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  theme_minimal() +
  labs(title = "Average Delay by Airline",
       x = "Airline",
       y = "Average Delay (minutes)")

## Problem 2: How does weather impact flights arrival delays?
# Combined two dataset
flight_weather <- flights %>%
    left_join(weather, by = c("year", "month", "day", "hour", "origin"))

# Calculate correlation
weather_cor <- flight_weather %>%
  select(arr_delay, temp, wind_speed, precip, visib) %>%
  summarise(temp_cor = cor(arr_delay, temp, use = "complete.obs"),
  wind_speed_cor = cor(arr_delay, wind_speed, use = "complete.obs"),
  precip_cor = cor(arr_delay, precip, use = "complete.obs"),
  visib_cor = cor(arr_delay, visib, use = "complete.obs"))

## Problem 3: What are the busiest travel days of the year?
# Load library for create date
library(lubridate)

# Group by date and count the flights
busiest_day <- flights %>%
  filter(!is.na(dep_delay)) %>%  #Removing missing value
  mutate(date = make_date(year, month, day)) %>%
  group_by(date) %>%                             
  summarise(total_flights = n())

# Plot the result
ggplot(busiest_day, aes(x = date, y = total_flights)) +
  geom_line(color = 'steelblue') +
  labs(title = "Busiest Day at NYC Airports",
       x = "Date",
       y = "Number of Flights")

## Problem 4: What time of day has the worst delays?
# Group by hour and calculate the average delay
delay_hour <- flights %>%
  group_by(hour) %>%
  summarise(avg_dep_delay = mean(dep_delay, na.rm=TRUE),
            count = n()
            ) %>%
  arrange(desc(avg_dep_delay))

# Plot the result
ggplot(delay_hour, aes(x = hour, y = avg_dep_delay)) +
  geom_bar(fill = "steelblue",stat = "identity") +
  labs(title = "Average Departure Delay by Hour",
       x = "Hour of the Day",
       y = "Average Delay (minutes)")
