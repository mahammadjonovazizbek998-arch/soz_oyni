import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oyinlar/animatsiyon_buldir/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(child: Container(color: Colors.green)),
                  Expanded(child: Container(color: Colors.blue,)),
                ],
              ),
            ),
            Expanded(child: Column(children: [
              Expanded(child: Container(color: Colors.red,)),
              Expanded(child: Container(color: Colors.green,)),
              Expanded(child: Container(color: Colors.blue,)),
            ],)),
          ],
        ),
      ),
    );
  }
}
