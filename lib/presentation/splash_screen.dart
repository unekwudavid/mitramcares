import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mitramcares/presentation/homeScreen/homeScreen.dart';
import 'package:mitramcares/widgets/image_animation.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    moveOn();
    
  }

  Future<void> moveOn() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.to(()=> const Homescreen());

  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageAnimation(
                  child: Image.asset(
                    "assets/images/image.jpg",
                    height: height / 5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Chronicling America...',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
