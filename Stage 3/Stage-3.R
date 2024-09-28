# Install necessary packages
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("plotly")
install.packages("dplyr")
install.packages("tidyr")
install.packages("tibble")

# load necessary packages
library(tidyverse)
library(ggplot2)
library(plotly)
library(dplyr)
library(tidyr)
library(tibble)

#Read in the datasets
cholera_fatalities <- read.csv("HackBio/Number of Cholera case fatality.csv")
view(cholera_fatalities)
fatalities_unique_values <- lapply(cholera_fatalities, unique)

cholera_cases <- read.csv("HackBio/Number of reported Cholera cases.csv")
view(cholera_cases)
cases_unique_values <- lapply(cholera_cases, unique)

cholera_deaths <- read.csv("HackBio/Number of reported Cholera deaths.csv")
view(cholera_deaths)
cases_unique_values <- lapply(cholera_deaths, unique)

#Checking for missing values
sum(is.na(cholera_fatalities))
sum(is.na(cholera_cases))
sum(is.na(cholera_deaths))

# Convert column to integer type in dataset
cholera_fatalities <- cholera_fatalities %>%
  mutate(Cholera_case_fatality_rate = as.integer(Cholera.case.fatality.rate))
glimpse(cholera_fatalities)

cholera_cases <- cholera_cases %>%
  mutate(Number_of_reported_cases_of_cholera = as.integer(Number.of.reported.cases.of.cholera))
glimpse(cholera_cases)

cholera_deaths <- cholera_deaths %>%
  mutate(Number_of_reported_deaths_from_cholera = as.integer(Number.of.reported.deaths.from.cholera))
glimpse(cholera_deaths)

#Dataset 1: Number of Cholera fatalities
# 1. Rplot1: Cholera case fatality rates by country
# Data Preparation
# Convert 'Cholera.case.fatality.rate' to numeric, handling non-numeric values
cholera_fatalities_cleaned <- cholera_fatalities %>%
  mutate(Cholera.case.fatality.rate = as.numeric(Cholera.case.fatality.rate))

# Check for any NAs introduced by coercion (non-numeric values)
summary(cholera_fatalities_cleaned$Cholera.case.fatality.rate)

# Remove rows where 'Cholera.case.fatality.rate' is NA
cholera_fatalities_cleaned <- cholera_fatalities_cleaned %>%
  filter(!is.na(Cholera.case.fatality.rate))

# Calculate total cholera case fatalities by country or region
cholera_case_fatality_by_country <- cholera_fatalities_cleaned %>%
  group_by(Countries) %>%
  summarise(total_fatalities = sum(Cholera.case.fatality.rate, na.rm = TRUE)) %>%
  arrange(desc(total_fatalities))  # Sort countries by the number of case fatality rates

# Visualization
# Create an interactive bar plot showing countries with the highest cholera fatality rates
fatality_bar_plot <- plot_ly(cholera_case_fatality_by_country,  # Use summarized data here
                             x = ~Countries, 
                             y = ~total_fatalities, 
                             type = 'bar',
                             marker = list(color = 'steelblue')) %>%  
  layout(title = "Cholera Case Fatality Rates Reported by Country (Since 1949)",
         xaxis = list(title = "Country/Region"),
         yaxis = list(title = "Total Reported Fatality Rates"),
         plot_bgcolor = 'lightgray') 
# Display the plot
fatality_bar_plot

# 2. Rplot2: Top 5 Countries with the Highest Fatality Rates

# Convert 'Cholera.case.fatality.rate' to numeric and filter non-numeric values
Top5_highest_fatalities <- cholera_fatalities %>%
  mutate(Cholera.case.fatality.rate = as.numeric(Cholera.case.fatality.rate))

# Remove rows where 'Cholera.case.fatality.rate' is NA
Top5_highest_fatalities <- Top5_highest_fatalities %>%
  filter(!is.na(Cholera.case.fatality.rate))

# Group by countries and calculate the total fatality rate, then arrange by descending order
Top5_cholera_case_fatality <- Top5_highest_fatalities %>%
  group_by(Countries) %>%
  summarise(Top5_fatalities = sum(Cholera.case.fatality.rate, na.rm = TRUE)) %>%
  arrange(desc(Top5_fatalities)) %>%
  slice_head(n = 5)  # Limit the result to the top 5 countries

# Visualization
# Create an interactive bar plot showing the top 5 countries with the highest cholera fatality rates
Top5_fatality_bar_plot <- plot_ly(Top5_cholera_case_fatality, 
                                  x = ~Countries, 
                                  y = ~Top5_fatalities, 
                                  type = 'bar',
                                  marker = list(color = 'red')) %>%
  layout(title = "Top 5 Countries with the Highest Cholera Case Fatality Rates (Since 1949)",
         xaxis = list(title = "Country/Region"),
         yaxis = list(title = "Total Fatality Rates"),
         plot_bgcolor = 'lightgray')  

# Display the plot
Top5_fatality_bar_plot

# Rplot3: Top 50 Countries with the Lowest Fatality Rates

# Convert 'Cholera.case.fatality.rate' to numeric and filter non-numeric values
Lowest50_fatalities <- cholera_fatalities %>%
  mutate(Cholera.case.fatality.rate = as.numeric(Cholera.case.fatality.rate))

# Remove rows where 'Cholera.case.fatality.rate' is NA
Lowest50_fatalities <- Lowest50_fatalities %>%
  filter(!is.na(Cholera.case.fatality.rate))

# Group by countries and calculate the total fatality rate, then arrange by ascending order (for lowest)
Lowest50_cholera_case_fatality <- Lowest50_fatalities %>%
  group_by(Countries) %>%
  summarise(Lowest50_fatalities = sum(Cholera.case.fatality.rate, na.rm = TRUE)) %>%
  arrange(Lowest50_fatalities) %>%
  slice_head(n = 50)  # Limit the result to the top 50 countries with the lowest fatality rates

# Visualization
# Create an interactive bar plot showing the top 50 countries with the lowest cholera fatality rates
Lowest50_fatality_bar_plot <- plot_ly(Lowest50_cholera_case_fatality, 
                                     x = ~Countries, 
                                     y = ~Lowest50_fatalities, 
                                     type = 'bar',
                                     marker = list(color = 'green')) %>%  
  layout(title = "Top 50 Countries with the Lowest Cholera Case Fatality Rates (Since 1949)",
         xaxis = list(title = "Country/Region"),
         yaxis = list(title = "Total Fatality Rates"),
         plot_bgcolor = 'lightyellow')  

# Display the plot
Lowest50_fatality_bar_plot

# Rplot4: Trends in Cholera fatalities Over Time
fatalities_over_time <- cholera_fatalities %>%
  mutate(Year = as.numeric(Year),
         Cholera.case.fatality.rate = as.numeric(Cholera.case.fatality.rate)) %>%
  filter(!is.na(Cholera.case.fatality.rate))

# Summarize fatalities by year
cholera_fatalities_trend <- fatalities_over_time %>%
  group_by(Year) %>%
  summarise(total_fatalities = sum(Cholera.case.fatality.rate, na.rm = TRUE)) %>%
  arrange(Year)

# Visualization
# Create a line plot for trends in cholera fatalities over time
cholera_trend_plot <- plot_ly(cholera_fatalities_trend, 
                              x = ~Year, 
                              y = ~total_fatalities, 
                              type = 'scatter', 
                              mode = 'lines+markers',
                              marker = list(color = 'orange')) %>%  
  layout(title = "Trends in Reported Cholera Fatalities Over Time",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Total Reported Fatalities"),
         plot_bgcolor = 'lavender')  
cholera_trend_plot

# Rplot5: Highest Annual Cholera fatality for a Specific Country (e.g., "Nigeria")
# Filter the data for the specific country
cholera_country_specific <- fatalities_over_time %>%
  filter(Countries == "Nigeria")

# Summarise by year for that country
annual_fatalities_country <- cholera_country_specific %>%
  group_by(Year) %>%
  summarise(total_fatalities = sum(Cholera.case.fatality.rate, na.rm = TRUE)) %>%
  arrange(desc(total_fatalities))  # Sort by year for highest annual fatalities

# Visualization
# Create a line plot for the annual cholera fatalities in the country
annual_fatalities_plot <- plot_ly(annual_fatalities_country, 
                             x = ~Year, 
                             y = ~total_fatalities, 
                             type = 'scatter', 
                             mode = 'lines+markers',
                             marker = list(color = 'blue')) %>%  
  layout(title = "Annual Cholera Fatalities for Nigeria",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Total Reported Fatalities"),
         plot_bgcolor = 'white')  
annual_fatalities_plot

##################################################
#Dataset2: Number of reported Cholera cases
# 1. Rplot1: Number of reported Cholera cases by country
# Data Preparation
# Convert 'Number.of.reported.cases.of.cholera' to numeric, handling non-numeric values
cholera_cases_cleaned <- cholera_cases %>%
  mutate(Number.of.reported.cases.of.cholera = as.numeric(Number.of.reported.cases.of.cholera))

# Check for any NAs introduced by coercion (non-numeric values)
summary(cholera_cases_cleaned$Number.of.reported.cases.of.cholera)

# Remove rows where 'Number.of.reported.cases.of.cholera' is NA
cholera_cases_cleaned <- cholera_cases_cleaned %>%
  filter(!is.na(Number.of.reported.cases.of.cholera))

# Calculate total reported cholera cases by country or region
cholera_cases_by_country <- cholera_cases_cleaned %>%
  group_by(Countries) %>%
  summarise(total_cases = sum(Number.of.reported.cases.of.cholera, na.rm = TRUE)) %>%
  arrange(desc(total_cases))  # Sort countries by the number of reported cholera cases 

# Visualization
# Create an interactive bar plot showing countries with the highest reported cholera cases
cholera_case_bar_plot <- plot_ly(cholera_cases_by_country, 
                             x = ~Countries, 
                             y = ~total_cases, 
                             type = 'bar',
                             marker = list(color = 'brown')) %>%  
  layout(title = "Number of Cholera Cases Reported by Country (Since 1949)",
         xaxis = list(title = "Country/Region"),
         yaxis = list(title = "Total Reported Cholera Cases"),
         plot_bgcolor = 'white') 
# Display the plot
cholera_case_bar_plot

# 2. Rplot2: Top 5 Countries with the Highest Cholera cases

# Convert 'Number.of.reported.cases.of.cholera' to numeric and filter non-numeric values
Top5_highest_cases <- cholera_cases %>%
  mutate(Number.of.reported.cases.of.cholera = as.numeric(Number.of.reported.cases.of.cholera))
Top5_highest_cases <- Top5_highest_cases %>%
  filter(!is.na(Number.of.reported.cases.of.cholera))

# Group by countries and calculate the total reported cases, then arrange by descending order
Top5_cholera_cases <- Top5_highest_cases %>%
  group_by(Countries) %>%
  summarise(Top5_cases = sum(Number.of.reported.cases.of.cholera, na.rm = TRUE)) %>%
  arrange(desc(Top5_cases)) %>%
  slice_head(n = 5)  

# Visualization
# Create an interactive bar plot showing the top 5 countries with the highest cholera cases
Top5_cases_bar_plot <- plot_ly(Top5_cholera_cases, 
                                  x = ~Countries, 
                                  y = ~Top5_cases, 
                                  type = 'bar',
                                  marker = list(color = 'darkblue')) %>%
  layout(title = "Top 5 Countries with the Highest Reported Cholera Cases (Since 1949)",
         xaxis = list(title = "Country/Region"),
         yaxis = list(title = "Total Reported Cholera Cases"),
         plot_bgcolor = 'white')  

# Display the plot
Top5_cases_bar_plot

# Rplot3: Top 50 Countries with the Lowest Reported cholera cases
# Convert 'Number.of.reported.cases.of.cholera' to numeric and filter non-numeric values
Lowest50_cases <- cholera_cases %>%
  mutate(Number.of.reported.cases.of.cholera = as.numeric(Number.of.reported.cases.of.cholera))

# Remove rows where 'Number.of.reported.cases.of.cholera' is NA
Lowest50_cases <- Lowest50_cases %>%
  filter(!is.na(Number.of.reported.cases.of.cholera))

# Group by countries and calculate the total reported cases, then arrange by ascending order (for lowest)
Lowest50_cholera_cases <- Lowest50_cases %>%
  group_by(Countries) %>%
  summarise(Lowest50_cases = sum(Number.of.reported.cases.of.cholera, na.rm = TRUE)) %>%
  arrange(Lowest50_cases) %>%
  slice_head(n = 50)  # Limit the result to the top 50 countries with the lowest reported cases

# Visualization
# Create an interactive bar plot showing the top 50 countries with the lowest reported cholera cases
Lowest50_cases_bar_plot <- plot_ly(Lowest50_cholera_cases, 
                                      x = ~Countries, 
                                      y = ~Lowest50_cases, 
                                      type = 'bar',
                                      marker = list(color = 'darkgreen')) %>%  
  layout(title = "Top 50 Countries with the Lowest Reported Cholera Cases (Since 1949)",
         xaxis = list(title = "Country/Region"),
         yaxis = list(title = "Total Reported Cholera Cases"),
         plot_bgcolor = 'white')  
Lowest50_cases_bar_plot

# Rplot4: Trends in Cholera cases Over Time
cases_over_time <- cholera_cases %>%
  mutate(Year = as.numeric(Year),
         Number.of.reported.cases.of.cholera = as.numeric(Number.of.reported.cases.of.cholera)) %>%
  filter(!is.na(Number.of.reported.cases.of.cholera))

# Summarize cases by year
cholera_cases_trend <- cases_over_time %>%
  group_by(Year) %>%
  summarise(total_cases = sum(Number.of.reported.cases.of.cholera, na.rm = TRUE)) %>%
  arrange(Year)

# Visualization
# Create a line plot for trends in cholera cases over time
cholera_cases_trend_plot <- plot_ly(cholera_cases_trend, 
                              x = ~Year, 
                              y = ~total_cases, 
                              type = 'scatter', 
                              mode = 'lines+markers',
                              marker = list(color = 'brown')) %>%  
  layout(title = "Trends in Reported Cholera Cases Over Time",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Total Reported Cases"),
         plot_bgcolor = 'white')  
cholera_cases_trend_plot

# Rplot5: Highest Annual Cholera cases for a Specific Country (e.g., "Nigeria")
# Filter the data for the specific country
cholera_country_specific <- cholera_cases %>%
  filter(Countries == "Nigeria")

# Summarise by year for that country
annual_cases_country <- cholera_country_specific %>%
  group_by(Year) %>%
  summarise(total_cases = sum(Number.of.reported.cases.of.cholera, na.rm = TRUE)) %>%
  arrange(desc(total_cases))  # Sort by year for highest annual cases

# Visualization
# Create a line plot for the annual cholera cases in the country
annual_cases_plot <- plot_ly(annual_cases_country, 
                                  x = ~Year, 
                                  y = ~total_cases, 
                                  type = 'scatter', 
                                  mode = 'lines+markers',
                                  marker = list(color = 'brown')) %>%  
  layout(title = "Annual Cholera Cases for Nigeria",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Total Reported Cholera cases"),
         plot_bgcolor = 'white')  
annual_cases_plot


##################################################
#Dataset3: Number of reported Cholera deaths
# 1. Rplot1: Number of reported Cholera deaths by country
# Data Preparation
# Convert 'Number.of.reported.deaths.from.cholera' to numeric, handling non-numeric values
cholera_deaths_cleaned <- cholera_deaths %>%
  mutate(Number.of.reported.deaths.from.cholera = as.numeric(Number.of.reported.deaths.from.cholera))

# Check for any NAs introduced by coercion (non-numeric values)
summary(cholera_deaths_cleaned$Number.of.reported.deaths.from.cholera)

# Remove rows where 'Number.of.reported.deaths.from.cholera' is NA
cholera_deaths_cleaned <- cholera_deaths_cleaned %>%
  filter(!is.na(Number.of.reported.deaths.from.cholera))

# Calculate total reported cholera deaths by country or region
cholera_deaths_by_country <- cholera_deaths_cleaned %>%
  group_by(Countries) %>%
  summarise(total_deaths = sum(Number.of.reported.deaths.from.cholera, na.rm = TRUE)) %>%
  arrange(desc(total_deaths))  # Sort countries by the number of reported cholera deaths 

# Visualization
# Create an interactive bar plot showing countries with the highest reported cholera deaths
cholera_deaths_bar_plot <- plot_ly(cholera_deaths_by_country,  
                                 x = ~Countries, 
                                 y = ~total_deaths, 
                                 type = 'bar',
                                 marker = list(color = 'darkblue')) %>%  
  layout(title = "Number of Cholera Deaths Reported by Country (Since 1949)",
         xaxis = list(title = "Country/Region"),
         yaxis = list(title = "Total Reported Cholera Deaths"),
         plot_bgcolor = 'white') 
# Display the plot
cholera_deaths_bar_plot

# 2. Rplot2: Top 5 Countries with the Highest Cholera deaths
# Convert 'Number.of.reported.deaths.from.cholera' to numeric and filter non-numeric values
Top5_highest_deaths <- cholera_deaths %>%
  mutate(Number.of.reported.deaths.from.cholera = as.numeric(Number.of.reported.deaths.from.cholera))
Top5_highest_deaths <- Top5_highest_deaths %>%
  filter(!is.na(Number.of.reported.deaths.from.cholera))

# Group by countries and calculate the total reported deaths, then arrange by descending order
Top5_cholera_deaths <- Top5_highest_deaths %>%
  group_by(Countries) %>%
  summarise(Top5_deaths = sum(Number.of.reported.deaths.from.cholera, na.rm = TRUE)) %>%
  arrange(desc(Top5_deaths)) %>%
  slice_head(n = 5)  

# Visualization
# Create an interactive bar plot showing the top 5 countries with the highest cholera deaths
Top5_deaths_bar_plot <- plot_ly(Top5_cholera_deaths, 
                               x = ~Countries, 
                               y = ~Top5_deaths, 
                               type = 'bar',
                               marker = list(color = 'darkred')) %>%
  layout(title = "Top 5 Countries with the Highest Reported Cholera Deaths (Since 1949)",
         xaxis = list(title = "Country/Region"),
         yaxis = list(title = "Total Reported Cholera Deaths"),
         plot_bgcolor = 'white')  
Top5_deaths_bar_plot

# Rplot3: Top 50 Countries with the Lowest Reported cholera deaths
# Convert 'Number.of.reported.deaths.from.cholera' to numeric and filter non-numeric values
Lowest50_deaths <- cholera_deaths %>%
  mutate(Number.of.reported.deaths.from.cholera = as.numeric(Number.of.reported.deaths.from.cholera))

# Remove rows where 'Number.of.reported.deaths.from.cholera' is NA
Lowest50_deaths <- Lowest50_deaths %>%
  filter(!is.na(Number.of.reported.deaths.from.cholera))

# Group by countries and calculate the total reported deaths, then arrange by ascending order (for lowest)
Lowest50_cholera_deaths <- Lowest50_deaths %>%
  group_by(Countries) %>%
  summarise(Lowest50_deaths = sum(Number.of.reported.deaths.from.cholera, na.rm = TRUE)) %>%
  arrange(Lowest50_deaths) %>%
  slice_head(n = 50)  # Limit the result to the top 50 countries with the lowest reported deaths

# Visualization
# Create an interactive bar plot showing the top 50 countries with the lowest reported cholera deaths
Lowest50_deaths_bar_plot <- plot_ly(Lowest50_cholera_deaths, 
                                   x = ~Countries, 
                                   y = ~Lowest50_deaths, 
                                   type = 'bar',
                                   marker = list(color = 'purple')) %>%  
  layout(title = "Top 50 Countries with the Lowest Reported Cholera deaths (Since 1949)",
         xaxis = list(title = "Country/Region"),
         yaxis = list(title = "Total Reported Cholera deaths"),
         plot_bgcolor = 'white')  
Lowest50_deaths_bar_plot

# Rplot4: Trends in Cholera deaths Over Time
deaths_over_time <- cholera_deaths %>%
  mutate(Year = as.numeric(Year),
         Number.of.reported.deaths.from.cholera = as.numeric(Number.of.reported.deaths.from.cholera)) %>%
  filter(!is.na(Number.of.reported.deaths.from.cholera))

# Summarize deaths by year
cholera_deaths_trend <- deaths_over_time %>%
  group_by(Year) %>%
  summarise(total_deaths = sum(Number.of.reported.deaths.from.cholera, na.rm = TRUE)) %>%
  arrange(Year)

# Visualization
# Create a line plot for trends in cholera deaths over time
cholera_deaths_trend_plot <- plot_ly(cholera_deaths_trend, 
                                    x = ~Year, 
                                    y = ~total_deaths, 
                                    type = 'scatter', 
                                    mode = 'lines+markers',
                                    marker = list(color = 'brown')) %>%  
  layout(title = "Trends in Reported Cholera Deaths Over Time",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Total Reported Deaths"),
         plot_bgcolor = 'lightgray')  
cholera_deaths_trend_plot

# Rplot5: Highest Annual Cholera deaths for a Specific Country (e.g., "Nigeria")
# Filter the data for the specific country
cholera_country_specific <- cholera_country_specific %>%
  mutate(Number.of.reported.deaths.from.cholera = as.numeric(Number.of.reported.deaths.from.cholera))

# Filter out NA values caused by conversion issues
cholera_country_specific <- cholera_country_specific %>%
  filter(!is.na(Number.of.reported.deaths.from.cholera))

# Summarise by year for that country
annual_deaths_country <- cholera_country_specific %>%
  group_by(Year) %>%
  summarise(total_deaths = sum(Number.of.reported.deaths.from.cholera, na.rm = TRUE)) %>%
  arrange(desc(total_deaths))  # Sort by year for highest annual deaths

# Visualization: Plot the annual cholera deaths for the country
annual_deaths_plot <- plot_ly(annual_deaths_country, 
                              x = ~Year, 
                              y = ~total_deaths, 
                              type = 'scatter', 
                              mode = 'lines+markers',
                              marker = list(color = 'blue')) %>%  
  layout(title = "Annual Cholera Deaths for Nigeria",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Total Reported Deaths"),
         plot_bgcolor = 'white')

# Display the plot
annual_deaths_plot


