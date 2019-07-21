#exercicio 5 - aula 06

#ler o aquivo que já está no nosso diretório:
arvores <- read.csv("./data/trees.csv")
arvores

#sumário dos dados:
summary(arvores)

#calculando a variância:
apply(arvores, 2, var)

#calculando o desvio padrão:
apply(arvores, 2, sd)

#fazer um histograma para cada uma das variáveis:
hist(arvores$Girth, las=1, col="plum2", xlab = "Girth", ylab="Frequency", main="")
hist(arvores$Height, las=1, col="powderblue", xlab = "Height", ylab="Frequency", main="")
hist(arvores$Volume, las=1, col="darkseagreen1", xlab = "Volume", ylab="Frequency", main="")

#arquivos foram salvos na pasta resultados com o formato.png.

#fazer um boxplot para cada uma das variáveis:
boxplot(arvores$Girth, las=1, xlab = "Girth", ylab="Frequency", main="")
boxplot(arvores$Height, las=1, xlab = "Height", ylab="Frequency", main="")
boxplot(arvores$Volume, las=1, xlab = "Volume", ylab="Frequency", main="")

#arquivos foram salvos na pasta resultados com o formato.png.

#identificar os outliers do conjunto de dados:
outliers<- boxplot(arvores$Volume, plot=FALSE)
outliers

#O valor extremo achado na variável volume é 77.

#fazer uma correlação par a par entre cada uma das variáveis:
correlacao <- cor(arvores)

write.csv(correlacao,"./results/correlacao_exer5.csv")
