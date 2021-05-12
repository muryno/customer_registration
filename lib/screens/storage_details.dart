
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class StorageDetails {



  static const platform = const MethodChannel('myCardStorage');



  static const String _getStorageDetails = 'getStorageDetails';
  static const EventChannel _eventChannel = const EventChannel('event_channel');






  static Future<String>  getPermission(String path) async {
    final String version = await platform.invokeMethod('takeCardUriPermission',path);

    return version;
  }






}