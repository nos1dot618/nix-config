#!/usr/bin/env bash

function rofi_cmd() {
    rofi -dmenu -p "$1" -lines 5 -width 30
}

function nucleus_notify() {
    notify-send "Nucleus" "$1"
}

function moonmoon_notify() {
    notify-send "MoonMoon" "$1"
}

function moonmoon_connect_device() {
    bluetooth_device=$(bluetoothctl devices | rofi_cmd "Choose device")
    if [ -z "$bluetooth_device" ]; then
        moonmoon_notify "No device selected."
        return
    fi
    bluetooth_device_mac=$(echo "$bluetooth_device" | awk '{print $2}')
    if bluetoothctl connect "$bluetooth_device_mac"; then
        moonmoon_notify "Connected to $bluetooth_device."
    else
        moonmoon_notify "Failed to connect to $bluetooth_device."
    fi
}

function moonmoon_disconnect_device() {
    bluetoothctl disconnect
    moonmoon_notify "Disconnected all devices."
}

function moonmoon_menu() {
    echo -e "Connect device\nDisconnect device" | rofi_cmd "Choose command"
}

function moonmoon_init() {
    case $(moonmoon_menu) in
        "Connect device") moonmoon_connect_device ;;
        "Disconnect device") moonmoon_disconnect_device ;;
        *) moonmoon_notify "Invalid choice or cancelled." ;;
    esac
}

options="Rofi Bluetooth\nMoonMoon Bluetooth Utility\nNetwork Manager"
choice_main=$(echo -e "$options" | rofi -dmenu -p "Settings")

case $choice_main in
    "Rofi Bluetooth") rofi-bluetooth ;;
    "MoonMoon Bluetooth Utility") moonmoon_init ;;
    "Network Manager") rofi-network-manager ;;
    *) nucleus_notify "Invalid choice or cancelled." ;;
esac
