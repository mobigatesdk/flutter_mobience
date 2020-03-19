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
  String _libraryResult = 'not started';
  MobienceSDK mobienceInstance = MobienceSDK(MobienceOptions(
      "V0K6jhiIfem6CRWHYZ59Nmj3oFBBKbJsnSsWfR2JNq7ktblOUXwbJoBQTpWnw2uSwW76gpiu2kun50jweTY69B"
      /*,custom options, check docs for more details
      userFields: [UserField.EMAIL, UserField.IMEI],
      monitorState: MonitorState.DEFAULT,
      notificationText: 'Service is alive!',
      appIdentifier: "customAppIdentifier",
      appInstallationSource: "customSource",
      email: "email@spicymobile.pl",
      customUserAgent: "customUserAgent",
      cusUserId: "cusUserId",
      iDsProfiles: false*/
      ));

  @override
  void initState() {
    super.initState();
  }

  Future<void> initLibrary() async {
    String libraryInitResult;
    String startResult;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      libraryInitResult = await mobienceInstance.init;
      if (libraryInitResult == 'success') {
        /*You can configure custom collectors after init
        mobienceInstance.configureDataCollectors(true, [
          DataCollector.APPS_LIST,
          DataCollector.APPS_USAGE,
          DataCollector.BROWSER
        ]);*/
        startResult = await mobienceInstance.startSdk;
      }
    } on PlatformException {
      libraryInitResult = 'Failed to start library';
    }

    if (!mounted) return;
    setState(() {
      _libraryResult = startResult;
    });
  }

  void trackEvent() {
    mobienceInstance.trackEvent((CategoryBuilder(EventCategory.BEGIN_TRIAL)
          ..setParameter(EventParameter.CITY, "Warsaw")
          ..setParameter(EventParameter.CONTENT_ID, 523456)
          ..setParameter(EventParameter.COUPON_CODE, 97636572)
          ..setParameter(EventParameter.CUSTOMER_SEGMENT, [1, 2, 4]))
        .build());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MobienceSDK flutter plugin'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Library status: $_libraryResult\n'),
              RaisedButton(
                onPressed: () {
                  initLibrary();
                },
                child: Text(
                  "Start Library",
                ),
              ),
              RaisedButton(
                onPressed: () {
                  trackEvent();
                },
                child: Text(
                  "Track Event",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
