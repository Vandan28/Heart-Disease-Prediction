# Load the data
heart_data <- read.csv("heart.csv")

# Check the structure of the data
str(heart_data)

# Summary of the data
summary(heart_data)

library(caTools) # For data splitting

# Set seed for reproducibility
set.seed(123)

# Split data into training (70%) and testing (30%) sets
split <- sample.split(heart_data$target, SplitRatio = 0.7)
train_data <- subset(heart_data, split == TRUE)
test_data <- subset(heart_data, split == FALSE)

# Build the logistic regression model
model <- glm(target ~ ., data = train_data, family = "binomial")

# Predict using the model
predictions <- predict(model, newdata = test_data, type = "response")

# Convert predicted probabilities to binary outcomes
predicted_classes <- ifelse(predictions > 0.5, 1, 0)

# Calculate accuracy
accuracy <- mean(predicted_classes == test_data$target)
accuracy
