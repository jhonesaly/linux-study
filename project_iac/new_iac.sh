#!/bin/bash

# ---
# Excluir diretórios, arquivos, grupos e usuários criados anteriormente

## Excluir todos os usuários, exceto o usuário root
for user in $(ls /home); do
  if [ $user != "root" ]; then
    sudo userdel -r $user
  fi
done

## Excluir todos os grupos
for group in $(cut -d: -f1 /etc/group); do
  sudo groupdel $group
done

## Excluir todas as pastas dos usuários
for user in $(ls /home); do
  sudo rm -rf /home/$user
done

# ---
# Criar diretórios, grupos e usuários

## Criar diretórios
sudo mkdir /publico
sudo mkdir /adm
sudo mkdir /ven
sudo mkdir /sec

## Criar grupos
sudo groupadd GRP_ADM
sudo groupadd GRP_VEN
sudo groupadd GRP_SEC

## Criar usuários e adicionar nos grupos
sudo useradd -m -d /home/carlos -g GRP_ADM carlos
sudo useradd -m -d /home/maria -g GRP_ADM maria
sudo useradd -m -d /home/joao -g GRP_ADM joao
sudo useradd -m -d /home/debora -g GRP_VEN debora
sudo useradd -m -d /home/sebastiana -g GRP_VEN sebastiana
sudo useradd -m -d /home/roberto -g GRP_VEN roberto
sudo useradd -m -d /home/josefina -g GRP_SEC josefina
sudo useradd -m -d /home/amanda -g GRP_SEC amanda
sudo useradd -m -d /home/rogerio -g GRP_SEC rogerio

# ---
# Dinir dono das pastas

## Mudar dono de todos os diretórios criados para root
sudo chown -R root:root /publico
sudo chown -R root:root /adm
sudo chown -R root:root /ven
sudo chown -R root:root /sec

## Conceder permissões a todos os usuários dentro do diretório publico
sudo chmod -R 777 /publico

## Conceder permissões aos usuários dentro de seus respectivos diretórios
sudo chmod -R 700 /adm/GRP_ADM
sudo chmod -R 700 /ven/GRP_VEN
sudo chmod -R 700 /sec/GRP_SEC

## Remover permissões de leitura, escrita e execução em diretórios de departamentos que não pertencem
sudo chmod -R 500 /adm
sudo chmod -R 500 /ven
sudo chmod -R 500 /sec