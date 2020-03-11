#' ---
#' title: "Class 5: Data visualization and graphs in R"
#' author: "KV"
#' date: "January 21st, 2020"
#' ---

# Class 5
# Data visualization and graphs in R

# just typing plot into the script rather than
# the console, hence no plot appeared
plot(1:10, col = "blue", typ = "o")

# need to import/read input data file first
# file has "header" line that tells you name of 
# columns
baby_weights <- read.table("bimm143_05_rstats/weight_chart.txt")

# baby_weights does not automatically give header names
# need to add in arguments
baby_weights <- read.table("bimm143_05_rstats/weight_chart.txt", header = TRUE)

# basic plot of weight vs. plot
plot(baby_weights$Age, baby_weights$Weight)
# change scatterplot + line plot
plot(baby_weights$Age, baby_weights$Weight, type = 'o')
# change point character to be a filled square
plot(baby_weights$Age, baby_weights$Weight, type = 'o', pch = 15)
# arguments to change y-axis limits 2-10kg
plot(baby_weights$Age, baby_weights$Weight, 
     type = 'o', pch = 15,
     ylim = c(2,10),
     xlab = "Age (months)", ylab = "Weight (kg)",
     main = "Baby weights")

# next example mouse genome features
# gives error "line 3 did not have 3 elements"
# mouse <- read.table("bimm143_05_rstats/feature_counts.txt")
# error means that line 3 of the text file is separated by 
# a tab rather than space, giving it only 2 elements
mouse <- read.table("bimm143_05_rstats/feature_counts.txt",
                    sep = "\t", header = TRUE)

# which column contains the data i want to plot?
# barplot(height...)
barplot(mouse$Count)

barplot(mouse$Count, horiz = TRUE, col = "lightblue",
        names.arg = mouse$Feature, las = 2,
        main = "Mouse genome count")

# should put plot after your par()
par(mar = c(5, 11, 0, 1))
barplot(mouse$Count, horiz = TRUE, col = "lightblue",
        names.arg = mouse$Feature, las = 2,
        main = "Mouse genome count")

# SECTION 3: Using color
genders <- read.delim("bimm143_05_rstats/male_female_counts.txt")
barplot(genders$Count, names.arg = genders$Sample, col = rainbow(nrow(genders)))

# another plot of the same thing w/ diff colors
barplot(genders$Count, names.arg = genders$Sample, col = c("red", "blue"))
