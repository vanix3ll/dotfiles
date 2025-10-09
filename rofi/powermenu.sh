#!/bin/sh

options="  Shutdown\n  Reboot\n󰍃  Logout\n󰤄  Sleep"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    "  Shutdown") systemctl poweroff ;;
    "  Reboot") systemctl reboot ;;
    "󰤄  Sleep") systemctl suspend ;;
    "󰍃  Logout") swaymsg exit ;;
esac
