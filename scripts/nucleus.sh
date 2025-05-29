#!/usr/bin/env bash

function rofi_cmd() {
    rofi -dmenu -p "$1" -lines 5 -width 30
}

function notify() {
    notify-send "Nucleus" "$1"
}

function moonmoon_connect_device() {
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

function moonmoon_disconnect_device() {
    bluetoothctl disconnect
    notify "Disconnected all devices."
}

function moonmoon_menu() {
    echo -e "Connect device\nDisconnect device" | rofi_cmd "Choose command"
}

function moonmoon_init() {
    case $(moonmoon_menu) in
        "Connect device") moonmoon_connect_device ;;
        "Disconnect device") moonmoon_disconnect_device ;;
        *) notify "Invalid choice or cancelled." ;;
    esac
}

function power_utils_menu() {
    echo -e "Logout\nReboot" | rofi_cmd "Choose command"
}

function power_utils_init() {
    case $(power_utils_menu) in
        "Logout") pkill -u $USER ;;
        "Reboot")
            password=$(rofi_cmd "Enter password")
            if [ -z $password ]; then
                notify "Cancelled reboot."
                return
            fi
            echo $password | sudo -S reboot || notify "Incorrect password or failed to reboot."
            ;;
        *) notify "Invalid choice or cancelled." ;;
    esac
}

options="Rofi Bluetooth\nMoonMoon Bluetooth Utility\nNetwork Manager\nPower Utils"
choice_main=$(echo -e "$options" | rofi -dmenu -p "Settings")

case $choice_main in
    "Rofi Bluetooth") rofi-bluetooth ;;
    "MoonMoon Bluetooth Utility") moonmoon_init ;;
    "Network Manager") rofi-network-manager ;;
    "Power Utils") power_utils_init ;;
    *) notify "Invalid choice or cancelled." ;;
esac
