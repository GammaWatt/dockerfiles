#!/bin/bash
echo "starting VNC server ..."
export USER=pptruser
vncserver $DISPLAY -geometry $VNC_RESOLUTION -depth $VNC_COL_DEPTH

# /usr/bin/expect
# spawn /usr/bin/vncserver :1
# expect {
#     -nocase "Password:" {
#         send "$env(PASSWORD)\r" 
#         expect -nocase "Verify:"
#         send "$env(VIEW_PASSWORD)\r"
#         expect -nocase "Would you like to enter a view-only password (y/n)?"
#         send "n\r"
#         send "\r"
#         exit
#     }
#     "A VNC server is already running as :1" {
#         exit
#     }
# }
# # expect eof
# # exit