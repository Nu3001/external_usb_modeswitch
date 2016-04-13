# Version 2.3.0, 2016/01/12

#!/system/bin/sh
sleep 2
#/system/bin/setprop "mode_switch_running" "1"

/system/bin/usb_modeswitch -c $1

#/system/bin/setprop "mode_switch_running" "0"
