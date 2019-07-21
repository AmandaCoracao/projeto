#não salvar o workspace! Salve o script e outputs.
# na aba terminal do RStudio (onde você pode fazer qualquer coisa e não está ligado ao R) colocar pwd que significa print working directory
# configurar seu nome e e-mail para identificar q é seu (`git config user.name "seu nome" e git config user.email "seu e-mail")
# depois iniciar uma "conexão" com o git hub colocando git init
# criamos um repositório no github para o projeto e linkamos isso com o RStudio pela criação de uma senha aqui (SSH)
# Há comandos para enviar o que está salvo aqui para o diretório da nuvem do git hub. O caminho seria:
# git init (apenas uma vez, no início)
# git pull origin master (para puxar o que tem na nuvem neste repositório, ou seja, atualizar)
# git satus (o que há no meu working directory - pastas)
# git add nome_do_arquivo.R (pressionar TAB para colocar a forma do arquivo e auxiliar na busca)
# git remote -v (para aparecer o que posso fazer para mandar e puxar coisas da nuvem)
# git commit -m "sua_mensagem" (é um corte local)
# git push origin master (enivar tudo para o repositório)
# git ignore
__________________________________________________________________________________

#Qual é a pasta de trabalho?
getwd()

# criamos um projeto com a pasta de trabalho

# Para listar os objetos no workspace
ls()

3+2

#criar um objeto
a <- c(3)
b <- c(5,4,2,1)

a+b

#Para remover
rm(list = ls())
