# Exploratory Data Analysis - Project 1
# Plot 4 

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

# Plot 4 - Plot
par(mfrow = c(2,2), 
    mar = c(4,4,2,1), 
    oma = c(0,0,2,0)
    )

with(data, 
     {plot(Global_active_power ~ Date_time, 
           type = "l", 
           xlab = "", 
           ylab = "Global Active Power"
           )
      plot(Voltage ~ Date_time, 
           type = "l", 
           xlab = "datetime", 
           ylab = "Voltage"
           )
      plot(Sub_metering_1 ~ Date_time, 
           type = "l", 
           xlab = "", 
           ylab = "Energy sub metering"
           )
        lines(Sub_metering_2 ~ Date_time,
              col = 'Red'
              )
        lines(Sub_metering_3 ~ Date_time,
              col = 'Blue'
              )
        legend("topright", 
               col = c("black", "red", "blue"), 
               lty = 1, 
               lwd = 2, 
               bty = "n",
               cex = 0.5,
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
               )
      plot(Global_reactive_power ~ Date_time, 
           type = "l", 
           xlab = "datetime", 
           ylab = "Global_reactive_power"
           )
      }
     )

# Save to file
dev.copy(png, 
         file="plot4.png", 
         height=480, 
         width=480
         )

dev.off()