library(ggplot2)

## Data files have been downloaded.
## Load the NEI & SCC data frames.
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Subset data where Short.Name—which indicates emissions source—contains "Coal"
plot4sources <- SCC[grepl("Coal", SCC$EI.Sector),]
plot4sources <- plot4sources$SCC
plot4 <- NEI[NEI$SCC %in% plot4sources,]

## Aggregate data by Year
plot4 <- aggregate(Emissions ~ year, data=plot4, sum)

ggplot(data=plot4, 
       aes(x=year, y=Emissions/1000)) + geom_line() + geom_point(size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (thousands of tons)") + ggtitle("Total United States PM2.5 Coal Emissions")
ggsave(file="plot4.png")