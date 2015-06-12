all:
	@echo Use `make install` or `make uninstall`

install:
	test -n "`adb shell ls /system/b2g/b2g.orig | grep No`"
	adb shell mount -o remount,rw /system
	adb shell mv /system/b2g/b2g /system/b2g/b2g.orig
	adb push b2g /system/b2g/b2g
	adb push jx /system/b2g/jx
	adb shell mkdir -p /data/local/tmp/www/
	adb push www/* /data/local/tmp/www/
	adb shell mount -o remount,ro /system

restart:
	adb shell kill -9 `adb shell ps | grep /jx | awk '{print $$2}'`

uninstall:
	test -z "`adb shell ls /system/b2g/b2g.orig | grep No`"
	adb shell test -f /system/b2g/jx
	adb shell test -f /system/b2g/b2g.orig
	adb shell mount -o remount,rw /system
	adb shell mv /system/b2g/b2g.orig /system/b2g/b2g
	adb shell rm /system/b2g/jx
	adb shell rm -rf /data/local/tmp/www
	adb shell mount -o remount,ro /system

reboot:
	adb shell reboot

.PHONY: all install restart uninstall reboot
