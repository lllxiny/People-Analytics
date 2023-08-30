This code analyzes employee engagement data by identifying factors through EFA and building a regression model to predict engagement based on various predictors.

1. **Data Setup and Exploration:**
   - Loads a dataset named "hr.xlsx" using the `read.xlsx()` function.
   - Assigns the dataset to `Survey` and displays column names using `names()`.

2. **Factor Analysis:**
   - Selects engagement-related variables ("Eng1" to "Eng7") and handles missing data.
   - Calculates eigenvalues from the correlation matrix for factor analysis.
   - Conducts parallel analysis (PA) to determine the optimal number of factors.
   - Performs EFA with two factors using `principal()` and stores loadings in `Loadings2f`.

3. **Regression Analysis:**
   - Extracts factor scores (index1 and index2) from `Loadings2f`.
   - Creates a regression model predicting engagement from predictor variables.
   - Displays regression model summary using `summary()`.
  
Image Source: https://www.researchgate.net/figure/Communication-network-diagram-between-construction-units-concerned_fig2_261094786
