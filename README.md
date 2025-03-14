# 🩺 Heart Disease Prediction Using Machine Learning

## 📌 Overview
This project leverages **machine learning techniques** to predict **the risk of heart disease** based on patient health metrics. By utilizing a dataset containing **various medical and lifestyle attributes**, we implement **Logistic Regression, Random Forest, and Neural Networks** to classify individuals as at risk or not.

Our objective is to develop an **accurate and interpretable model** that can aid in early detection, enabling **preventive healthcare interventions**.

---

## 📊 Dataset
- **Source:** [Kaggle - Heart Disease Dataset](https://www.kaggle.com/datasets/johnsmith88/heart-disease-dataset)
- **Attributes Used (14 Features):**
  - Age, Sex, Chest Pain Type, Resting BP, Cholesterol, Fasting Blood Sugar, Resting ECG, Max Heart Rate, Exercise-Induced Angina, ST Depression, Slope, Number of Major Vessels, Thalassemia.
  - **Target Variable:** Presence (`1`) or Absence (`0`) of Heart Disease.

---

## 🔬 Exploratory Data Analysis (EDA)
We performed **data cleaning, normalization, and feature selection**, ensuring the dataset is well-prepared for machine learning models. Key insights include:
- **Age Group 50-60** has the highest heart disease cases.
- **Males are more prone to heart disease in early life (30-60), while females have higher risk later (40-75).**
- **High cholesterol and blood pressure** correlate with heart disease risk.
- **Maximum heart rate (thalach) tends to be lower in heart disease patients.**

📈 Various **visualizations (correlation matrix, histograms, box plots, and bar charts)** were used to understand feature relationships.

---

## 🏆 Machine Learning Models Implemented
| **Model**            | **Accuracy (%)** | **Observations** |
|----------------------|----------------|----------------|
| **Random Forest**    | 79%            | Moderate accuracy, identifies important features |
| **Logistic Regression** | 85%        | Good accuracy, interpretable results |
| **Neural Network**   | **94%**        | **Best performing model** |

🚀 **Neural Network achieved the highest accuracy (94%)**, making it the best choice for heart disease prediction.

---

## 📁 Project Structure
📂 Heart-Disease-Prediction
│── 📂 data/
│ ├── 📄 heart.csv # Dataset
│── 📂 models/
│ ├── 📄 Logistic_Regression_model.R # Logistic Regression Model
│ ├── 📄 Neural_Network_model.R # Neural Network Model
│ ├── 📄 RandomForest_Model.R # Random Forest Model
│── 📂 scripts/
│ ├── 📄 exploratory_data_analysis_1.R # EDA and data preprocessing
│── 📂 reports/
│ ├── 📄 Final_Project_Report.pdf # Detailed report
│ ├── 📄 Presentation.pptx # PowerPoint presentation
│── 📄 README.md # Project documentation
