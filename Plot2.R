NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
aggdataBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("Plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  aggdataBaltimore$Emissions,
  names.arg=aggdataBaltimore$year,
  col="Red",
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.off()