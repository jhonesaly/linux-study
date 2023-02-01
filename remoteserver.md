# Remote Server

# Server linux na própria máquina (Virtual Machine)

Se estiver usando windows, é necessário baixar o putty em <https://www.putty.org/>. Vá em downloads e, para facilitar, baixe o .exe (putty.exe) para sua versão adequada, provavelmente a primeira opção (64-bit x86) e não o instalador .msi.

Abra a sua virtual machine e coloque o comando 

    > ip a

no endereço enp0s3, anote o ip informado em inet

Execute o putty.exe e no campo IP adress, coloque o ip informado, como na imagem:

![putty session](/images/puttysession.png)

# Server linux na AWS

Primeiro, crie uma conta na AWS <https://aws.amazon.com/pt/> (é necessário registrar cartão de crédito, ainda que só use serviços gratuitos)

