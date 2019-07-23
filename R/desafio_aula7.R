#Deafio da aula 07

#Construa um gráfico de pontos, contendo cada uma das variáveis (comprimento da sépala,largura da sépala, comprimento da pétala, largura da pétala) no eixo x e os valores médios no eixo y. Inclua as barras de erro (representando o desvio padrão em torno da média). Salve o gráfico em png no diretório /figs

library(ggplot2)

#carregando os dados:
data("iris")

#checando os dados:
summary(iris)
str(iris)
dim(iris)
head(iris)

#tirando a média de cada coluna:
SL<-mean(iris$Sepal.Length)
SW<-mean(iris$Sepal.Width)
PL<-mean(iris$Petal.Length)
PW<-mean(iris$Petal.Width)

#tirando o desvio-padrão de cada coluna:
SLsd<-sd(iris$Sepal.Length)
SWsd<-sd(iris$Sepal.Width)
PLsd<-sd(iris$Petal.Length)
PWsd<-sd(iris$Petal.Width)


#concatenar o resultado das médias e dos desvios-padrões:
Media<- c(SL, SW, PL, PW)
SD <- c(SLsd, SWsd, PLsd, PWsd)

#construir o data.frame com as informações:
df<-data.frame(name= c("Comprimento da Sépala", "Largura da Sépala", "Comprimento da Pétala", "Largura da Pétala"),media=VARIV,desviopadrao=SD)
df

#construindo o gráfico:
plot (x=1:4,df$media,las=1,ylim = c(-1,8), pch=19, xaxt='n', xlab ="Variáveis", ylab = "Médias", bty="l")

axis(1, at=1:4, labels=df$name)

arrows(x0=1:4,
      y0=df$media+df$desviopadrao,
      y1=df$media-df$desviopadrao, angle=90, length=0.05, code=3)

##tentar construir o gráfico pelo ggplot___________________________________________

ggplot(df, aes(factor(name), Media)) +geom_point(stat='identity', colour="slateblue", size=5) + geom_errorbar(aes(ymin=Media-SD, ymax=Media+SD), width=0.5) + xlab("Variáveis") + theme_minimal()

