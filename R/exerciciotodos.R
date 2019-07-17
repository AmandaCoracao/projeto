#exercício 02
#importei os dados:

ex2 <- read.csv("./data/exercicio_02.csv")

#separei as colunas e linhas de interesse:

ex2[22:42, c(1,2,4)]

#tirei a média da última coluna

mean(ex2[22:42, c(4)])

#exercício 03
#importei dados:

ex3 <- read.csv("./data/exercicio_03.csv")
# utilizei função de somar linhas de colunas

colSums(ex3[c(2:51)])

#ultimo exercicio da aula 4 - algas

#importando os dados

algasinfo <- read.delim("./data/0012594-190621201848488.csv", sep="\t", quote = '/"', dec=".", fill=TRUE, comment.char = "")

#checando dados:

head(algasinfo)

dim(algasinfo)

#separando colunas:

gibf4 <- algasinfo[,c(10,17,18)]

#checando dados:

head(gibf4)
