#!/bin/bash

# Save our current (expected to be EFI) script location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo '-----------------------------------------'
echo '     !!! PLEASE RUN THIS AS SUDO !!!     '
echo '-----------------------------------------'
echo 'AppleIntelWiFi.kext Configuration Utility'
echo 'ver 0.0.1'
echo '-----------------------------------------'

echo 'Insert your network SSID:'
read INTEL_SSID

echo 'Insert your network WPA2 key:'
read INTEL_PASS

echo '-----------------------------------------'

#echo 'Unloading current Kexts...'
#sudo kextunload "$DIR/OC/Kexts/AppleIntelWiFi.kext"
#sudo kextunload "/Library/Extensions/AppleIntelWifi.kext"

#echo '-----------------------------------------'

echo 'Removing current Kexts...'
rm -rf "$DIR/OC/Kexts/AppleIntelWiFi.kext"
rm -rf "/Library/Extensions/AppleIntelWiFi.kext"

echo '-----------------------------------------'

echo 'Preparing new Kext...'
cp -r "$DIR/other/AppleIntelWiFi.kext" "$DIR/OC/Kexts/"

echo '-----------------------------------------'

echo 'Configuring new Kext...'
sudo sed -i '' "s>REPLACE_IntelWiFi_SSID>$INTEL_SSID>g" "$DIR/OC/Kexts/AppleIntelWiFi.kext/Contents/Info.plist"
sudo sed -i '' "s>REPLACE_IntelWiFi_PASS>$INTEL_PASS>g" "$DIR/OC/Kexts/AppleIntelWiFi.kext/Contents/Info.plist"

echo '-----------------------------------------'

echo 'Saving updated Kext to /Library/Extensions'
sudo cp -r "$DIR/OC/Kexts/AppleIntelWiFi.kext" "/Library/Extensions/"

#echo '-----------------------------------------'

#echo 'Loading updated Kext...'
#sudo kextload "/Library/Extensions/AppleIntelWifi.kext"

echo '-----------------------------------------'

echo 'Done. Reboot your computer to finish setup on new network.'