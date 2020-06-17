#!/bin/bash

atom=$(curl -u email:password --silent "https://mail.google.com/mail/feed/atom")

emailCount=$(echo "$atom" | sed 's/\(.*\)fullcount>\(.*\)<\/fullcount>\(.*\)/\2/g')


echo "$emailCount"

if [[ $? == 0 ]]; then
        if [[ $emailCount = 0 ]]; then
                :
        else
                export DISPLAY=:0
                notify-send -i /usr/share/icons/gnome/16x16/status/mail-unread.png "New E-mail" "You have $emailCount unread E-mails"
        fi
else
        :
fi
