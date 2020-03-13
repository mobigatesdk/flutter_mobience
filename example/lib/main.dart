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

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      platformVersion = await FlutterMobience.platformVersion;
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
  }

  Future<void> initLibrary() async {
    String libraryResult;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      libraryResult = await FlutterMobience.init;
    } on PlatformException {
      libraryResult = 'Failed to start library';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _libraryresult = libraryResult;
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
            Text('Running on: $_platformVersion\n'),
            Text('Library: $_libraryresult\n'),
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
