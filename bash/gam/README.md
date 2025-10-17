# GAM scripts
Scripts for GAM - https://github.com/GAM-team/GAM


## cb-lookup.sh & cb-lookup-user.sh
These are used to make a quick lookup of a ChromeOS device or what devices the user is a recent user of.
```
$ ./cb-lookup-user.sh user@domain.tld  
serialNumber: XXYYZZXYZ  
serialNumber: XXYYZZXXYYZZXYZ
```

You can then use `cb-lookup.sh` to find out more information about the device.
```
$ ./cb-lookup.sh XXYYZZXYZ  
CrOS Device: x2737y89-5z29-41dx-95y1-zx686y00zx88  
  orgUnitId: id:03kinqq12nf02u1  
  orgUnitPath: /Some/OU  
  annotatedAssetId:  
  annotatedLocation: XYZ  
  annotatedUser: user@domain.tld  
  lastSync: 2021-11-24T12:18:17Z  
  notes:  
  serialNumber: XXYYZZXYZ  
  status: ACTIVE  
  chromeOsType: chromeOs  
  deviceLicenseType: educationUpgradePerpetual  
  model: Dell Chromebook 13 (7310)  
  firmwareVersion: Google_Lulu.6301.136.57  
  platformVersion: 13904.97.0 (Official Build) stable-channel lulu  
  osVersion: 91.0.4472.167  
  bootMode: Verified  
  macAddress: 5X91ZZb5YZ7X  
  systemRamTotal: 4063973376  
  firstEnrollmentTime: 2016-06-10T07:56:07Z  
  lastEnrollmentTime: 2016-06-10T07:56:49Z  
  autoUpdateExpiration: 2021-06-01  
  autoUpdateThrough: 2021-06-01  
```
