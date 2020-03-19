import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_mobience/src/category.dart';
import 'package:flutter_mobience/src/options.dart';
import 'dart:convert';
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
    if (Platform.isAndroid) {
      final String initResult = await _channel.invokeMethod('init', {
        "apiKey": options.apiKey,
        "appIdentifier": options.appIdentifier,
        "appInstallationSource": options.appInstallationSource,
        "email": options.email,
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
    } else {
      return 'success';
    }
  }

  Future<String> get startSdk async {
    if (Platform.isAndroid) {
      final String startResult = await _channel.invokeMethod('startsdk');
      return startResult;
    } else
      return 'success';
  }

  void setCollectAll() {
    if (Platform.isAndroid) _channel.invokeMethod('setCollectAll');
  }

  void configureDataCollectors(bool enable, List<int> collectors) {
    if (Platform.isAndroid)
      _channel.invokeMethod('configureDataCollectors',
          {"enable": enable, "collectors": collectors});
  }

  void disableAllDataCollector() {
    if (Platform.isAndroid) _channel.invokeMethod('disableAllDataCollector');
  }

  void setEmail(String email) {
    if (Platform.isAndroid) _channel.invokeMethod('setEmail', {"email": email});
  }

  Future<String> getEmail() async {
    if (Platform.isAndroid) {
      final String email = await _channel.invokeMethod('getEmail');
      return email;
    } else
      return '';
  }

  void setFbToken(String token) {
    if (Platform.isAndroid)
      _channel.invokeMethod('setFbToken', {"fbtoken": token});
  }

  Future<String> getSDKInfo() async {
    if (Platform.isAndroid) {
      final String sdkInfo = await _channel.invokeMethod('getSDKInfo');
      return sdkInfo;
    } else
      return '';
  }

  Future<String> getSDKUniqueIdentifier() async {
    if (Platform.isAndroid) {
      final String sdkUniqueIdentifier =
          await _channel.invokeMethod('getSDKUniqueIdentifier');
      return sdkUniqueIdentifier;
    } else
      return '';
  }

  Future<List<int>> getIDsProfiles() async {
    if (Platform.isAndroid) {
      var ints =
          new List<int>.from(await _channel.invokeMethod('getIDsProfiles'));
      return ints;
    } else
      return [];
  }

  Future<Map<String, int>> getAdOceanTargeting() async {
    if (Platform.isAndroid) {
      var maps = new Map<String, int>.from(
          await _channel.invokeMethod('getAdOceanTargeting'));
      return maps;
    } else
      return {};
  }

  void trackAppInstall(int timestamp) {
    if (Platform.isAndroid)
      _channel.invokeMethod('trackAppInstall', {"timestamp": timestamp});
  }

  void trackEvent(Category category) {
    if (Platform.isAndroid)
      _channel.invokeMethod('trackEvent', {"event": jsonEncode(category)});
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
