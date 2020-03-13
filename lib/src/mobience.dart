import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_mobience/flutter_mobience.dart';

class FlutterMobience {
  static const MethodChannel _channel =
  const MethodChannel('flutter_mobience');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get init async {
    MobienceSDK  xxx = MobienceSDK(apiKey: "sdfsdfsdf");
    final String initResult = await _channel.invokeMethod('init');
    return initResult;
  }

  static Future<String> init2(bool smth) async {
    final String initResult = await _channel.invokeMethod('init');
    return initResult;

  }
}
