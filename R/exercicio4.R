#exercicio 4

#Selecionar as colunas de espécies,longitude e latitude da tabela oferecida no R e salvar um arquivo com estes dados. 

#importando a tabela:

algasinfo <- read.csv("./data/0012594-190621201848488.csv", sep="\t", quote = '/"', dec=".", fill=TRUE, comment.char = "", header=TRUE)

#checando dados:
head(algasinfo)
dim(algasinfo)

#separando colunas:
spelatelong <- algasinfo[,c(10,17,18)]

#checando dados:
head(spelatelong)

#salvar o arquivo com estes dados:
write.csv(spelatelong,"./results/resultado_exercicio4.csv")
