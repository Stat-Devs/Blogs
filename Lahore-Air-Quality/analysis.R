library(readr)
library(ggplot2)
library(tidyverse)

OMNO2_Timeseries_Lahore <- read_csv("OMNO2_Timeseries_Lahore1.csv")
View(OMNO2_Timeseries_Lahore)

median <- OMNO2_Timeseries_Lahore$Median

print(typeof(median))

print(class(OMNO2_Timeseries_Lahore$`Date(yyyy-mm-dd)`))

date <- as.Date(OMNO2_Timeseries_Lahore$`Date(yyyy-mm-dd)`,format = "%d/%m/%Y")

typeof(date)

median_data = data.frame(date,median)
median_data_2015 <- median_data[median_data$date >= "2015-01-01" & median_data$date <= "2015-12-31",]
median_data_2016 <- median_data[median_data$date >= "2016-01-01" & median_data$date <= "2016-12-31",]
median_data_2017 <- median_data[median_data$date >= "2017-01-01" & median_data$date <= "2017-12-31",]
median_data_2018 <- median_data[median_data$date >= "2018-01-01" & median_data$date <= "2018-12-31",]
median_data_2019 <- median_data[median_data$date >= "2019-01-01" & median_data$date <= "2019-12-31",]
median_data_2020 <- median_data[median_data$date >= "2020-01-01" & median_data$date <= "2020-12-31",]
median_data_2021 <- median_data[median_data$date >= "2021-01-01" & median_data$date <= "2021-12-31",]
median_data_2012 <- median_data[median_data$date >= "2022-01-01" & median_data$date <= "2022-10-08",]
View(median_data_2015)
print(class(median_data))

View(median_data)



#is.na(median)
#j <- 0

#for (i in is.na(median)) {
#  if (i == TRUE){
#  j= j+1
#  }
#}
#print(j)

monthly_median <- median_data %>%
  group_by(date = lubridate::floor_date(date, "month")) %>%
  summarize(average = mean(median))

View(monthly_median)

monthly_median$year <- lubridate::year(monthly_median$date)
monthly_median$month <- lubridate::month(monthly_median$date)



ggplot(monthly_median) + 
  geom_line(mapping = aes(x = factor(month), y=average, color=factor(year), group=factor(year))) +
  xlab("Month") +
  ylab("Average NO2 Presence in Troposphere") +
  ylim(0,10)



