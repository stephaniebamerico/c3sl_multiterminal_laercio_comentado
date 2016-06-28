#!/bin/bash

indice=0
userful_encontrado=false

if ! [ -d /boot/userful-rescue -a -f /boot/userful-rescue/userful-rescue-live-20160628-i386.iso ]
then
    cat << EOF

[ERRO] Userful Rescue Live não encontrado!
       Baixe a ISO do Userful Rescue Live no endereço

           https://drive.google.com/open?id=0B_0RrXAKZ1hbdnRvcGRuSFc2Nkk

       e salve-a na pasta /boot/userful-rescue.
       Depois disso, execute este script novamente.

EOF
    exit 1
fi

install -m 644 userful/42_userful-rescue /etc/grub.d
update-grub

while read -r linha
do
    if echo "${linha}" | grep "menuentry.*Userful Rescue Live" >/dev/null
    then
        userful_encontrado=true
        break
    else
        indice=$(( indice + 1 ))
    fi
done < <(grep "^menuentry\|submenu" /boot/grub/grub.cfg)


cat << EOF

[INFO] Userful Rescue Live encontrado.
       Índice correspondente no menu do GRUB: ${indice}.

EOF

install -m 644 systemd/userful-rescue-nextboot-* /etc/systemd/system

cat > /etc/userful-rescue-nextboot.conf << EOF
USERFUL_RESCUE_NEXTBOOT_ENABLE=true
USERFUL_RESCUE_NEXTBOOT_INDEX=${indice}
EOF

systemctl enable userful-rescue-nextboot-poweroff.service
grub-reboot ${indice}

cat << EOF

[AVISO] Agora você deve desligar o computador e ligá-lo novamente.
        O computador deve iniciar no Userful Rescue Live e reiniciar
        automaticamente de volta para este sistema.

        Uma vez concluído o processo, você pode reiniciar o computador
        sempre que necessário.

EOF
