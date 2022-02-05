# BatteryNotifier
Simple bash script to notify the system user to connect/disconnect the charger to extend the battery life using battery cycle concept

# How to use

1. Copy the all the files inside gspeak folder in home directly i.e script should be in gspeak folder
2. run the crontab -e
3. put the following commands as schedule

@reboot cd $HOME/gspeak && $HOME/gspeak/BatteryNotifier.sh >> $HOME/gspeak/log.txt

# This will work only for linux & Mac

Credit: https://github.com/Glutanimate/simple-google-tts
