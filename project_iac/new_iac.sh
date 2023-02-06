#!/bin/bash

# Excluir todos os usuários, exceto o usuário root
for user in $(ls /home); do
  if [ $user != "root" ]; then
    sudo userdel -r $user
  fi
done

# Excluir todos os grupos
for group in $(cut -d: -f1 /etc/group); do
  sudo groupdel $group
done

# Excluir todas as pastas dos usuários
for user in $(ls /home); do
  sudo rm -rf /home/$user
done

# Criar diretórios, grupos e usuários
sudo mkdir /path/to/public_dir
sudo groupadd group1
sudo useradd -g group1 -d /path/to/group1_dir -s /bin/bash username1

# Definir o dono de todos os diretórios como root
sudo chown root:root /path/to/public_dir
sudo chown root:group1 /path/to/group1_dir

# Definir permissões para usuários e grupos
sudo chmod 775 /path/to/public_dir
sudo chmod 770 /path/to/group1_dir

# Adicionar usuários a grupos
sudo usermod -a -G group1 username1