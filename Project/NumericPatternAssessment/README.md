# Numeric Pattern Dataset - Machine Learning Project

## Project Summary

This project implements a complete machine learning pipeline on a purely numerical
dataset, covering data preprocessing, exploratory data analysis, feature engineering,
feature selection, supervised learning, unsupervised learning, model evaluation, and
result interpretation - all inside a single Jupyter notebook.

The dataset itself is synthetically generated (12 numeric features + 1 continuous
target, 10,000 rows), then taken through the full pipeline: cleaning, scaling,
selection, multiple regression and classification algorithms, and multiple clustering
algorithms, finishing with a side-by-side model comparison.

## Tech Stack

- **Python 3**
- **pandas, numpy** - data loading and manipulation
- **matplotlib, seaborn** - visualizations (distribution plots, boxplots, heatmaps,
  dendrograms, decision boundaries)
- **scikit-learn** - preprocessing, all regression/classification models, K-Means,
  Agglomerative Clustering, DBSCAN, Gaussian Mixture Models, PCA, GridSearchCV, and
  all evaluation metrics
- **scipy** - hierarchical clustering linkage and dendrogram computation
- **faker** - synthetic dataset generation (used only in `generate_dataset.py`)

## Installation

libraries installed :

```bash
pip install pandas
pip install numpy
pip install matplotlib
pip install seaborn
pip install scikit-learn
pip install scipy
pip install faker
```

## Project Structure

```
NumericPatternAssessment/
├── Data/
│   ├── generate_dataset.py     # generates the dataset
│   └── numeric_pattern.csv     # 12 features + 1 target, 10,000 rows
├── notebook/
│   └── assessment.ipynb        # full pipeline, start to finish
└── README.md
```

## Dataset

Generate the dataset once before running the notebook:

```bash
cd Data
python generate_dataset.py
```

## What's Covered

### Data Preprocessing
- Dataset loading, structure checks, statistical summary, missing value analysis
- EDA: distribution plots, boxplots, pairplot, correlation heatmap
- Data cleaning: missing value imputation, duplicate removal, IQR-based outlier
  detection and treatment
- Feature scaling: StandardScaler vs MinMaxScaler comparison
- Feature selection: correlation analysis, variance threshold

### Supervised Learning
Implemented and evaluated together across regression and classification:
- **Regression:** Linear Regression, Decision Tree Regressor, Random Forest Regressor
  - Evaluated with MAE, RMSE, R2 Score
  - Visualized with Actual vs Predicted plots, residual plots, feature importance
- **Classification:** Logistic Regression, Decision Tree Classifier, Random Forest
  Classifier, SVM, KNN, Gradient Boosting, AdaBoost, Extra Trees, HistGradientBoosting
  - Hyperparameter tuning via GridSearchCV (SVM, KNN, Gradient Boosting)
  - 5-Fold Cross Validation and learning curves (AdaBoost, Extra Trees,
    HistGradientBoosting)
  - Evaluated with Accuracy, Precision, Recall, F1 Score, ROC-AUC
  - Visualized with confusion matrices, ROC curves, decision boundaries (2D PCA
    projection), feature importance

### Unsupervised Learning
Implemented and evaluated together across all clustering approaches:
- **K-Means** - elbow method, silhouette score, cluster visualization, PCA cluster
  projection
- **Hierarchical (Agglomerative) Clustering** - dendrogram, linkage method comparison
  (ward, complete, average), cluster visualization
- **DBSCAN** - parameter tuning (k-distance plot, eps/min_samples grid), cluster
  visualization, noise point analysis
- **Gaussian Mixture Model (GMM)** - soft clustering, cluster probability estimation

### Model Comparison
A final comparison table brings every regression and classification model together
side by side, along with training time, to support a deployment recommendation.


