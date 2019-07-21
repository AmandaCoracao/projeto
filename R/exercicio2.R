#exercício 02

#Organizar a tabela deste exercicio e salvar as modificações no formato.csv. Calcular a média de uptake para Quebec chilled. 

#importei os dados:
ex2 <- read.csv("./data/exercicio_02.csv")
ex2

#separei as colunas e linhas de interesse:
ex2[22:42, c(1,2,4)]

#tirei a média da última coluna (uptake):
mean(ex2[22:42, c(4)])

#média encontrada: 31.75238
