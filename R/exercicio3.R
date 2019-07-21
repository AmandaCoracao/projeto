#exercício 03

#Salvar os dados em apenas uma aba do excel e organizá-los, salvar no formato csv e calcular o número de indivíduos por parcela de 1 hectare na Ilha de Barro Colorado.

#importei dados:
ex3 <- read.csv("./data/exercicio_03.csv")
ex3

# utilizei função de somar linhas de colunas:
colSums(ex3[c(2:51)])
