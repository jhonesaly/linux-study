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

## Diretórios

dirs=(/publico /adm /ven /sec)

## Grupos
declare -A groups
groups=( [GRP_ADM]=1 [GRP_VEN]=2 [GRP_SEC]=3 )

## Usuários
declare -A users
users=( [carlos]=1 [maria]=1 [joao]=1 [debora]=2 [sebastiana]=2 [roberto]=2 [josefina]=3 [amanda]=3 [rogerio]=3 )

## Criar Diretórios
echo "Criando pastas"
for dir in "${dirs[@]}"; do
  sudo mkdir $dir
  sudo chmod 775 $dir
done

## Criar Grupos
echo "Criando grupos"
for group in "${!groups[@]}"; do
  sudo groupadd $group
done

## Criar Usuários
echo "Criando usuários"
for user in "${!users[@]}"; do
  sudo useradd -m -d /home/$user -g ${group}_$(printf %03d ${groups[${users[$user]}]}) $user
  echo "$user:$user" | sudo chpasswd
  sudo chage -d 0 $user
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