

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ToastHelper {





  static Widget progressWidget(GlobalKey progressKey) {
    return Container(
        height: 56,
        child: Center(
          child: CircularProgressIndicator(
            key: progressKey,
          ),
        ));
  }









  static void toastSuccess(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.green, textColor: Colors.white);
  }

  static void toastInfo(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.blue, textColor: Colors.white, );
  }

  static void toastError(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.red, textColor: Colors.white);
  }





}
