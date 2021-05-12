
import 'package:customer_registration/screens/app_entrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';



Future<void> main() async {

// during plugin initialization), then you need to explicitly call the `WidgetsFlutterBinding.ensureInitialized()
  WidgetsFlutterBinding.ensureInitialized();

  requestStoragePermissions();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}
void requestStoragePermissions() async {
  var status = await Permission.storage.status;
  //var status2 = await Permission.manageExternalStorage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }

  // if (!status2.isGranted) {
  //   await Permission.manageExternalStorage.request();
  // }
}