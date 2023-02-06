# Definição

Infraestrutura como código (IaC) é o **gerenciamento** e provisionamento da infraestrutura por meio de **códigos**, em vez de processos manuais.

Com a IaC, são criados **arquivos de configuração** que incluem as especificações da sua infraestrutura, facilitando a edição e a distribuição de configurações. Ela também assegura o provisionamento do mesmo ambiente todas as vezes. 

Ao automatizar o provisionamento da infraestrutura com a IaC, os desenvolvedores não precisam provisionar e gerenciar manualmente servidores, sistemas operacionais, armazenamento e outros componentes de infraestrutura sempre que criam ou implantam uma aplicação.

# Requisitos

Diretórios:

- /publico
- /adm
- /ven
- /sec

Grupos (explicação):

- 1: GRP_ADM (administrativo)
- 2: GRP_VEN (vendas)
- 3: GRP_SEC (secretariado)

Usuários (grupo):

- carlos (1)
- maria (1)
- joao (1)
- debora (2)
- sebastiana (2)
- roberto (2)
- josefina (3)
- amanda (3)
- rogerio (3)

Operações:

- Excluir diretórios, arquivos, grupos e usuários criados anteriormente;
- Todo provisionamento deve ser feito em um arquivo do tipo Bash Script;
- O dono de todos os diretórios criados será o usuário root;
- Todos os usuários terão permissão total dentro do diretório publico;
- Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório;
- Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertencem;
- Subir arquivo de script criado para a sua conta no GitHub.
