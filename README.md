# iMoUDIDChangerApp
change your device UDID within Xcode 

## Usage

1. run iMoUDIDChangerApp.app
2. type your device Original UDID ( to save it for detection )
3. type the new UDID you want to be recognized by Xcode later once you connected your device
4. click Apply ( if Xcode didn't killed after this action ) type " killall Xcode " in your terminal
5. open xcode and go to window -> Devices -> YOUR_DEVICE ( UDID CHANGED ) :)
6. now in your project go to( TARGETS -> YOURAPP -> GENERAL ) then Fix Issue under ( Team field )
7. Done ( your new UDID is now saved in your Free developer account )


## Requirements

[Opee](https://github.com/alexzielenski/Opee)

## Installation

* place `iMoUDIDChanger.bundle` to /Library/Opee/Extensions/iMoUDIDChanger.bundle

## Author

iMokhles, mokhleshussien@aol.com

## Thanks

[alexzielenski](https://github.com/alexzielenski) for [Opee](https://github.com/alexzielenski/Opee)

[Jeff Laing](https://bitbucket.org/tristero/) for [MobileDeviceAccess](https://bitbucket.org/tristero/mobiledeviceaccess)

## License

iMoUDIDChanger is available under the MIT license. See the LICENSE file for more info.
