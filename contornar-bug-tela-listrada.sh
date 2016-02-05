#!/bin/bash

indice=0
le5_encontrado=false

while read -r linha
do
    if echo "${linha}" | grep "menuentry.*Linux Educacional 5.0" >/dev/null
    then
        particao=$(echo ${linha} | cut -d' ' -f7 | cut -d')' -f1)
        le5_encontrado=true
        break
    else
        indice=$(( indice + 1 ))
    fi
done < <(grep "^menuentry\|submenu" /boot/grub/grub.cfg)

if ! ${le5_encontrado}
then
    echo "[ERRO] Partição do Linux Educacional 5.0 não detectada!"
    echo "       Certifique-se de que o Linux Educacional 5.0"
    echo "       está instalado em uma outra partição e execute"
    echo "       o comando 'update-grub' neste sistema"
    echo "       para atualizar o menu do GRUB."
    exit 1
fi

install -m 644 systemd/le-nextboot-* /etc/systemd/system

systemctl enable le-nextboot-read-write@${indice}
systemctl enable le-nextboot-reboot

grub-reboot ${indice}

mount ${particao} /mnt
install -m 644 userful/* /mnt/etc/userful
umount /mnt

echo
echo "[AVISO] Agora você deve desligar o computador e ligá-lo novamente."
echo "        O computador deve iniciar no Linux Educacional e reiniciar"
echo "        automaticamente de volta para este sistema."
echo
echo "        Uma vez concluído o processo, você pode reiniciar o computador"
echo "        sempre que necessário."
