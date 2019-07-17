#exercicio 6

arq1 <- read.csv("./data/trees.csv")
arq1
#sumário dos dados
summary(arq1)
#calculando a variância
apply(arq1, 2, var)
#calculando o desvio padrão
apply(arq1, 2, sd)

#fazer um histograma
hist(arq1$Girth)
hist(arq1$Height)
hist(arq1$Volume)


#fazer um boxplot
boxplot(arq1$Girth)
boxplot(arq1$Height)
boxplot(arq1$Volume)

#identificar
my_boxplot <- boxplot(arq1$Volume, plot=FALSE)
my_boxplot

## O valor extremo achado na variável volume é 77.

#fazer uma correlação par a par
cor(arq1)
