
# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate by sum the total emissions by year
aggdata <- aggregate(Emissions ~ year,NEI, sum)

png("Plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(
  (aggdata$Emissions)/10^6,
  names.arg=aggdata$year,
  col = "Yellow",
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)

dev.off()