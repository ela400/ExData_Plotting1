# Exploratory Data Analysis - Project 1
# Plot 1

# Load the file
data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ';', 
                 na = "?"
                 )

# Convert the date
data$Date <- as.Date(data$Date, 
                     format = "%d/%m/%Y"
                     )

# Subset for 2/1/07 and 2/2/07
data <- subset(data, 
               Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
               )

# Create POSIX dates
data$Date_time <- as.POSIXct(paste(as.Date(data$Date), data$Time))

# Plot 1 - Histogram
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "Red")

# Save to file
dev.copy(png, 
         file = "plot1.png", 
         height = 480, 
         width = 480)

dev.off()