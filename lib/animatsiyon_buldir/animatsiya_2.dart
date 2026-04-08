import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntermediateAnimationScreen(),
    );
  }
}

class IntermediateAnimationScreen extends StatefulWidget {
  const IntermediateAnimationScreen({super.key});

  @override
  State<IntermediateAnimationScreen> createState() => _IntermediateAnimationScreenState();
}

// SingleTickerProviderStateMixin - animatsiya uchun zarur bo'lgan vsync ni ta'minlaydi
class _IntermediateAnimationScreenState extends State<IntermediateAnimationScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Controller: Animatsiyaning vaqtini boshqaradi
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // Takrorlanish va ortga qaytish xususiyati

    // 2. Scale (Hajm) animatsiyasi: 0.8 dan 1.2 gacha kattalashadi
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );

    // 3. Rotate (Aylanish) animatsiyasi: 0 dan 360 darajagacha (2 * pi)
    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // 4. Color (Rang) animatsiyasi: Ko'kdan Siyohrangga o'tadi
    _colorAnimation = ColorTween(
      begin: Colors.blueAccent,
      end: Colors.deepPurple,
    ).animate(_controller);
  }

  @override
  void dispose() {
    // Xotirada joy band qilmasligi uchun controllerni o'chirish muhim!
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: _rotateAnimation.value,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: _colorAnimation.value,
                      borderRadius: BorderRadius.circular(30), // Burchaklarni yumaloqlash
                      boxShadow: [
                        BoxShadow(
                          color: _colorAnimation.value!.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 5,
                        )
                      ]
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.flutter_dash,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}