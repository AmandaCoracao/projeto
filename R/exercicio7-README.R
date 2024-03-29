#exercicio 7_README

#Construa uma janela gráfica com 1 linha e três colunas seguindo as instruções abaixo
##Comprimento da pétala no eixo x e largura da sépala no eixo y, sendo cada espécie em uma janela gráfica
##Padronize os eixos x e y para todas as espécies
##Plote cada espécie com uma cor diferente
##Adicione a reta do modelo linear
##Inclua rótulos A, B e C em cada uma das janelas gráficas
##Crie um diretório /figs em seu repositório
##Salve o gráfico em png em uma boa resolução, com o tamanho dos pontos e eixos legíveis no diretório /figs

#carregar os dados:
data(iris)

#checar os dados:
head(iris)

#cacular o modelo da regressão linear:
mv <- lm(Sepal.Length ~ Petal.Width, data=iris[iris$Species=="versicolor",])
ms <- lm(Sepal.Length ~ Petal.Width, data=iris[iris$Species=="setosa",])
mvi <-lm(Sepal.Length ~ Petal.Width, data=iris[iris$Species=="virginica",])
coefv <- coef(mv)
coefs <- coef(ms)
coefvi <- coef(mvi)

limy <- c(min(iris$Sepal.Length),max(iris$Sepal.Length))
limx <- c(min(iris$Petal.Width),max(iris$Petal.Width))

labx <- "Comprimento da Pétala"
laby <- "Largura da Sépala"

##EXPORTAR O GRÁFICO

png("figs/figura03.png", res=300, width=2400, height=1200)

par(mfrow=c(1,3), las=1, bty="l") 
plot(Sepal.Length ~ Petal.Width, data=iris[iris$Species=="versicolor",],
     col= "blue",
     ylab=laby, xlab=labx)

abline(a=coefv[1], b=coefv[2],
       col='blue', lwd=2)
mtext("A", 3, adj=0, font=2)

##______________________________________________________________ setosa


plot(Sepal.Length ~ Petal.Width, data=iris[iris$Species=="setosa",],
     col= "green",
     ylab=laby, xlab=labx)

abline(a=coefs[1], b=coefs[2],
       col='green', lwd=2)
mtext("B", 3, adj=0, font=2)

##______________________________________________________________ virginica

plot(Sepal.Length ~ Petal.Width, data=iris[iris$Species=="virginica",],
     col= "tomato",
     ylab=laby, xlab=labx)

abline(a=coefvi[1], b=coefvi[2],
       col='tomato', lwd=2)
mtext("C", 3, adj=0, font=2)

dev.off()

