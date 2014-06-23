# server.R

# global values that need to be computed only once
data(mtcars)
mtcars2 <- mtcars
# Create a second dataframe mtcars2 where all the columns containing discrete values - cylinders, am (transmission, gears and carborettors are all converted correctly to factor variables. )
for (i in c("cyl","am", "gear","carb", "vs")) { mtcars2[[i]] <- as.factor(mtcars[[i]])}
meanMPG <- mean(mtcars2$mpg)

model <- function() {
  lm(mpg ~ am + cyl + wt, mtcars2)
}
fit <- model()


# create a test datset to be used for prediction. The default values for all non-factor predictors 
# is the mean of the data
testData <- data.frame(cyl=factor(4,levels=c(4,6,8)),
                       disp=mean(mtcars2$disp),
                       hp=mean(mtcars2$hp),
                       drat=mean(mtcars2$drat),
                       wt=mean(mtcars2$wt),
                       qsec=mean(mtcars2$qsec),
                       vs=factor(0,levels=c(0,1)),
                       am=factor(0,levels=c(0,1)),
                       gear=factor(4,levels=c(3,4,5)),
                       carb=factor(4,levels=c(1:8)))

shinyServer(function(input, output) {
  estimate <- function(am, cyl, wt) {
    #update testData with new input values
    testData$am <- as.factor(am);
    testData$cyl <- as.factor(cyl); 
    testData$wt <- wt;
    round(predict(fit,testData),2)
  
  }
  # Reactive output
  output$mpgout <- renderText({ 
    paste(estimate(input$transmission,input$cylinders, input$weight))
  })
  
  output$residuals <- renderPlot({
    #scater plot of standardized residuals vs filled values
    plot(fit$fitted,rstandard(fit), xlab="Fitted Values", ylab="Standardized Residuals", main="Residual Plot")
    #horizontal line through 0
    abline(h=0)
    # make the prediction in response to the input values and compute the standardized residual
    pv <- estimate(input$transmission,input$cylinders, input$weight)
    srv <- (pv-meanMPG)/sd(resid(fit))
    # plot the new information as points and line from the zero line
    points(pv,srv,col="red",pch=19)
    segments(pv,0,pv,srv,col="red",lwd=3)
  })
  
}
)

