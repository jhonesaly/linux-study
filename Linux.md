# Linux

É um dos sistemas operacionais mais  populares e é amplamente utilizado no segmento de servidores e por desenvolvedores de software. Ainda existe um grande espaço para crescimento no segmento de computadores pessoais.

Pai do Linux: Linus Torvalds

![Linus Torvalds](https://s2.glbimg.com/Q7Me8KZOjesto-nd9kxiil9H4xY=/800x0/smart/filters:strip_icc()/s.glbimg.com/po/tt2/f/original/2016/08/30/linux-torvalds3.jpg)

mascote do Linux: Tux
![Tux](https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/405px-Tux.svg.png)

Mantenedor do kernel: Linux Foundation
![Linux Foundation](https://www.linuxfoundation.org/hubfs/Linux-Foundation-OG-Image.png)

Formas de se comunicar com o kernel:

- Ambiente gráfico (Gnome)
- Linha de comando (Bash)

> Servidores raramente possuem ambiente gráfico instalado

## Terminal

se na linha de comando estiver isso:

    jhones@ubuntuserver1:~$

- jhones é o nome do usuário
- @ = conectado em
- ubuntuserver1 é o nome da máquina
- ~ indica diretório atual 
    - ~ = /home/jhones
    - / = raiz
- $ indica o tipo de usuário
    - '$' = usuário com restrição
    - '#' = usuário sem restrições (superusuário)

> O Linux é capital sensitive, então faz diferença se a letra é maiúscula ou minúscula.

As cores padrão usadas pelo comando "ls" para indicar o tipo de arquivo variam dependendo da configuração do sistema, mas aqui está uma lista comuns:

- Pastas: geralmente exibidas em azul ou ciano
- Arquivos regulares: geralmente exibidos em branco ou cinza
- Link simbólicos: geralmente exibidos em verde
- Dispositivos de caractere: geralmente exibidos em amarelo
- Dispositivos de bloco: geralmente exibidos em amarelo
- Arquivos executáveis: geralmente exibidos em vermelho ou laranja
- Arquivos ocultos: geralmente exibidos em cinza escuro ou com um prefixo "." na frente do nome do arquivo

Essas cores podem ser personalizadas na configuração do seu shell ou usando uma ferramenta como o "dircolors".

---
# Distribuições

As distros são pacote que incluem o kernel Linux mais uma seleção de aplicativos mantidos por uma empresa ou comunidade.

![Distros Linux](https://miro.medium.com/max/596/1*75iMyS-b0IQvWiJAk1xMQA.png)

Servidor:

- Ubuntu Server: Uma distribuição popular para servidores, com suporte oficial e uma ampla gama de pacotes e recursos.
- Red Hat Enterprise Linux (RHEL): Uma distribuição de servidor comercial com suporte oficial e recursos avançados para empresas.
- CentOS: Uma distribuição de servidor baseada no RHEL com suporte community-driven.
- Debian: Uma distribuição estável e confiável para servidores, com muitos pacotes disponíveis.
- SUSE Linux Enterprise Server (SLES): Uma distribuição de servidor comercial com recursos avançados e suporte oficial.

Usuário final:

- Ubuntu: Uma distribuição popular para usuários finais, com uma grande comunidade e muitos recursos.
- Mint: Uma distribuição amigável para usuários iniciantes, baseada no Ubuntu.
- Fedora: Uma distribuição para usuários avançados e desenvolvedores, com novos recursos e tecnologias.
- Manjaro: Uma distribuição baseada no Arch Linux com foco na facilidade de uso.
- Debian: Uma distribuição estável e confiável para usuários finais, com muitos pacotes disponíveis.
- openSUSE: Uma distribuição para usuários avançados e desenvolvedores, com recursos avançados e suporte da comunidade.

Desenvolvimento/Programação:

- Fedora: Uma distribuição para desenvolvedores e usuários avançados, com suporte a novas tecnologias e ferramentas.
- Ubuntu: Uma distribuição popular para desenvolvedores, com muitos pacotes e recursos.
- Debian: Uma distribuição estável e confiável para desenvolvimento, com muitos pacotes disponíveis.
- Mint: Uma distribuição amigável para usuários iniciantes, baseada no Ubuntu.
- Arch Linux: Uma distribuição para desenvolvedores e usuários avançados, com controle total sobre a configuração.

Segurança/Penetração de testes:

- Kali Linux: Uma distribuição especializada em segurança e testes de penetração, com muitas ferramentas incluídas.
- BlackArch: Uma distribuição baseada no Arch Linux com foco em segurança e testes de penetração.
- Parrot Security OS: Uma distribuição baseada no Debian para testes de segurança, com suporte a muitos recursos avançados.
- BackBox: Uma distribuição baseada no Ubuntu com suporte a testes de segurança e ferramentas avançadas para análise de rede.
- DEFT Linux: Uma distribuição para análise digital e investigações forenses, com suporte a muitas ferramentas e recursos avançados.

---
# Comandos

- sudo: executar como super usuário
- date: informa a data e hora
- man cmd: indica o manual do comando (man ls)
- cmd --help: mostra resumo do comando e parâmetros cabíveis (ls --help)
- export: altera variáveis de ambiente
- para criar scripts que serão executados no shell, arquivo precisar ter extensão .sh e o script deve começar com #!/bin/bash
- unzip <archive.zip> - descompacta arquivo .zip
- unrar <archive.rar> - descompacta arquivo .rar


![creating script](/images/bash1.png)

- Para executar o script na pasta usa-se o comando:

   #> ./nome_do_script.sh

Para ver a lista de todos os usuários, use o comando

    cat /etc/passwd

Se quiser ver somente os nomes dos usuários:

    cut -d: -f1 /etc/passwd

Para ver somente os usuários criados pelo administrador ou outros usuários, use o comando:

    getent passwd | awk -F: '$3 >= 1000 {print $1}'

> Este comando usa o comando awk para filtrar as entradas em que o terceiro campo (o ID de usuário, ou UID) é maior ou igual a 1000. Em muitos sistemas Linux, os usuários criados pelo administrador/usuários da máquina têm UIDs maiores ou iguais a 1000.


Gerenciamento de arquivos e diretórios:

- ls - Lista o conteúdo de um diretório
    - após o comando cd, pode clicar duas vezes a tecla tab para mostrar todos os diretórios e facilitar a navegação
    - ls | more - lista os conteúdos que cabem no visor do terminal e para mostrar mais é necessário clicar enter. (para sair use ctrl + C)
    - ls p* - lista todos os arquivos e diretórios que começam com p
    - ls ??? - lista todos as pastas e arquivos com 3 caracteres.
    - ls arquivo[1-3]* - lista todos os arquivos seguidos de 1,2 e 3 e qualquer extensão (arquivo1.txt, arquivo2.txt, arquivo3.txt)
    - ls arquivo[2,5]* - lista todos os arquivos seguidos de 2 e 5 e qualquer extensão (arquivo2.txt, arquivo5.txt)
    - ls arquivo[^3,5]* - lista todos os arquivos menos os de 3 a 5 pois foram negados (arquivo1.txt, arquivo2.txt)
    - ls /path - lista todos os arquivos dentro do path indicado (ex: ls /sys/kernel)
- cd - Muda para um diretório específico
    - cd .. - Muda para o diretório superior
- pwd - Mostra o caminho absoluto do diretório atual
- mkdir - Cria um novo diretório
    - para criar um documento com espaço, é necessário colocar tudo dentro de aspas, se não criará uma pasta para cada palavra.
- rmdir - Remove um diretório *vazio*
- touch - Cria um novo arquivo
- cp - Copia um arquivo ou diretório
- mv - Move ou renomeia um arquivo ou diretório
- rm - exclui um arquivo
    rm -r - sobe todos arquivos de uma pasta e apaga ela
    rm -rf - exclui todos os arquivos de uma pasta e a apaga
- find - Procura por arquivos ou diretórios em um local específico
    - find -name - procura um arquivo pelo nome (ex: find -name arq*)
- grep - Procura por uma string específica em um arquivo ou conjunto de arquivos
- diff - Exibe as diferenças entre dois arquivos

Manipulação de arquivos:

- echo - Exibe uma mensagem na tela
- cat - Exibe o conteúdo de um arquivo
- nano /path - abre para edição usando o nano
- less - Exibe o conteúdo de um arquivo com rolagem
- head - Exibe as primeiras linhas de um arquivo
- tail - Exibe as últimas linhas de um arquivo

Gerenciamento de processos:

- ps - Lista os processos em execução
- kill - Encerra um processo pelo ID do processo
- top - Exibe informações sobre processos em execução e uso de recursos
- killall - Encerra vários processos pelo nome
- nice - Altera a prioridade de um processo
- renice - Altera a prioridade de um processo existente

Gerenciamento de sistema:

- shutdown - Desliga o sistema
- reboot - Reinicia o sistema
- apt-get - Gerencia pacotes no sistema Ubuntu
- free - Exibe informações sobre o uso de memória do sistema
- df - Exibe informações sobre o uso de espaço em disco
- du - Exibe informações sobre o uso de espaço em disco para um diretório específico


Gerenciamento de usuários e grupos:

- useradd convidado1 -c "Convidado 1" -m -s /bin/bash -p $(openssl passwd -6 123) -G group1
    - -c: cria um comentário, no caso o nome
    - -m: cria pasta home
    - -s /bin/bash: atribui shell ao usuário
    - -p $(openssl passwd -6 123): cria senha não criptografada (123) para o usuário 
    - -e: defina data de encerramento
    - -G: adiciona a um grupo (group1)
- userdel -r -f user - remove o usuário "user" e seu diretório
- chsh: muda o tipo de shell do usuário **atual** (usermod muda de outro)
    - chsh -s: novo login shell para a conta do usuário
- passwd: muda a senha de um usuário
    - sudo passwd root: define a senha do super usuário. 
- su : muda para superusuário
    - su username: muda para usuário  
- groupadd - adiciona um grupo ao sistema
- groupdel - Remove um grupo vazio do sistema
- usermod -G group1,group2 user1
    -G - define os grupos (1 e 2) a que o user1 pertence
    > não adiciona grupos! Se o usuário pertencia a algum grupo antes e esse grupo não consta nos parâmetros informados, ele sai do grupo a que pertencia.
- gpasswd -d user1 group1
    - -d: remove user1 do group1
- groupmod - Modifica as informações de um grupo existente
  

Gerenciamento de permissões:

- chown user1:group1 dir1/ - Modifica o proprietário de um arquivo ou diretório
    - user1 - novo dono do diretório
    - group1 - novo grupo do diretório
    - dir1 - diretório ao qual se aplicarão as mudanças
- chmod 750 adm/- Modifica as permissões de um arquivo ou diretório

![permissões](/images/permissions.png)

> U - Usuário
> G - Grupo
> O - Outros

![chmod 750](/images/chmod.png)

> d = diretório
> rwx = 7
> r-x = 5
> --- = 0

Para saber o número, basta somar conforme a tabela:

![chmod tabela](/images/chmod2.png)



- chgrp - Modifica o grupo de um arquivo ou diretório

Gerenciamento de pacotes:

> Antes de atualizar qualquer pacote no Linux, faça um snapshot da máquina para, caso algo dê problema, possa ser revertido.
> No ambiente de produção, o ideal é duplicar o sistema para teste, fazer as atualizações verificando se há algum problema, e então atualizar na versão com clientes.

- apt list - lista de pacotes disponíveis no sistema
    - --installed - Lista todos os pacotes instalados no sistema.
    - --upgradable - lista de pacotes atualizáveis
- apt show <package>: Exibe informações detalhadas sobre o pacote especificado, incluindo versão, tamanho, dependências, etc.
- apt search <package> - Pesquisa por pacotes disponíveis correspondentes ao termo.
- apt-get update - Atualiza a lista de pacotes disponíveis no sistema
- apt update: Atualiza a lista de pacotes disponíveis (não instala ainda).
- apt upgrade: instala atualização dos pacotes já instalados para as versões mais recentes baixadas pelo update.
- apt install <package>: Instala o pacote especificado.
- apt -f install: Tenta corrigir quaisquer dependências quebradas dos pacotes instalados.
- wget <url>: Baixa o arquivo especificado na URL.
- wget -c <url>: Continua o download de um arquivo interrompido.
- wget -r -l1 --no-parent <url>: Baixa recursivamente os arquivos de uma página web, sem seguir links para páginas pais.
- wget -O <file> <url>: Especifica um nome de arquivo diferente para o arquivo baixado.
- wget --limit-rate=200k <url>: Limita a taxa de download para 200 KB/s.
- apt remove <package>: Remove o pacote especificado.
- apt autoremove: Remove pacotes obsoletos e que não são mais necessários.
- apt clean: Remove arquivos desnecessários do cache do sistema de gerenciamento de pacotes.

Gerenciamento de rede:

- ifconfig - Exibe informações sobre as interfaces de rede
- ping - Testa a conectividade de rede para um endereço específico
- traceroute - Exibe o caminho de uma mensagem de rede para um endereço específico

Gerenciamento de serviços:

- systemctl - Gerencia serviços no sistema Ubuntu
- service - Gerencia serviços antigos no sistema Ubuntu
- systemctl status - Exibe o status de um serviço específico
- systemctl start - Inicia um serviço específico
- systemctl stop - Interrompe um serviço específico
- systemctl restart - Reinicia um serviço específico

Gerenciamento de sessão:

- clear (ctrl + L)- Limpa a tela do terminal
> ctrl + L não apaga o terminal, só empurra o que já está no terminal para fora da tela.
- history - Exibe o histórico de comandos recentes (até o 1000)
    - para repetir o comando, basta ver o número dele no history (ex:184) e digitar ! antes (ex: !184)
    - !! repete o último comando
    - !n - Executa o comando n do histórico de comandos
    - history -c suprime histórico (mas não apaga)
    - set +o history - faz os comandos serem ocultos, mas não tem como ocultar ação de ocultação.
    - set -o history - volta ao normal