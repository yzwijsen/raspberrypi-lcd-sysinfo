# raspberrypi-lcd-sysinfo
script that cycles between showing load average, memory usage and current ip address on a raspberry pi with BitWizard SPI LCD screen

<img src="http://i.imgur.com/Reu0j3l.jpg?1" alt="lcd_cpu" width="200" height="150">
<img src="http://i.imgur.com/oHev4iZ.jpg?1" alt="lcd_mem" width="200" height="150">
<img src="http://i.imgur.com/wUUjmWW.jpg?1" alt="lcd_ip" width="200" height="150">

##What you need:
* a raspberry pi (only tested with rev1 model B but should work on all models that are compatible with the LCD screen below)
* an lcd screen from BitWizard with SPI board ([this one](http://www.bitwizard.nl/shop/displays/lcd-interface-16x2))
* an SD card with a linux distro installed (only tested with raspbian but should work on most distros)

##How To Use:

* make sure spi is turned on and that bw_tools is installed and working (see BitWizard wiki article [Here](http://www.bitwizard.nl/wiki/index.php/Beginners_guide_to_SPI_on_Raspberry_Pi) , under **installing the program** )

* download the shell script & make it executable
```bash
wget https://raw.githubusercontent.com/yzwijsen/raspberrypi-lcd-sysinfo/master/lcd-show-sysinfo.sh && chmod a+x lcd-show-sysinfo.sh
```

* start the script
```bash
sudo ./lcd-show-sysinfo.sh &
```

That's it! You should now see output on your lcd screen. (if not, open the script and make sure the ADDRESS variable is set correctly)


**Run on startup**

If you want you can set the script to start on boot. To do that:

* open crontab
```bash
sudo crontab -e
```

* add @reboot cronjob to start script automatically
```bash
@reboot /home/pi/lcd-show-sysinfo.sh
```

