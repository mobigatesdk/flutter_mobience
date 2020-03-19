# React Native Mobience SDK plugin for Android
MobienceSDK is a tool for gathering users phone data and events tracking. 

## Overview

[![Library version](https://img.shields.io/badge/pub-1.0.2-blue)](https://pub.dev/packages/flutter_mobience) [![Platforms](https://img.shields.io/badge/platforms-android-lightgrey)](https://developer.android.com/)

## Getting Started
### Initialize SDK first
```dart
MobienceSDK mobienceInstance = MobienceSDK(MobienceOptions(
      "V0K6jhiIfem6CRWHYZ59Nmj3oFBBKbJsnSsWfR2JNq7ktblOUXwbJoBQTpWnw2uSwW76gpiu2kun50jweTY69B"
  ));
String libraryInitResult = await mobienceInstance.init;
```
### Start gather data
```dart
String startResult = await mobienceInstance.startSdk;
```
## Guides
[Full installation and setup guides can be viewed here.](https://wiki.spicymobile.pl/wiki/mobigatesdk/view/Main/sdkintegration/flutterintegration/)
