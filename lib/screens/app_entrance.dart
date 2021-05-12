
import 'package:customer_registration/screens/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';



class MyApp extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MyApp>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // requestStoragePermissions();
  }
  @override
  Widget build(BuildContext context) {

    return   MaterialApp(
      //onGenerateRoute: Routers.generateRoute,
      debugShowCheckedModeBanner: false,

      home: RegistrationScreen(),
    );
  }
}



