library(readr)
library(ggplot2)

OMNO2_Timeseries_Lahore <- read_csv("OMNO2_Timeseries_Lahore1.csv")
View(OMNO2_Timeseries_Lahore)

median <- OMNO2_Timeseries_Lahore$Median

print(typeof(median))

print(class(OMNO2_Timeseries_Lahore$`Date(yyyy-mm-dd)`))

date <- as.Date(OMNO2_Timeseries_Lahore$`Date(yyyy-mm-dd)`,format = "%d/%m/%Y")

median_data = data.frame(date,median)

print(class(median_data))

View(median_data)
ggplot(median_data) + 
  geom_line(mapping = aes(x=date, y=median))

