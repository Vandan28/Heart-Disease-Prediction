# Load the necessary libraries
install.packages("ggcorrplot") # Install the package (only needed once)
install.packages("GGally") # Install the package (only needed once)

library(dplyr)
library(ggplot2)
library(ggcorrplot) # Load the package
library(GGally) # Load the package

# Load the heart dataset (replace 'heart.csv' with your file path)
heart_data <- read.csv("heart.csv")

# View the first few rows of the dataset
head(heart_data)
# Summary statistics
summary(heart_data)

# Histograms of numerical variables
heart_data %>%
select(age, trestbps, chol, thalach)%>%
ggpairs()

# Bar plot for 'sex'
library(ggplot2)

# Assuming "sex" is a factor variable in your heart_data dataset
ggplot(heart_data, aes(x = factor(sex), fill = factor(sex))) +
  geom_bar() +
  labs(title = "Distribution of Sex")


# Bar plot for 'target'
ggplot(heart_data, aes(x = factor(target))) +
  geom_bar() +
  labs(title = "Distribution of Target")

# Correlation matrix
cor_matrix <- cor(heart_data %>%
                    select(age, trestbps, chol, thalach, oldpeak, thal))

# Visualize the correlation matrix
ggcorrplot(cor_matrix, hc.order = TRUE, type = "lower", lab = TRUE)

# Boxplot of 'age' by 'target'
ggplot(heart_data, aes(x = factor(target), y = age)) +
  geom_boxplot() +
  labs(title = "Age Distribution by Target")

# Boxplot of 'thalach' by 'sex'
library(ggplot2)

# Assuming "sex" is a factor variable in your heart_data dataset
ggplot(heart_data, aes(x = factor(sex), y = thalach, fill = factor(sex))) +
  geom_boxplot() +
  labs(title = "Thalach Distribution by Sex")

# Assuming 'heart_data' is your dataset

# Create age groups or bins
heart_data$age_group <- cut(heart_data$age, breaks = c(20, 30, 40, 50, 60, 70, 80),
                            labels = c("20-29", "30-39", "40-49", "50-59", "60-69", "70-79"),
                            include.lowest = TRUE)

# Plotting a bar chart for count of records by age groups
ggplot(heart_data, aes(x = age_group, fill = age_group)) +
  geom_bar() +
  labs(title = "Count of Records by Age Group")



##############################################

# Create age groups or bins
heart_data$age_group <- cut(heart_data$age, breaks = c(20, 30, 40, 50, 60, 70, 80),
                            labels = c("20-29", "30-39", "40-49", "50-59", "60-69", "70-79"),
                            include.lowest = TRUE)

library(ggplot2)

# Assuming 'heart_data' is your dataset

# Filter data for 'Thalach' concerning heart disease presence
thalach_data <- heart_data %>% 
  select(thalach, target)

# Define a custom color palette
my_colors <- c("#FF5733", "#FFC300")

# Plotting histogram with custom colors for heart disease presence
ggplot(thalach_data, aes(x = thalach, fill = factor(target))) +
  geom_histogram(binwidth = 5, position = "identity", alpha = 0.7) +
  labs(title = "Distribution of Thalach by Heart Disease Presence",
       x = "Thalach (Maximum Heart Rate Achieved)",
       y = "Frequency") +
  scale_fill_manual(values = my_colors, 
                    name = "Heart Disease",
                    labels = c("No", "Yes")) +
  theme_minimal() +
  theme(legend.position = "top")



library(ggplot2)

ggplot(heart_data, aes(x = factor(cp), fill = factor(target))) +
  geom_bar(position = "dodge", color = "black") +
  labs(title = "Distribution of Chest Pain Type with Heart Disease",
       x = "Chest Pain Type", y = "Count") +
  scale_fill_discrete(name = "Heart Disease",
                      labels = c("No", "Yes"))

