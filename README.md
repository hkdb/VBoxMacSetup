# VBoxMacSetup v1.0
**maintained by:** hkdb \<hkdb@3df.io\><br />

### Bash script to quickly prepare your MacOS High Sierra Virtual HD with full screen resolution.

## WHAT DOES IT DO?

This script automates the following commands:

```
VBoxManage modifyvm "MacOS" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff

VBoxManage setextradata "MacOS" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"

VBoxManage setextradata "MacOS" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"

VBoxManage setextradata "MacOS" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"

VBoxManage setextradata "MacOS" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"

VBoxManage setextradata "MacOS" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1

VBoxManage setextradata "MacOS" "VBoxInternal2/EfiGraphicsResolution" "1920x1080"

```

## DEPENDENCIES

- Bash
- Virtualbox 5.x
- MacOS High Sierra Final

## TESTED ON

- Ubuntu Linux 18.04

## INSTALLATION

Nothing needs to be installed. It's just a script that runs commands for you.

## USAGE

setup.sh takes 2 arguments which is what you named your VM led by a -v flag and the desired resolution for your VM led by -r. For example, I named mine "MacOS" and my full screen resolution is 1920x1080. Therefore, this is how I run the script:

```
./setup.sh -v "MacOS" -r 1920x1080
```

## OVERALL PROCEDURE

1. Download [MacOS High Sierra 10.13.6](https://drive.google.com/drive/folders/1CttWjm0dENwIBRUXk1no6S18eOdbnVVU) - 6.8GB
2. Install VirtualBox (ie. sudo apt install virtualbox, etc)
3. Launch Virtualbox
4. Create Virtual Machine w/ existing vmdk (ie. with what you downloaded in step 1)
5. Name your VM without spaces. I read somewhere that spaces could potentially cause issues. mine is named "MacOS"
6. Configure at least 2 cores, 4GB of RAM, and 128MB of graphics with 3D acceleration on.
7. Close VirtualBox
8. In terminal, run setup.sh -v \<whatever you named your vm> -r \<desired resolution>
9. Launch VirtualBox again
10. Play MacOS VM
11. Voila!