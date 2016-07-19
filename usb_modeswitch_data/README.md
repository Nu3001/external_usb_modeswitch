## CarPad data (bonovo)

On the CarPad, a kludge has been added to the `vold` daemon to invoke `usb_modeswitch`. Whenever a USB device is enumerated:
1. `vold` checks whether a file named `/etc/usb_modeswitch.d/<vid>_<pid>` exists (where `<vid>` and `<pid>` are the devices vendor and product IDs specifically).
2. If yes, then it invokes `/system/bin/usb_modeswitch.sh` with that file as argument (which simply calls `usb_modeswitch -c`).
3. `usb_modeswitch` requires a VID and PID to be provided, otherwise it does nothing.  Since the above script does not pass `-v` and `-p` arguments, the configuration file must have `DefaultVendor` and `DefaultProduct` fields.

The `generate.py` script does precisely this editing of the configuration files, adding `DefaultVendor` and `DefaultProduct` in each file, based on it's name.  The script *also* updates both `../usb_modeswitch.mk` and `Android.mk` makefiles, making sure all data files will be included in the build.

**This script is not part of the build process; it needs to be manually invoked every time usbmodeswitch.d contents change (and it's output needs to be committed to git)**.
