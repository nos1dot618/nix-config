#!/usr/bin/env bash

options="Bluetooth\nNetwork Manager"

choice=$(echo -e "$options" | rofi -dmenu -p "Settings")

case "$choice" in
    Bluetooth)
        rofi-bluetooth
        ;;
    "Network Manager")
        rofi-network-manager
        ;;
    *)
        ;;
esac
