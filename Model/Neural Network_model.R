# Load the data
heart_data <- read.csv("heart.csv")

library(caTools) # For data splitting

# Set seed for reproducibility
set.seed(123)

# Split data into training (70%) and testing (30%) sets
split <- sample.split(heart_data$target, SplitRatio = 0.7)
train_data <- subset(heart_data, split == TRUE)
test_data <- subset(heart_data, split == FALSE)

# Normalize the data except for the target variable
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

train_data[, -14] <- apply(train_data[, -14], 2, normalize)
test_data[, -14] <- apply(test_data[, -14], 2, normalize)

library(neuralnet)

# Define the formula for the neural network
formula <- as.formula("target ~ age + sex + cp + trestbps + chol + fbs + restecg + thalach + exang + oldpeak + slope + ca + thal")

# Train the neural network model
nn_model <- neuralnet(formula,
                      data = train_data,
                      hidden = c(8, 4), # Number of hidden layers and neurons
                      linear.output = FALSE) # Non-linear output

# Summary of the trained model
summary(nn_model)

# Make predictions on test data
nn_predictions <- compute(nn_model, test_data[, -14])$net.result

# Convert predicted probabilities to binary outcomes (0 or 1)
predicted_classes <- ifelse(nn_predictions > 0.5, 1, 0)

# Compare predicted classes with actual target values
# Assuming 'predicted_classes' contains the predicted classes from your model and 'test_data' is your testing dataset
# Calculate accuracy
accuracy <- mean(predicted_classes == test_data$target)
cat("Accuracy for the Neural Network model: ", accuracy, "\n")


plot(nn_model)
plot(nn_model, rep = "best")
library(ROCR)

# Create a prediction object
pred <- prediction(nn_predictions, test_data$target)

# Create a performance object
perf <- performance(pred, "tpr", "fpr")

# Plot ROC curve
plot(perf, colorize = TRUE)


library(caret)

# Create the confusion matrix
conf_matrix <- confusionMatrix(factor(predicted_classes), factor(test_data$target))

# Print the confusion matrix
print(conf_matrix)

library(caret)

# Combine training and testing data for PCA
combined_data <- rbind(train_data[, -14], test_data[, -14])

# Apply PCA
pca_result <- prcomp(combined_data, scale. = TRUE)

# Plotting variance explained by each principal component
plot(pca_result, type = "l", main = "Variance Explained by Principal Components")

# Summary of PCA
summary(pca_result)

# Visualizing variance explained by each principal component
plot(cumsum(pca_result$sdev^2) / sum(pca_result$sdev^2), 
     xlab = "Number of Components", 
     ylab = "Variance Explained",
     main = "Cumulative Variance Explained by Principal Components")




