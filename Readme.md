# Estimating MPG APP


The EstimateMPG App is a simple app built using shiny with reactive output and plots to predict the MPG of a car.

###Prediction Model 
The dataset used is mtcars. Based on a project that was recently compelted for a Regression Modeling class, it was determined that the best model for predicting miles per gallon (MPG) of a car is to use a multiregression with dependency on the number of cylinders, type of transmission and the weight of the car.
So, the linear model is mpg ~ am + cyl + wt

In this application, a user interface has been built to take in user input values for the type of transmission, number of cylinders and the weight of the car. As the input is changed, the corresponding ouput (reactive) is displayed in the main panel on the right.

###Instructions to use the app
On the left side panel, select the values  as follows:

1. Select the number of cylinders form the pull-down menu
2. Choose either manual or automatic transmission
3. Slide the weight UI to set the approporiate weight of the car

### Output Changes
With each new change, the ouput changes automatically on the right main panel.
On the top, you will see the predicted MPG for the current input values.
Below that, is a plot of the standardized residuals vs. the fitted values (fit using the linear model described above). The new predicted point and its corresponding standardized residaul is dispalyed in red with a vertical line to the 0 line. If it were a simple SLR (simple linear regresson). we could just plot the fitted line. As this is a multiregression fit, we will only use the 0 line to show the new prediction.
