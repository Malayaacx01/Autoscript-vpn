#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
COLOR1="\033[0;31m" 
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/kanghory/Autoscript-vpn/main/izin > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/kanghory/Autoscript-vpn/main/izin | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."



  
function addvless(){
domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '1' ]]; do
  echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
  echo -e "$COLOR1│${NC}             • CREATE VLESS USER •              ${NC} $COLOR1│$NC"
  echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
  echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
  
  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[0;41;36m             VLESS ACCOUNT           \E[0m"
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
  fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"

systemctl restart xray
systemctl restart nginx

DATADB=$(cat /root/akun/vless/.vless.conf | grep "^#&" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /root/akun/vless/.vless.conf
fi
echo "#& ${user} ${exp} ${uuid}" >>/root/akun/vless/.vless.conf

clear
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "    Xray/Vless Account     \E[0m" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "Remarks     : ${user}" | tee -a /root/akun/vless/$user.txt
echo -e "Domain      : ${domain}" | tee -a /root/akun/vless/$user.txt
echo -e "port TLS    : 443" | tee -a /root/akun/vless/$user.txt
echo -e "Port DNS    : 443" | tee -a /root/akun/vless/$user.txt
echo -e "Port NTLS   : 80" | tee -a /root/akun/vless/$user.txt
echo -e "User ID     : ${uuid}" | tee -a /root/akun/vless/$user.txt
echo -e "Encryption  : none" | tee -a /root/akun/vless/$user.txt
echo -e "Path TLS    : /vless " | tee -a /root/akun/vless/$user.txt
echo -e "ServiceName : vless-grpc" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "Link TLS    : ${vlesslink1}" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "Link NTLS   : ${vlesslink2}" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "Link GRPC   : ${vlesslink3}" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "Expired On : $exp" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}             • Malayaacx01 - VPN •             $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""

echo -e "" | tee -a /root/akun/vless/$user.txt
read -n 1 -s -r -p "Press any key to back on menu"

menu-vless
}


clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • VLESS PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│$NC   ${COLOR1}[01]${NC} • ADD VLESS      ${COLOR1}[03]${NC} • DELETE VLESS${NC}   $COLOR1│$NC"
echo -e " $COLOR1│$NC   ${COLOR1}[02]${NC} • RENEW VLESS${NC}    ${COLOR1}[04]${NC} • USER ONLINE    $COLOR1│$NC"
echo -e " $COLOR1│$NC                                              ${NC} $COLOR1│$NC"
echo -e " $COLOR1│$NC   ${COLOR1}[00]${NC} • GO BACK${NC}                              $COLOR1│$NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              •  Malayaacx01 - VPN  •             $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
01 | 1) clear ; addvless ;;
02 | 2) clear ; renewvless ;;
03 | 3) clear ; delvless ;;
04 | 4) clear ; cekvless ;;
00 | 0) clear ; menu ;;
*) clear ; menu-vless ;;
esac

