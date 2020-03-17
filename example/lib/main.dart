import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_mobience/flutter_mobience.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _libraryresult = 'Unknown';
  MobienceSDK mobienceInstance = MobienceSDK(MobienceOptions(
      "V0K6jhiIfem6CRWHYZ59Nmj3oFBBKbJsnSsWfR2JNq7ktblOUXwbJoBQTpWnw2uSwW76gpiu2kun50jweTY69B",
      userFields: [UserField.EMAIL, UserField.IMEI],
      monitorState: MonitorState.DEFAULT,
      notificationText: 'lalalalal',
      appIdentifier: "appidenti",
      appInstallationSource: "someSource",
      email: "email@gmail.com",
      customUserAgent: "useragentspecial",
      cusUserId: "simplecusId",
      iDsProfiles: false));

  @override
  void initState() {
    super.initState();
  }

/*  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await mobienceInstance.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }*/

  Future<void> initLibrary() async {
    String libraryResult;
    String startResult;
    String email;
    String sdkInfo;
    String sdkUnique;
    List<int> idsProfiles;
    Map<String,int> adocean;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      libraryResult = await mobienceInstance.init;
      if(libraryResult == 'success') {
        mobienceInstance.configureDataCollectors(true, [DataCollector.APPS_LIST, DataCollector.APPS_USAGE, DataCollector.BROWSER]);
        mobienceInstance.disableAllDataCollector();
        startResult = await mobienceInstance.startSdk;
        mobienceInstance.setEmail("lalala@gmail.com");
        mobienceInstance.setFbToken("asdsfdsfdsfsdf");
       adocean = await mobienceInstance.getAdOceanTargeting();
    /*    sdkUnique = await mobienceInstance.getSDKUniqueIdentifier();
        email = await mobienceInstance.getEmail();
        sdkInfo = await mobienceInstance.getSDKInfo();*/
        idsProfiles = await mobienceInstance.getIDsProfiles();

       /* print('start result: ' + startResult);
        print('this is set email: '+email);
        print('sdk info '+sdkInfo);
        print('sdk unique identifier '+sdkUnique);
        print('idsprofiles '+idsProfiles.toString());*/

      //  var ints = new List<int>.from(idsProfiles);
        print('adoceannnnnnnn  '+adocean.toString());
      }
    } on PlatformException {
      libraryResult = 'Failed to start library';
    }



    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _libraryresult = startResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Library start: $_libraryresult\n'),
            FlatButton(
              onPressed: () {
                initLibrary();
              },
              child: Text(
                "Flat Button",
              ),
            )
          ],
        ), /*Center(
          child: Text('Running on: $_platformVersion\n'),
        ),*/
      ),
    );
  }
}
