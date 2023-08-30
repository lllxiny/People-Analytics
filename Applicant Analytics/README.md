Analyze applicant dataset with crosstab analysis to explore relationships between different variables in the dataset, particularly focusing on factors related to shortlisting and BAME status.

1. **Data Loading and Setup:**
   - The script starts by loading a dataset named "ApplicantPool_exercise_v2.csv" using the `read.table()` function.
   - It uses the `str()` function to display the structure of the loaded dataset and the `fix()` function to interactively view the data.
   - The column names of the dataset are displayed using the `names()` function.
   - The `attach()` function is used to make the dataset's variables accessible by their names.

2. **Categorizing Variables:**
   - The code converts the "Gender" variable into a factor with labels "Male" and "Female" using the `factor()` function.
   - Similar categorizations are performed for variables like "BAMEyn," "ShortlistedNY," "Interviewed," "FemaleONpanel," "OfferNY," "AcceptNY," and "JoinYN."
   - Frequency tables, proportion tables, and data frames with cumulative frequencies and proportions are generated for each categorization.

3. **Crosstab Analysis:**
   - A crosstab analysis is conducted for the combination of "BAME" (Black, Asian, and Minority Ethnic) status and "Shortlisted" status using the `table()` function.
   - Marginal proportions for BAME status and Shortlisted status are calculated using the `margin.table()` function.
   - A chi-squared test is performed on the crosstab results using the `chisq.test()` function.

