

import 'package:flutter/material.dart';

Widget formTitle({String text,bool required = true}) {
  return Column(
    children: [
      RichText(
        text: TextSpan(
            text: text,
            children: <InlineSpan>[
              TextSpan(
                text: required ? '*': '',
                style: TextStyle(
                  color: Colors.red,
                ),
              )
            ],
            style: TextStyle(color: Colors.black)),
      ),
      const SizedBox(
        height: 4.0,
      ),
    ],
  );

}
