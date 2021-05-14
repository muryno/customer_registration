//
// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/services.dart';
//
// class StorageDetails {
//
//
//   static const platform = const MethodChannel('myCardStorage');
//
//
//   static const String _getStorageDetails = 'getStorageDetails';
//   static const EventChannel _eventChannel = const EventChannel('event_channel');
//
//
//   ///GETTING PERMISSION FROM NATIVE ANDROID WITH METHOD CHANNEL
//
//   static Future<String> getPermission(String path) async {
//     final String version = await platform.invokeMethod(
//         'takeCardUriPermission', path);
//
//     return version;
//   }
//
//
//   ///GETTING sdk path url
//
//   static Future<String> getUrl(ByteData path) async {
//     final String url = await platform.invokeMethod('getUrl', path);
//
//     return url;
//   }
//
//
//
//
//
//
//
//
// }