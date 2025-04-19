
# 🧠 7135CEM: Modelling and Optimization Under Uncertainty

This repository contains two major projects exploring predictive modeling and fuzzy control systems, including:

1. **🩺 Task 1 – Diabetes Prediction with Machine Learning**  
   Comparative evaluation of five classifiers on health data to predict diabetes risk, emphasizing accuracy and computational efficiency.

2. **🏡 Task 2 – Fuzzy Logic Controller & Optimization Algorithms**  
   A fuzzy logic system for assisted living environments and benchmarking of three optimization techniques on CEC’2005 functions.

---

## 📁 Repository Structure

| File | Description |
|------|-------------|
| `diabetes_prediction.ipynb` | Task 1: ML-based diabetes prediction with GPC, SVM, RF, LR, GBC |
| `flc_controller_design.fis` | Task 2: Fuzzy logic controller MATLAB file |
| `optimization_algorithms.ipynb` | Task 2: GA, PSO, SA on benchmark functions |
| `7135 - Modelling Report Full.docx` | Full report with background, methods, results, and insights |

---

## 🩺 Task 1: Diabetes Prediction Using Machine Learning

### 🎯 Objective
Evaluate and compare machine learning models for diabetes prediction using the CDC Diabetes dataset.

### 🔍 Models Evaluated
- Gaussian Process Classifier (GPC)
- Logistic Regression (LR)
- Random Forest (RF)
- Support Vector Machine (SVM)
- Gradient Boosting Classifier (GBC)

### 🛠️ Preprocessing Steps
- Dataset balancing (undersampling)
- PCA for dimensionality reduction
- Data standardization (StandardScaler)
- Hyperparameter tuning: GridSearchCV and Bayesian Optimization

### 📈 Results Summary

| Model | Accuracy | F1 Score | AUC-ROC | Time (s) |
|-------|----------|----------|---------|----------|
| GPC   | 0.73     | 0.74     | 0.789   | 99.58    |
| LR    | 0.73     | 0.738    | 0.807   | **0.078** |
| RF    | 0.72     | 0.735    | 0.794   | 29.17    |
| SVM   | **0.74** | **0.751**| 0.804   | 800.52   |
| GBC   | 0.736    | 0.747    | **0.812** | 43.38  |

> **Insight:** Logistic Regression offers the best trade-off between performance and speed. Gradient Boosting gives top predictive power.

---

## 🧠 Task 2.1: Fuzzy Logic Controller for Assisted Living

### 🧩 System Features
- **Environment Control:** Room temperature, lighting, ventilation
- **Safety Measures:** CO₂ levels, health alarms
- **Accessibility:** Doors, ramps, voice commands
- **Mood-based Controls:** Lighting and audio

### ⚙️ Inputs & Outputs
- 10 fuzzy input variables (e.g., temperature, heart rate, mood)
- 9 output control actions (e.g., window state, alarms, lighting)
- Mamdani-type inference system
- Centroid defuzzification

### 📊 Highlights
- 47 fuzzy rules with varying priorities and weights
- Membership functions: Triangular, Trapezoidal, Gaussian
- MATLAB `.fis` file for simulation and deployment

---

## 📉 Task 2.2: Optimization Algorithms on CEC’2005 Benchmarks

### 🧪 Algorithms Compared
- Genetic Algorithm (GA)
- Particle Swarm Optimization (PSO)
- Simulated Annealing (SA)

### 🧭 Functions Tested (D=2 and D=10)
- Shifted Sphere Function
- Shifted Rosenbrock Function
- Rotated Hybrid Composition Function

### 🚀 Results Summary

| Function | Dim | Best Algo | Notes |
|----------|-----|-----------|-------|
| Sphere   | 2   | GA / PSO  | Near-zero error |
| Rosenbrock | 2 | GA        | SA performed worst |
| Hybrid   | 10  | GA        | Stable; SA had highest variance |

> **Conclusion:** GA shows consistent and stable performance. PSO excels on simpler functions. SA struggles with complexity and scale.

---

## ✨ Key Takeaways

- **ML Models:** GBC and LR are most promising for real-world diabetes screening.
- **FLC:** Demonstrates how fuzzy logic can power safe, adaptive environments.
- **Optimization:** GA is the most reliable across varied problem types.

---

## 🧑‍💻 Author

**Itorobong Akpan**  
MSc Data Science & Computational Intelligence  
Coventry University, UK  
📧 akpani4@uni.coventry.ac.uk  
🔗 [GitHub Profile](https://github.com/akpanitorobong)

---

