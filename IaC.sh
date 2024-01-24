#!/bin/bash
####################################
#
# Samba como servidor de arquivos.
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
