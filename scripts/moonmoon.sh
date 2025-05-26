#!/usr/bin/env bash

rofi_cmd() {
    rofi -dmenu -p "$1" -lines 5 -width 30
}

notify() {
    notify-send "MoonMoon" "$1"
}

connect_device() {
    bluetooth_device=$(bluetoothctl devices | rofi_cmd "Choose device")
    if [ -z "$bluetooth_device" ]; then
        notify "No device selected."
        return
    fi
    bluetooth_device_mac=$(echo "$bluetooth_device" | awk '{print $2}')
    if bluetoothctl connect "$bluetooth_device_mac"; then
        notify "Connected to $bluetooth_device."
    else
        notify "Failed to connect to $bluetooth_device."
    fi
}

disconnect_device() {
    bluetoothctl disconnect
    notify "Disconnected all devices."
}

main_menu() {
    echo -e "Connect device\nDisconnect device" | rofi_cmd "Choose command"
}

choice=$(main_menu)
case "$choice" in
    "Connect device") connect_device ;;
    "Disconnect device") disconnect_device ;;
    *) notify "Invalid choice or cancelled." ;;
esac
