
import 'package:customer_registration/database/DBHelper.dart';
import 'package:customer_registration/screens/app_entrance.dart';
import 'package:customer_registration/utils/writeToSdCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
// during plugin initialization), then you need to explicitly call the `WidgetsFlutterBinding.ensureInitialized()
  WidgetsFlutterBinding.ensureInitialized();

 // requestStoragePermissions();



  runApp(CustomerHome());
}


class CustomerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DBHelper())],
        child:AppEntrance()

    );
  }
}