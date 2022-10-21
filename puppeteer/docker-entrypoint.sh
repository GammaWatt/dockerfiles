#!/bin/sh

if [[ ! -e /etc/ssl/novnc.pem ]]
then 
    printf "$COUNTRY\n$REGION\n$CITY\n$COMPANY\n$DEPARTMENT\n$FQDN\n$ADM_EMAIL\n" | openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/novnc.pem -out /etc/ssl/novnc.pem
    chmod 644 /etc/ssl/novnc.pem
fi

printf "$VNC_PW\n$VNC_PW\nn\n" | vncpasswd -f > /home/pptruser/.vnc/passwd
chmod 600 /home/pptruser/.vnc/passwd
chmod go-rwx /home/pptruser/.vnc
/home/pptruser/startvncserver.sh

host=`hostname`
file="$HOME/.vnc/$host$DISPLAY.pid"

while true
do 
    [ -e $file ] && echo "$file exists" && websockify -D --web=/usr/share/novnc/ --cert=/etc/ssl/novnc.pem 6080 localhost:5901 && break
done

if [[ $# -eq 0 ]]; then
    tail -F /home/pptruser/.vnc/*.log
else
    tail -F /home/pptruser/.vnc/*.log &
    $@
    sleep infinity
fi

# supervisord
# startvncserver.sh
# host=`hostname`
# file="$HOME/.vnc/$host:1.pid"

# count=0
# while [ $count -lt 4 ]
# do
#     count=$[$count+1]
#     while true
#     do 
#         [ -e $file ] && echo "$file exists" && vncserver -kill :1 && break
#     done
#     startvncserver.sh
# done

# export DISPLAY=:1