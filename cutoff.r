install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

#create data frame
#the 2015 data was removed from grades column as it was an OUTLIER
years <- seq(from = 2016, to = 2022, by = 1)
grades <- c(78.3, 79.4, 80.2, 81.72, 83.53, 82.93,83)

df <- data.frame(years, grades)

#initial plot before optimization
plot <- ggplot(data = df, aes(x = years, y = grades)) +
geom_point() +
stat_smooth(method = "lm", col = "dodgerblue3") +
theme(panel.background = element_rect(fill = "gray"),
axis.line.x=element_line(),
axis.line.y=element_line()) +
ggtitle("Linear Model Fitted to Data")


print("start")

#continously rounding the averages to find the best fit
decrease_err <- function(p) {
    #contiously change the data
    models <- lm(grades ~ years, data=df)

    res <- summary(models)$residuals
    dist <- which(abs(res)>0.5)

    for (i in dist) {
        grades[i] <- grades[i]+p
    }

    df2 <- data.frame(years, grades)
    model3 <- lm(grades ~ years, data=df2)
    return(model3)
}

# print(sqrt(diag(vcov(decrease_err(-0.51)))))

#finding the model with the minimum error
find_min <- function() {
    vec <- seq(-1, 1, by = 0.01)
    res <- c()
    for (v in vec) {
        res <- c(res, sqrt(diag(vcov(decrease_err(v))))[1]+sqrt(diag(vcov(decrease_err(v))))[2])
    }

    return(vec[which.min(res)])
}

#update grades
for (i in 1:length(grades)) {
    grades[i] <- grades[i]+find_min()
}

#prediction
predicted_year <- 2023

df_f <- data.frame(years, grades)
model <- lm(grades ~ years, data=df_f)
pred <- predict(model, data.frame(years=predicted_year))


#final plot
plot_f <- ggplot(data = df_f, aes(x = years, y = grades)) +
geom_point() +
stat_smooth(method = "lm", col = "dodgerblue3") +
theme(panel.background = element_rect(fill = "gray"),
axis.line.x=element_line(),
axis.line.y=element_line()) +
ggtitle("Linear Model Fitted to Data")

result <- paste("Cutoff for year 2023: ", as.character(pred), sep = "")
print(result)
print(plot(fitted(model), resid(model)))
abline(0,0)
print(plot_f)







