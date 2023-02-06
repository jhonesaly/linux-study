#!/bin/bash

echo "Starting..."

# ---
# Excluir diretórios, arquivos, grupos e usuários criados anteriormente

## Excluir todos os usuários, exceto o usuário root
echo "Excluindo usuários"
for user in $(ls /home); do
  if [ $user != "root" ]; then
    sudo userdel -r $user
  fi
done

## Excluir todos os grupos
echo "Excluindo grupos"
for group in $(cut -d: -f1 /etc/group); do
  sudo groupdel $group
done

## Excluir todas as pastas dos usuários
echo "Excluindo pastas"
for user in $(ls /home); do
  sudo rm -rf /home/$user
done

# ---
# Criar diretórios, grupos e usuários

# Lendo o arquivo

echo "Lendo o arquivo config.txt"

while read line; do
  ## Verificando se é uma linha de diretórios
  if [[ "$line" == "# Escreva aqui o nome das pastas que deseja criar"* ]]; then
    type="directories"
  ## Verificando se é uma linha de grupos
  elif [[ "$line" == "# Escreva aqui o nome dos grupos que deseja criar"* ]]; then
    type="groups"
  ## Verificando se é uma linha de usuários
  elif [[ "$line" == "# Escreva aqui o nome dos usuários que deseja criar"* ]]; then
    type="users"
  ## Adicionando na lista de acordo com o tipo
  else
    declare -A "$type"
    eval "$type[\$line]=\$line"
  fi
done < config.txt

## Criando diretórios
echo "Criando diretórios"
for dir in "${directories[@]}"; do
  sudo mkdir -p "/$dir"
done

## Criando grupos
echo "Criando grupos"
declare -A group_ids
group_id=1
for group in "${groups[@]}"; do
  sudo groupadd "$group"
  group_ids["$group"]="$group_id"
  ((group_id++))
done

## Criando usuários
echo "Criando usuários"
for user in "${users[@]}"; do
  for group in "${groups[@]}"; do
    if [[ "$user" == *" (${group_ids["$group"]})" ]]; then
      sudo useradd -m -d "/home/${user%% *}" -g "$group" "${user%% *}"
    fi
  done
done



# ---
# Definir dono das pastas

## Mudar dono de todos os diretórios criados para root
sudo chown -R root:root /publico
sudo chown -R root:root /adm
sudo chown -R root:root /ven
sudo chown -R root:root /sec

## Conceder permissões a todos os usuários dentro do diretório publico
sudo chmod -R 777 /publico

## Conceder permissões aos usuários dentro de seus respectivos diretórios
sudo chmod -R 770 /adm
sudo chmod -R 770 /ven
sudo chmod -R 770 /sec

## Remover permissões de leitura, escrita e execução em diretórios de departamentos que não pertencem
sudo chmod -R 500 /adm
sudo chmod -R 500 /ven
sudo chmod -R 500 /sec

# ---

echo "End"