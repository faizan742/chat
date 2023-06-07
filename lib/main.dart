import 'dart:async';
import 'dart:math';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:material_buttonx/materialButtonX.dart';

import 'chart_screen.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

     routes: {
       "/" :(context)=>Chart(),
     },
    );

  }
}

