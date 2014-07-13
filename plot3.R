# Exploratory Data Analysis - Project 1
# Plot 3

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

# Plot 3 - Plot
with(data, 
        {plot(Sub_metering_1 ~ Date_time, 
              type = "l", 
              xlab = "",
              ylab = "Energy sub metering")
         lines(Sub_metering_2 ~ Date_time, 
               col = "red")
         lines(Sub_metering_3 ~ Date_time, 
               col = "blue")
         }
     )

legend("topright", 
       col = c("black", "red", "blue"), 
       lty = 1, 
       lwd = 2, 
       cex = 0.6,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )

# Save to file
dev.copy(png, 
         file = "plot3.png", 
         height = 480, 
         width = 480
         )

dev.off()