#!/bin/bash

#####################################
#                                   #
#           VBoxMacSetup            #
#               v1.0                #
#                                   #
# Maintianed by; hkdb <hkdb@3df.io> #
#                                   #
#####################################

POSITIONAL=()

if [ "$#" -le 3 ] && [ "$1" != "-h" ]; then
    echo -e '\nSomething is missing... Type "./setup -h" without the quotes to find out more...\n'
    exit 0
fi

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -v|--vm)
    VM="$2"
    shift # past argument
    shift # past value
    ;;
    -r|--resolution)
    RES="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--help)
    echo -e "\nVBoxMacSetup v1.0\n\nOPTIONS:\n\n-v, --vm: Virtual Machine Name\n-r, --resolution: VM Resolution\n-h, --help: Help\n\nEXAMPLE:\n\n./setup.sh -v MacOS -r 1920x1080\n"
    exit 0
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

VBoxManage modifyvm "${VM}" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "${VM}" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "${VM}" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "${VM}" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "${VM}" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "${VM}" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
VBoxManage setextradata "${VM}" "VBoxInternal2/EfiGraphicsResolution" "$RES"
