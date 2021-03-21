## Libraries ---------------------

library(quantmod)
library(ggplot2)
library(tidyquant)


## Data + Cleaning ---------------

loadSymbols(c("AMZN","GOOG","BABA", "GME"))

GME <- as.data.frame(GME)
GME$dates <- row.names(GME)
head(GME)

plot(GME$GME.Adjusted, type = "l")

GMEindex <- c(3500:3578)


## Visualizations --------------

# GameStop Candlesticks
ggplot(GME[GMEindex,], aes(x=dates)) +
  geom_candlestick(aes(middle=,
                   close=GME.Close, 
                   open=GME.Open,
                   high=GME.High,
                   low=GME.Low)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(title = "GameStop Candlesticks / Boxplots", 
       x = "Date",
       y = "Stock Price in USD",
       color = "Trade Volume",
       size = "Trade Volume")

# GameStop Line Graph + Colors
ggplot(GME[GMEindex,], aes(x=dates, y=GME.Adjusted)) +
  geom_line(aes(group=1, color=GME.Volume)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=10)) +
  geom_point(aes(color=GME.Volume, size=GME.Volume)) +
  labs(title = "GameStop Stock Prices and Trade Volume", 
       x = "Date",
       y = "Stock Price in USD",
       color = "Trade Volume",
       size = "Trade Volume")

# GameStop Bar Graph + Colors
ggplot(GME[GMEindex,], aes(x=dates, y=GME.Adjusted)) +
  geom_col(aes(fill=GME.Volume)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=10)) +
  labs(title = "GameStop Stock Prices and Trade Volume", 
       x = "Date",
       y = "Stock Price in USD",
       fill = "Trade Volume",
       size = "Trade Volume")


## Examples ----------------

# Hotdogs Base R
hotdogs <- read.csv("http://datasets.flowingdata.com/hot-dog-contest-winners.csv")
head(hotdogs)
colors <- ifelse(hotdogs$New.record == 1, "darkred", "grey")
barplot(hotdogs$Dogs.eaten, names.arg = hotdogs$Year, col=colors, border=NA,
        main = "Nathan's Hot Dog Eating Contest Results, 1980-2010",  xlab="Year", ylab="Hot dogs and buns (HDBs) eaten")

# Hotdogs ggplot
ggplot(hotdogs) +
  geom_bar(aes(x=Year, y=Dogs.eaten, fill=factor(New.record)), stat="identity") +
  labs(title="Nathan's Hot Dog Eating Contest Results, 1980-2010", fill="New Record") +
  xlab("Year") +
  ylab("Hot dogs and buns (HDBs) eaten")

# Econ Base R
head(economics)
year <- function(x) as.POSIXlt(x)$year + 1900
economics$year <- year(economics$date) # we setting up our analysis
head(economics)
plot1 <- qplot(date, unemploy / pop, data = economics, geom = "line")
plot1





