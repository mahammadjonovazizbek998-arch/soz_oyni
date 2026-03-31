import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oyinlar/main.dart';

import 'claslar/HomePaj.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
