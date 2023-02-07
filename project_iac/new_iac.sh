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

## Excluir todos os grupos com id superior a 999 e menor que 1100
echo "Excluindo grupos"
for group in $(cut -d: -f1 /etc/group); do
  id=$(getent group $group | cut -d: -f3)
  if [ $id -gt 999 ] && [ $id -lt 1100 ]; then
    if [ $group != "sync" ]; then
      sudo groupdel $group
    fi
  fi
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

declare -A directories
declare -A groups
declare -A users

while read line; do
  
    if [[ $line =~ ^# ]]; then
        ## Verificando se é uma linha de diretórios
        if [[ "$line" =~ "^#.*pastas.*" ]]; then
            section="directories"
        
        ## Verificando se é uma linha de grupos
        elif [[ "$line" =~ "^#.*grupos.*" ]]; then
            section="groups"
        
        ## Verificando se é uma linha de usuários
        elif [[ "$line" =~ "^#.*usuários.*" ]]; then
            section="users"
        fi
    else
        if [[ $section == "directories" ]]; then
        directories[$line]=1
        
        elif [[ $section == "groups" ]]; then
        groups[$line]=$(( ${#groups[@]} + 1 ))
        
        elif [[ $section == "users" ]]; then
        user=($line)
        username=${user[0]}
        group=${user[1]}
        users[$username]=$group
        fi
 
    fi
done < config.txt

## Criando diretórios
echo "Criando diretórios"
for dir in "${directories[@]}"; do
    sudo mkdir -p "/$dir"
    echo "Criado $dir"
done

## Criando grupos
echo "Criando grupos"
for group in "${groups[@]}"; do
    sudo groupadd "$group"
    echo "Criado $group"
done

## Criando usuários e adicionando a grupo
echo "Criando usuários..."
for user in "${!users[@]}"; do
    useradd $user
    group=$(getent group ${groups[${users[$user]}]} | awk -F: '{print $1}')
    usermod -aG $group $user
    echo "Criado $user"
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