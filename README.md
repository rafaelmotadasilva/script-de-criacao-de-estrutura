<h1>
    <a href="https://www.dio.me/">
     <img align="center" width="40px" src="https://hermes.digitalinnovation.one/assets/diome/logo-minimized.png"></a>
    <span> Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões</span>
</h1>

Repositório desenvolvido para fins educativos.

## Objetivo
Criar um script onde toda a infraestrutura de usuários, grupos de usuários, diretórios e permissões serão criadas automaticamente.

## O Shell script 

Este é um exemplo simples de shell script, no entanto, há muitas opções que podem ser incluídas nesse arquivo de script.

```
#!/bin/bash
####################################
#
# Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões
#
####################################

# Criando diretórios
echo "Criando diretórios..."

mkdir -p /srv/samba/publica
mkdir -p /srv/samba/adm
mkdir -p /srv/samba/ven
mkdir -p /srv/samba/sec

# Criando grupos de usuários
echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criando usuários
echo "Criando usuários..."

useradd carlos -c "Carlos" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -c "Maria" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -c "Joao" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -c "Debora" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -c "Sebastiana" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -c "Roberto" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -c "Josefina" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -c "Amanda" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -c "Rogerio" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

# Especificando permissões dos diretórios
echo "Especificando permissões dos diretórios..."

chown nobody:nogroup /srv/samba/publica
chown root:GRP_ADM /srv/samba/adm
chown root:GRP_VEN /srv/samba/ven
chown root:GRP_SEC /srv/samba/sec

chmod 777 /srv/samba/publica
chmod 770 /srv/samba/adm
chmod 770 /srv/samba/ven
chmod 770 /srv/samba/sec

# Fim
echo "Fim..."
```
## Executando o script

### Execute a partir de um terminal

A maneira mais simples de usar o script acima é copiar e colar o conteúdo em um arquivo (chamado `IaC.sh` por exemplo). O arquivo deve ser tornado executável:

```
chmod u+x IaC.sh
```
Em seguida, em um terminal, execute o seguinte comando:

```
sudo ./IaC.sh
```
Essa é uma ótima maneira de testar o script para garantir que tudo funcione conforme o esperado. Sendo assim, toda nova máquina virtual que for iniciada já estará pronta para uso quando o script for executado.