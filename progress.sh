#!/bin/bash

# Requires ideviceinfo (libimobiledevice), curl

device_info=$(ideviceinfo -s)
if [[ "$device_info" == ERROR* ]]; then
	echo "Failed to find device"
	exit 0
fi

device_name=$(echo "$device_info" | grep DeviceName | sed 's/DeviceName: //g')
product_type=$(echo "$device_info" | grep ProductType | sed 's/ProductType: //g')
product_version=$(echo "$device_info" | grep ProductVersion | sed 's/ProductVersion: //g')
build_version=$(echo "$device_info" | grep BuildVersion | sed 's/BuildVersion: //g')

echo -e 

echo "Device name:     $device_name"
echo "Product type:    $product_type"
echo "Product version: $product_version"
echo "Build version:   $build_version"
echo "iPSW path: ~/Library/iTunes/iPhone\ Software\ Updates"
echo -e 

filesize=$(curl -H "Accept:application/json" "https://api.ipsw.me/v2.1/${product_type//ProductType: }/${build_version//BuildVersion: }/filesize" 2>/dev/null) 



sp="/-\|"
sc=0
spin() {
   printf "\b${sp:sc++:1} "
   ((sc==${#sp})) && sc=0
} 
endspin() {
   printf "\r%s\n" "$@"
}


tput sc
while sleep 0.1s; do
    tput rc
    tput ed
    spin
    printf $(ls -lhrt ~/Library/iTunes/iPhone\ Software\ Updates | awk '{print $5}')
    printf " / "
    printf $filesize | awk '{$1=$1/(1024^2); print $1,"GB";}' 
done
endspin

