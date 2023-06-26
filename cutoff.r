install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

#create data frame
years <- seq(from = 2016, to = 2022, by = 1)
grades <- c(78.3, 79.4, 80.2, 81.72, 83.53, 82.93,83)

df <- data.frame(years, grades)

plot <- ggplot(data = df, aes(x = years, y = grades)) +
geom_point() +
stat_smooth(method = "lm", col = "dodgerblue3") +
theme(panel.background = element_rect(fill = "gray"),
axis.line.x=element_line(),
axis.line.y=element_line()) +
ggtitle("Linear Model Fitted to Data")

y_inter <- model$coefficients[1]
slope <- model$coefficients[2]

average_err <- summary(model)$sigma
avg_err <- avg_err / length(m)

std_err <- sqrt(diag(vcov(model)))

#change the y-intercept/slope until the avg error goes down.

print("start")
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

find_max <- function() {
    vec <- seq(-1, 1, by = 0.01)
    res <- c()
    for (v in vec) {
        res <- c(res, sqrt(diag(vcov(decrease_err(v))))[1]+sqrt(diag(vcov(decrease_err(v))))[2])
    }

    return(vec[which.min(res)])
}

for (i in 1:length(grades)) {
    grades[i] <- grades[i]+find_max()
}

df_f <- data.frame(years, grades)
model <- lm(grades ~ years, data=df_f)
pred <- predict(model, data.frame(years=2024))

plot_f <- ggplot(data = df_f, aes(x = years, y = grades)) +
geom_point() +
stat_smooth(method = "lm", col = "dodgerblue3") +
theme(panel.background = element_rect(fill = "gray"),
axis.line.x=element_line(),
axis.line.y=element_line()) +
ggtitle("Linear Model Fitted to Data")

result <- paste("Cutoff for year: ", as.character(pred), sep = "")
print(result)
print(plot(fitted(model), resid(model)))
abline(0,0)
print(plot_f)








