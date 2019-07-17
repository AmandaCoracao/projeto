#Tutorial Anscombe

#primeiro chamar um pacote que já tem no R:

data("anscombe")

#checar os dados:
# dimensao dos dados, N de linhas e N de colunas

dim(anscombe)
# seis primeiras linhas dos dados

head(anscombe) 
# classe do objeto

class(anscombe) 
# estrutura do objeto

str(anscombe) 

#média por coluna:

mean(anscombe$x1)
mean(anscombe$x2)
mean(anscombe$x3)
mean(anscombe$x4)

# o mesmo calculo, agora apenas em 1 linha de comando
## media de todos os vetores x
#aplica uma funcao a todas as linhas de um objeto; o 2 é do dim (coluna! o seja o quanto os números variam nessa coluna)

apply(anscombe[,1:4], 2, mean) 
## media de todos os vetores y

apply(anscombe[,5:8], 2, mean)
# variância dos dados
# aplica a funcao var a todas as linhas do objeto
apply(anscombe, 2, var) 

# correlação entre as colunas

cor(anscombe$x1, anscombe$y1)

cor(anscombe$x2, anscombe$y2)

cor(anscombe$x3, anscombe$y3)

cor(anscombe$x4, anscombe$y4)

# coeficiente de regressão
## primeiro criamos objetos com as regressoes dos quatro conjuntos

m1 <- lm(anscombe$y1 ~ anscombe$x1)

m2 <- lm(anscombe$y2 ~ anscombe$x2)

m3 <- lm(anscombe$y3 ~ anscombe$x3)

m4 <- lm(anscombe$y4 ~ anscombe$x4)

## vamos criar agora uma lista com todos os modelos para facilitar o trabalho

mlist <- list(m1, m2, m3, m4)

## função summary muda conforme a classe do objeto. Temos que usar dois [[]] por ser uma lista e estabelecer de qual modelo a gente quer.

summary(mlist[[1]])

## agora sim podemos calcular de forma menos repetitiva os coeficientes de regressao

lapply(mlist, coef) 

anscombe

# funcao par para definir as configuracoes da janela grafica entre em ?par
#abre uma janela gráfica com 2 linhas  e 2 colunas (ou seja 2 gráficos, um do lado do outro)
# deixa as legendas dos eixos na vertical (las=1)
# tipo do box do grafico em L (bty="L") 

par(mfrow=c(2,2),las=1,bty="l") 
#plot das variaveis

plot(anscombe$y1 ~ anscombe$x1) 
# adicionando a reta prevista pelo modelo de regressao. Essa função pode ser colocada com um valor de x e y ou com o valor de intercept e coef.

abline(mlist[[1]])

plot(anscombe$y2 ~ anscombe$x2)

abline(mlist[[2]])

plot(anscombe$y2 ~ anscombe$x3)

abline(mlist[[3]])

plot(anscombe$y3 ~ anscombe$x4)

abline(mlist[[4]])
# retorna a janela grafica para o padrao de 1 linha e 1 coluna

par(mfrow=c(1,1)) 

pie(anscombe$x1)

#_____________________________________________________________________ PARTE 2

data(iris)
?iris
head(iris)
summary(iris) 
table(iris$Species)

# media do comprimento de sepala por especie
tapply(X = iris$Sepal.Length, INDEX = list(iris$Species), FUN = mean)

# a mesma tarefa, executada por outra funcao. Outros argumentos e outra saída. Tem que colocar em uma lista.. a diferença principal é uma saída. x é o que a gente quer agregar. Posso colocar ... by list(SL=iris$species)... para dar nome aquela coluna!

aggregate(x = iris$Sepal.Length, by = list(iris$Species), FUN = mean)
# ainda a mesma tarefa, com a mesma função mas em uma notação diferente
aggregate(Sepal.Length ~ Species, data=iris, mean)
aggregate(Sepal.Width ~ Species, data=iris, mean)
aggregate(Petal.Length ~ Species, data=iris, mean)

tapply(X = iris$Sepal.Length, INDEX = list(iris$Species), FUN = sd)
tapply(X = iris$Sepal.Width, INDEX = list(iris$Species), FUN = sd)
tapply(X = iris$Petal.Length, INDEX = list(iris$Species), FUN = sd)
tapply(X = iris$Petal.Width, INDEX = list(iris$Species), FUN = sd)

#Veja abaixo uma solução de como calular a média por espécie de todas as variáveis (usar o comando for).
# criando matriz de 3 colunas - uma para cada sp - e 4 linhas - uma para cada metrica. É uma matriz vazia!!
medias <- matrix(NA, ncol=3, nrow=4)

# definindo o nome das colunas e das linhas da matriz.  função unique [pega apenas os valores únicos, que se repetem na tabela]
colnames(medias) <- unique(iris$Species)
# a função names(iris) mostra os nome das linhas da tabelas e ela retirou a quinta linha
rownames(medias) <- names(iris)[-5]

# isso significa que a letra i substitui o que seria feito de um a um. Por exemplo : medias1 <- tapply(iris [,1]).... depois medias[2,] <- tapply (iris[,2])... epor ai vai. Está aplicando no objeto medias, as médias das espécies de cada coluna.
for (i in 1:4){medias[i,] <- tapply(iris[,i], iris$Species, mean)}


vars <- iris[,-5]
#média
apply(vars, 2, mean)
#mediana
apply(vars, 2, median)
#moda
freq_sl <- sort(table(iris$Sepal.Length), decreasing = TRUE)
freq_sl[1]
#variância : desvio da média
apply(vars, 2, var)
#desvio-padrão
sd01 <- apply(vars, 2, sd)
sd02 <- apply(vars, 2, function(x) sqrt(var(x)))
sd01
sd02
sd01==sd02

#coeficiente de variação
cv <- function(x){sd(x)/mean(x)*100}
apply(vars, 2, cv)

# sumario de 5 numeros (quantis ou percentis)
apply(vars, 2, quantile)
# 5%, 50% e 95% . Utiliza o argumento probs para modificar os quantis
apply(vars, 2, quantile, probs=c(0.5, 0.5, 0.95))

#intervalo
# a funcao range nos retorna os valores minimo e maximo
apply(vars, 2, range)

# aplicando a funcao diff ao resultado do range, temos o valor desejado
# uma boa pratica é nunca sobrescrever um objeto já existente no R, por isso
# nunca nomeie um objeto com um nome já existente
my_range <- function(x){diff(range(x))}
apply(vars, 2, my_range)

#intervalo interquartil (IIQ)
apply(vars, 2, IQR)

#correlação
cor(vars)
library(ggplot2)

#gráficos em barra

c <- ggplot(data=iris,aes(x=Species,y=Sepal.Length)) +
  geom_bar(aes(stat_bin_2d(bins = 30, drop = T),position="dodge"))

                                                           
barplot(table(iris$Species))
#histograma
par(mfrow=c(2,2))
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Length)

par(mfrow=c(1,2))
hist(iris$Sepal.Width)
#breaks edita os intervalos do gráfico
hist(iris$Sepal.Width, breaks = 4)

par(mfrow=c(1,1))

#curva de densidade
par(mfrow=c(1,2))
hist(iris$Sepal.Width)
hist(iris$Sepal.Width, freq = FALSE)
par(mfrow=c(1,1))
par(mfrow=c(1,2))


# plot da curva de densidade
plot(density(iris$Sepal.Width))
# plot da curva de densidade sobre o histograma de densidade
hist(iris$Sepal.Width, freq = FALSE)
lines(density(iris$Sepal.Width), col="blue") # note que agora estamos usando a funcao o comando add=TRUE
par(mfrow=c(1,1))


#boxplot

boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Width)
boxplot(iris$Petal.Length)
boxplot(iris$Petal.Width)

boxplot(Sepal.Length ~ Species, data=iris)
boxplot(Sepal.Width ~ Species, data=iris)
boxplot(Petal.Length ~ Species, data=iris)
boxplot(Petal.Width ~ Species, data=iris)
boxplot(iris$Sepal.Width)

#resultado numérico do boxplot
my.boxplot <- boxplot(iris$Sepal.Width, plot = FALSE)
my.boxplot
# o objeto é uma lista e os valores outliers estão guardados no elemento $out da lista
outliers <- my.boxplot$out
outliers

#qual a posição dos outliers
which(iris$Sepal.Width %in% outliers)

#vamos usar a posição para indexar o objeto - ver quem eles são 
iris[iris$Sepal.Width %in% outliers, c("Sepal.Width", "Species")]
iris[which(iris$Sepal.Width %in% outliers), c("Sepal.Width", "Species")]


boxplot(Sepal.Width ~ Species, data=iris)
my_boxplot2 <- boxplot(Sepal.Width ~ Species, data=iris, plot=FALSE)
my_boxplot2
# o objeto é uma lista e os valores outliers estão guardados no elemento $out da lista
outliers2 <- my_boxplot2$out
# neste caso, queremos apenas os outliers da especie setosa
# vamos usar a posicao para indexar o objeto
iris[iris$Sepal.Width %in% outliers2 & 
       iris$Species=="setosa", 
     c("Sepal.Width", "Species")]

par(mfrow=c(1,3))
qqnorm(iris$Sepal.Length[iris$Species=="setosa"], 
       main="setosa")
qqline(iris$Sepal.Length[iris$Species=="setosa"])
qqnorm(iris$Sepal.Length[iris$Species=="versicolor"], 
       main="versicolor")
qqline(iris$Sepal.Length[iris$Species=="versicolor"])
qqnorm(iris$Sepal.Length[iris$Species=="virginica"], 
       main="virginica")
qqline(iris$Sepal.Length[iris$Species=="virginica"])


par(mfrow=c(1,1))

#relação entre variáveis
pairs(vars)

library(GGally)
#usar esse pacote!!
ggpairs(vars)


