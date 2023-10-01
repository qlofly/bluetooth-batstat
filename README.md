### Obtaining Battery Level for Bluetooth Devices Guide

My configration:
OS - EndeavourOs
WM - Sway

To check the battery level of a Bluetooth device, you can follow these steps:

1. Run the command upower --dump and locate the address of the Bluetooth device. It will be displayed in a format like /org/freedesktop/UPower/devices/headset_dev_00_00_00_00_00_00.

2. If the command does not display any Bluetooth devices, execute the following command:
   
   sudo cp /usr/lib/systemd/system/bluetooth.service /etc/systemd/system/ && sudo sed -i 's:ExecStart=/usr/lib/bluetooth/bluetoothd:ExecStart=/usr/lib/bluetooth/bluetoothd -E:g' /etc/systemd/system/bluetooth.service
   

3. Restart your system to apply the changes. After the restart, run the command upower --dump again to verify if the Bluetooth devices are now being displayed.

4. Once you can see the Bluetooth devices in the output, you can add them to a script and integrate it into the desired file.

For example, you can add the script to the waybar as a custom module. Here is an example configuration:

    "custom/btbat": {
        "icon-size": 18,
        "interval": 20,
        "format": "{}",
        "on-click": "blueman-manager",
        "exec": "bash $HOME/.config/waybar/headset.sh"
    },

Remember to replace the path bash $HOME/.config/waybar/headset.sh with the actual path to your script.
