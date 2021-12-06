library(quantmod)
tics <- c("TSLA")
download_tic <- function(x) get(getSymbols(x, from = '2018-01-01', to = '2021-09-01' ))[,6]
p_list <- lapply(tics, download_tic)
AdjustedClosePrice <- Reduce(merge,p_list)
AdjustedClosePrice
colnames(AdjustedClosePrice) <- c("TESLA")
AdjustedClosePrice
dailylogreturn <- na.omit(log(AdjustedClosePrice/lag(AdjustedClosePrice)))
dailylogreturn
colnames(dailylogreturn) <- c("TESLA")
dailylogreturn
head(dailylogreturn)
tail(dailylogreturn)
Annualmeanreturn <- mean(dailylogreturn$TESLA)*252
Annualmeanreturn
AnnualVolreturn <- sd(dailylogreturn$TESLA)*sqrt(252)
AnnualVolreturn
SR <- Annualmeanreturn/AnnualVolreturn
SR
Tbill<- getSymbols("^IRX", from= "2018-01-01", to= "2021-09-01", auto.assign = F)
Tbill<- na.omit(Tbill)
Tbill<-Tbill[,6]
Tbill
tail(Tbill)
Tbillreturn<- na.omit(log(Tbill$IRX.Adjusted/lag(Tbill$IRX.Adjusted)))
head(Tbillreturn)
Tbillannualmeanreturn<- mean(Tbillreturn$IRX.Adjusted)*252
Tbillannualmeanreturn
Tbillvolreturn<- sd(Tbillreturn$IRX.Adjusted)*sqrt(252)
Tbillvolreturn
sharpeTbill<- Tbillannualmeanreturn/Tbillvolreturn
sharpeTbill
qqnorm(dailylogreturn$TESLA)
qqline(dailylogreturn$TESLA)
