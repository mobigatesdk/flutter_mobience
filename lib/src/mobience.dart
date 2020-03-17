import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_mobience/src/options.dart';

import 'mobience_consts.dart';

class MobienceSDK {
  MobienceOptions options;
  final MethodChannel _channel;
  static MobienceSDK _instance;

  factory MobienceSDK(MobienceOptions options) {
    if (_instance == null) {
      MethodChannel channel = const MethodChannel('flutter_mobience');
      _instance = MobienceSDK._internal(channel, options);
    }
    return _instance;
  }

  MobienceSDK._internal(this._channel, this.options);

  Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<String> get init async {
    final String initResult = await _channel.invokeMethod('init', {
      "apiKey": options.apiKey,
      "appIdentifier": options.appIdentifier,
      "appInstallationSource": options.appInstallationSource,
      // "email": options.email,
      "customUserAgent": options.customUserAgent,
      "cusUserId": options.cusUserId,
      "userFields": options.userFields != null
          ? _convertEnumListToStringList(options.userFields)
          : null,
      "monitorState":
          options.monitorState != null ? options.monitorState.name : null,
      "notificationText": options.notificationText,
      "iDsProfiles": options.iDsProfiles
    });

    return initResult;
  }

  Future<String> get startSdk async {
    final String startResult = await _channel.invokeMethod('startsdk');
    return startResult;
  }

  void setCollectAll() {
    _channel.invokeMethod('setCollectAll');
  }

  void configureDataCollectors(bool enable, List<int> collectors) {
    _channel.invokeMethod('configureDataCollectors',
        {"enable": enable, "collectors": collectors});
  }

  void disableAllDataCollector() {
    _channel.invokeMethod('disableAllDataCollector');
  }

  void setEmail(String email) {
    _channel.invokeMethod('setEmail', {"email": email});
  }

  Future<String> getEmail() async {
    final String email = await _channel.invokeMethod('getEmail');
    return email;
  }

  void setFbToken(String token) {
    _channel.invokeMethod('setFbToken', {"fbtoken": token});
  }

  Future<String> getSDKInfo() async {
    final String sdkInfo = await _channel.invokeMethod('getSDKInfo');
    return sdkInfo;
  }

  Future<String> getSDKUniqueIdentifier() async {
    final String sdkUniqueIdentifier =
        await _channel.invokeMethod('getSDKUniqueIdentifier');
    return sdkUniqueIdentifier;
  }

  Future<List<int>> getIDsProfiles() async {
    var ints =
        new List<int>.from(await _channel.invokeMethod('getIDsProfiles'));
    return ints;
  }

   Future<Map<String,int>> getAdOceanTargeting() async {
    var maps = new Map<String,int>.from(await _channel.invokeMethod('getAdOceanTargeting'));

   // print(maps.toString());
    return maps;
  }

  List<String> _convertEnumListToStringList(List list) {
    List<String> resultList = [];
    if (list is List<MonitorState>) {
      for (var monitorState in list) {
        resultList.add(monitorState.name);
      }
    } else if (list is List<UserField>) {
      for (var userField in list) {
        resultList.add(userField.name);
      }
    }
    return resultList;
  }
}
