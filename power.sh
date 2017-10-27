echo '1' > '/sys/module/snd_hda_intel/parameters/power_save';
echo '0' > '/proc/sys/kernel/nmi_watchdog';
echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs';
echo 'min_power' > '/sys/class/scsi_host/host0/link_power_management_policy';
echo 'min_power' > '/sys/class/scsi_host/host1/link_power_management_policy';
echo 'auto' > '/sys/bus/usb/devices/1-3/power/control';
echo 'auto' > '/sys/bus/usb/devices/1-4/power/control';
echo 'auto' > '/sys/bus/i2c/devices/i2c-0/device/power/control';
echo 'auto' > '/sys/bus/i2c/devices/i2c-1/device/power/control';
echo 'auto' > '/sys/bus/i2c/devices/i2c-2/device/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:00.0/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:02.0/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:04.0/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:14.2/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:14.0/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:16.0/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:17.0/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:1c.0/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:1c.4/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:1c.5/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.0/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.2/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.3/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.4/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:02:00.0/power/control';
echo 'auto' > '/sys/bus/pci/devices/0000:03:00.0/power/control';
ethtool -s enp2s0 wol d;
/usr/sbin/hciconfig hci0 up &> /dev/null &
echo 'auto' > '/sys/bus/usb/devices/usb1/power/control';
echo 'auto' > '/sys/bus/usb/devices/usb2/power/control';
echo 'auto' > '/sys/bus/usb/devices/1-5/power/control';
echo 'auto' > '/sys/bus/i2c/devices/i2c-4/device/power/control';
echo SATA_ALPM_ENABLE=true | sudo tee /etc/pm/config.d/sata_alpm
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_blink_mode off
gsettings set org.gnome.desktop.interface cursor-blink false
echo 'auto' > '/sys/bus/pci/devices/0000:01:00.0/power/control';
