
import 'package:customer_registration/screens/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';



class AppEntrance extends StatefulWidget {

  @override
  _AppEntrance createState() => _AppEntrance();
}

class _AppEntrance extends State<AppEntrance>{


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



