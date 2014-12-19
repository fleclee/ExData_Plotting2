library(ggplot2)

## Data files have been downloaded.
## Load the NEI & SCC data frames.
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## 
plot6sources <- SCC[grepl("On-Road", SCC$EI.Sector),]
plot6sources <- plot6sources$SCC
plot6 <- NEI[NEI$SCC %in% plot6sources,]
plot6 <- NEI[NEI$fips %in% c("24510", "06037"),]

## Aggregate data by Year
plot6 <- aggregate(Emissions ~ year + fips, data=plot6, sum)

## Rename “fips” to city
names(plot6)[[2]] <- "City"

## Rename city labels for more descriptive plotting
plot6$City <- factor(plot6$City, levels=c("06037", "24510"), 
                     labels=c("Los Angeles, CA", "Baltimore, MD"))

## Calculate change from Year to Year as difference between the two Years. 
## Add the number to a new column.
plot6[2:8,"Change"] <- diff(plot6$Emissions/1000)

## Do not have 1998 data so initialize difference to 0 for each city.
plot6[c(1,5),4] <- 0

ggplot(data=plot6, 
       aes(x=year, y=Change, group=City, color=City)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Change in Emissions (thousands of tons)") + ggtitle("Motor Vehicle PM2.5 Emissions Changes: Baltimore vs. LA")
ggsave(file="plot6.png")
