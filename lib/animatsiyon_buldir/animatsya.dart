import 'dart:math';

import 'package:flutter/material.dart';

class Animatsya1 extends StatefulWidget {
  const Animatsya1({super.key});

  @override
  State<Animatsya1> createState() => _AnimatsyaState();
}

class _AnimatsyaState extends State<Animatsya1> {
  Alignment alignment = Alignment.centerRight;
  Alignment alignment1 = Alignment.bottomLeft;
  Alignment alignment2 = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            alignment = (alignment == Alignment.centerRight)
                ? Alignment.bottomLeft
                : Alignment.centerRight;
            alignment=(alignment==Alignment.centerRight)?Alignment.bottomLeft:Alignment.bottomRight;
            alignment=(alignment==Alignment.bottomLeft)?Alignment.centerRight:Alignment.center;

            alignment1 = (alignment1 == Alignment.bottomLeft)
                ? Alignment.topLeft
                : Alignment.bottomLeft;
            alignment2 = (alignment2 == Alignment.topRight)
                ? Alignment.centerLeft
                : Alignment.topRight;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Stack(
        children: [
          AnimatedAlign(
            onEnd: () {
              setState(() {alignment=(alignment==Alignment.centerRight)?Alignment.bottomLeft:Alignment.bottomRight;
              });
            },
            alignment: alignment,
            duration: Duration(seconds: 3),
            child: Container(width: 100, height: 100, color: Colors.black),
          ),
          AnimatedAlign(
            onEnd: () {
              setState(() {
                alignment1 = (alignment1 == Alignment.bottomLeft)
                    ? Alignment.topLeft
                    : Alignment.bottomLeft;
              });
            },
            alignment: alignment1,
            duration: Duration(seconds: 3),
            child: Container(width: 100, height: 100, color: Colors.black),
          ),
          AnimatedAlign(
            onEnd: () {
              setState(() {
                alignment2 = (alignment2 == Alignment.topRight)
                    ? Alignment.centerLeft
                    : Alignment.topRight;
              });
            },
            alignment: alignment2,
            duration: Duration(seconds: 3),
            child: Container(width: 100, height: 100, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

/*class Animatsya1 extends StatefulWidget {
  const Animatsya1({super.key});

  @override
  State<Animatsya1> createState() => _Animatsya1State();
}

class _Animatsya1State extends State<Animatsya1> {
  double padding = 50.0;
  Alignment alignment = Alignment.topCenter;
  late double width = (alignment == Alignment.bottomCenter) ? 400 : 200;
  late double height = (alignment == Alignment.bottomCenter) ? 400 : 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //padding = (padding == 50.0) ? 100 : 50;
            alignment = (alignment == Alignment.topCenter)
                ? Alignment.bottomCenter
                : Alignment.topCenter;
            width = (alignment == Alignment.bottomCenter) ? 400 : 200;
            height = (alignment == Alignment.bottomCenter) ? 100 : 200;
          });
        },
        child: Icon(Icons.play_circle),
      ),
      body: AnimatedAlign(
        alignment: alignment,
        duration: Duration(seconds: 3),
        curve: Curves.bounceOut,
        onEnd: () {
          setState(() {
            //padding = (padding == 50.0) ? 100 : 50;
            alignment = (alignment == Alignment.topCenter)
                ? Alignment.bottomCenter
                : Alignment.topCenter;
          });
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          width: width,
          height: height,
          color: Colors.red,
          onEnd: (){
            width = (alignment == Alignment.bottomCenter) ? 200 : 400;
            height = (alignment == Alignment.bottomCenter) ? 200 : 100;


          },
        ),
      ),
      /*Center(child: AnimatedPadding(onEnd: (){setState(() {
        padding = (padding == 50.0) ? 100 : 50;
      });},
        padding: EdgeInsets.all(padding),
        duration: Duration(seconds: 3),
        child: Container(color: Colors.red),
      ),)*/
    );
  }
}
*/