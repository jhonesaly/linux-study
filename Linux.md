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

## Distribuições

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

Gerenciamento de arquivos e diretórios:

- ls - Lista o conteúdo de um diretório
- cd - Muda para um diretório específico
- pwd - Mostra o caminho absoluto do diretório atual
- mkdir - Cria um novo diretório
- rmdir - Remove um diretório vazio
- touch - Cria um novo arquivo
- cp - Copia um arquivo ou diretório
- mv - Move ou renomeia um arquivo ou diretório
- rm - Remove um arquivo ou diretório
- find - Procura por arquivos ou diretórios em um local específico
- grep - Procura por uma string específica em um arquivo ou conjunto de arquivos
- diff - Exibe as diferenças entre dois arquivos

Manipulação de arquivos:

- echo - Exibe uma mensagem na tela
- cat - Exibe o conteúdo de um arquivo
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

- adduser - Adiciona um novo usuário ao sistema
- addgroup - Adiciona um novo grupo ao sistema
- usermod - Modifica as informações de um usuário existente
- groupmod - Modifica as informações de um grupo existente
- deluser - Remove um usuário do sistema
- delgroup - Remove um grupo do sistema

Gerenciamento de permissões:

- chmod - Modifica as permissões de um arquivo ou diretório
- chown - Modifica o proprietário de um arquivo ou diretório
- chgrp - Modifica o grupo de um arquivo ou diretório

Gerenciamento de pacotes:

- apt-cache - Exibe informações sobre pacotes disponíveis no sistema
- apt-get update - Atualiza a lista de pacotes disponíveis no sistema
- apt-get install - Instala um pacote específico no sistema
- apt-get remove - Remove um pacote específico do sistema

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

- clear - Limpa a tela do terminal
- history - Exibe o histórico de comandos recentes
- !n - Executa o comando n do histórico de comandos