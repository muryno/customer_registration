
import 'package:customer_registration/screens/app_entrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



Future<void> main() async {

// during plugin initialization), then you need to explicitly call the `WidgetsFlutterBinding.ensureInitialized()
  WidgetsFlutterBinding.ensureInitialized();

  // Setup orientation
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

