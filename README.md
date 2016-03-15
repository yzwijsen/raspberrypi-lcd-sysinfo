# raspberrypi-lcd-sysinfo
script that cycles between showing load average, memory usage and current ip address on a raspberry pi with BitWizard SPI LCD screen

<img src="http://i.imgur.com/Reu0j3l.jpg?1" alt="lcd_cpu" width="200" height="150">
<img src="http://i.imgur.com/oHev4iZ.jpg?1" alt="lcd_mem" width="200" height="150">
<img src="http://i.imgur.com/wUUjmWW.jpg?1" alt="lcd_ip" width="200" height="150">

##What you need:
* a raspberry pi 
* an lcd screen from BitWizard with SPI board ([this one](http://www.bitwizard.nl/shop/displays/lcd-interface-16x2))
* SD card with Linux installed (preferably Raspbian but others should work)

##How To Use:

* Install **bw_tools** (see BitWizard wiki article [Here](http://www.bitwizard.nl/wiki/index.php/Beginners_guide_to_SPI_on_Raspberry_Pi) , under **installing the program** )

* download the script & make it executable
```bash
wget https://raw.githubusercontent.com/yzwijsen/raspberrypi-lcd-sysinfo/master/lcd-show-sysinfo.sh && chmod +x lcd-show-sysinfo.sh
```

* start the script
```bash
sudo ./lcd-show-sysinfo.sh &
```

That's it! You should now see output on your lcd screen. (if not, open the script and make sure the ADDRESS variable is set correctly)


##Run on startup

If you want you can set the script to start automatically on boot. The easiest way to do that is by setting up a cronjob:

* open crontab
```bash
sudo crontab -e
```

* add @reboot cronjob to start script automatically
```bash
@reboot /home/pi/lcd-show-sysinfo.sh
```

