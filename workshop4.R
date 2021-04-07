X <- read.csv('C:\\Users\\Ashutosh\\OneDrive - University of California, Davis\\github-tutorial\\data.csv')
names(X)

# logistic regression model

glm.fit <- glm(Churn ~ gender + SeniorCitizen + Partner + Dependents + tenure + PhoneService + 
                       MultipleLines + InternetService + OnlineSecurity + OnlineBackup + DeviceProtection + 
                       TechSupport + StreamingTV + StreamingMovies + Contract + PaperlessBilling + MonthlyCharges + 
                       streamingInteraction + PaymentMethod_1 + PaymentMethod_2 + PaymentMethod_3, data = X, family = binomial)

summary(glm.fit)

# first need to install package on xgboost install.packages("xgboost")

# load the xgboost library
require(xgboost)
Y = X$Churn
drop(X$Churn)
bstSparse <- xgboost(data = data.matrix(X), label = Y, max.depth = 2, eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic")


data = readRDS('C:\\Users\\Ashutosh\\OneDrive - University of California, Davis\\HMM\\hmm_example.RDS')

write.csv(data,"C:\\Users\\Ashutosh\\OneDrive - University of California, Davis\\HMM\\hmm_example.csv", row.names = FALSE)