install.packages("randomForest")
# Load required libraries
library(randomForest)

# Read the CSV file
heart_data <- read.csv("/Users/riya/Downloads/BAR Project/heart.csv")

# Check the structure of the dataset
str(heart_data)

# Split the data into predictors (features) and target variable
predictors <- heart_data[, -ncol(heart_data)] # Excludes the last column (target)
target <- heart_data[, ncol(heart_data)] # Assumes the last column as the target

# Create and train the Random Forest model
set.seed(123) # For reproducibility
rf_model <- randomForest(predictors, target)

# Summary of the Random Forest model
print(rf_model)

# Predictions on the training data (not recommended for final evaluation)
predictions <- predict(rf_model, predictors)

# Assess model accuracy (recommended to do this on a separate test dataset)
accuracy <- mean(predictions == target)
print(paste("Accuracy:", accuracy))

#################################################################################

# Example of hyperparameter tuning
tuned_rf_model <- randomForest(predictors, target, ntree = 360, mtry = 7, nodesize = 7)

# Summary of the Random Forest model
print(tuned_rf_model)

# Predictions on the training data (not recommended for final evaluation)
predictions1 <- predict(tuned_rf_model, predictors)

# Assess model accuracy (recommended to do this on a separate test dataset)
accuracy <- mean(predictions1 == target)
print(paste("Accuracy for the Random Forest model:", accuracy))

# Calculate accuracy as a percentage
accuracy_percentage <- mean(predictions1 == target) * 100
print(paste("Accuracy:", round(accuracy_percentage, 2), "%"))


# Partial dependence plot for a specific variable (change 'var_name' to the variable you want to plot)
partialPlot(tuned_rf_model, heart_data, age)

print(tuned_rf_model) # Summary of the Random Forest model
varImpPlot(rf_model)

