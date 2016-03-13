# iMoUDIDChangerApp
change your device UDID within Xcode 

## Requirements

* disable rootless

Turning it off

1. Reboot your Mac and hold down <code>Command + R</code> together after you hear the boot sound. This will boot you into Recovery Mode.

2. Go to the top menu bar and select the Utilities dropdown menu and open Terminal.
3. Type the following and your Mac will automatically reboot:

    ```bash
$ csrutil disable; reboot
```

4. Once rebooted open Terminal and type the following to ensure it was disabled:

    ```bash
$ csrutil status
```

5. It should say:

    ```bash
$ csrutil status
System Integrity Protection status: disabled
```

* [Opee](https://github.com/alexzielenski/Opee)

## Installation

* install Opee using <code>opeeinstaller.sh/code> which insde <code>Opee installer</code> Folder

* place `iMoUDIDChanger.bundle` to /Library/Opee/Extensions/iMoUDIDChanger.bundle



## Usage

1. run iMoUDIDChangerApp.app
2. type your device Original UDID ( to save it for detection )
3. type the new UDID you want to be recognized by Xcode later once you connected your device
4. click Apply ( if Xcode didn't killed after this action ) type " killall Xcode " in your terminal
5. open xcode and go to window -> Devices -> YOUR_DEVICE ( UDID CHANGED ) :)
6. now in your project go to( TARGETS -> YOURAPP -> GENERAL ) then Fix Issue under ( Team field )
7. Done ( your new UDID is now saved in your Free developer account )


## Author

iMokhles, mokhleshussien@aol.com

## Thanks

[alexzielenski](https://github.com/alexzielenski) for [Opee](https://github.com/alexzielenski/Opee)

[Jeff Laing](https://bitbucket.org/tristero/) for [MobileDeviceAccess](https://bitbucket.org/tristero/mobiledeviceaccess)

## License

iMoUDIDChanger is available under the MIT license. See the LICENSE file for more info.
