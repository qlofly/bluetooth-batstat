jbl="$(upower -i /org/freedesktop/UPower/devices/headset_dev_00_00_00_00_00_00 | grep -oP '\d+(?=%)')"
qcy="$(upower -i /org/freedesktop/UPower/devices/headset_dev_00_00_00_00_00_00 | grep -oP '\d+(?=%)')"

if [[ "${jbl}" && "${mifa}" != "0" ]]; then
  echo "󰂱 ${jbl}%"
elif [[ "${qcy}" && "${qcy}" != "0" ]]; then
  echo "󰂱 ${qcy}%"
else
  echo " 󰂲 "
fi
