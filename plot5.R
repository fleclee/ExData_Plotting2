library(ggplot2)

## Data files have been downloaded.
## Load the NEI & SCC data frames.
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Subset data for Baltimore and emissions that occurred on the road
plot5sources <- SCC[grepl("On-Road", SCC$EI.Sector),]
plot5sources <- plot5sources$SCC
plot5 <- NEI[NEI$SCC %in% plot5sources,]
plot5 <- NEI[NEI$fips == "24510",]

## Aggregate data by Year
plot5 <- aggregate(Emissions ~ year, data=plot5, sum)

ggplot(data=plot5, aes(x=year, y=Emissions)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (tons)") + ggtitle("Motor Vehicle PM2.5 Emissions in Baltimore")
ggsave(file="plot5.png")
