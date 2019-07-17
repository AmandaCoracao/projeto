# Para listar os objetos no workspace
ls()

#Para remover
rm(list = ls())

#Qual é a pasta de trabalho?
getwd()

# no terminal do RSTUDIO (onde vc pode fazer qualquer coisa e n está ligado ao R)
#colocar pwd na aba terminal q significa print working directory
# slide de configurar seu nome e e-mail para identificar q é seu
# depois inicia uma "conexão" com o git hub colocando git init
# criamos um repositório no github para o projeto e linkamos isso com o Rstudio pela criação de uma senha aqui SSH
# pelo site, há um comando para enviar o que está salvo aqui para o diretório da nuvem do git hub
# git remote -v para aprecer comandos, git add [arquivo] adcionar TAB para colocar a frma do arquivo (txt). 

a <- c(5,4,3,2,1)

#git ignore 
Data/exercicio_01.slsx

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
