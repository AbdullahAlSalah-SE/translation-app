import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Translate/texttranslate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool selected = false;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    settimer2();
    settimer();
  }

  settimer2() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, settrue);
  }

  settrue() {
    setState(() {
      selected = true;
      visible = true;
    });
  }

  settimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, secondpage);
  }

  secondpage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const TextTranslate()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: AnimatedContainer(
          width: selected ? 300.0 : 150.0,
          height: selected ? 300.0 : 150.0,
          curve: Curves.easeIn,
          duration: const Duration(seconds: 1),
          alignment: Alignment.center,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/logo.png"))),
          ),
        ),
      ),
    );
  }
}
