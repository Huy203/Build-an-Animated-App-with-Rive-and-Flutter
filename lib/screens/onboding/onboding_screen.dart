import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'components/button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _buttonAnimationController;
  @override
  void initState() {
    _buttonAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //add asset background
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),

          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox(),
          )),

          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            child: const SizedBox(),
          )),

          //add Text
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              width: 260,
              child: Column(
                children: [
                  const Text("Learn design & code",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontFamily: "Poppins",
                      )),
                  const Text(
                    "Don't skip design because design help you a lot in making the real app !!! \nLearning design and code of Flutter Animated",
                  ),
                  Container(
                    padding: const EdgeInsets.only(left:70),
                    child: AnimatedButton(
                        buttonAnimationController: _buttonAnimationController,
                        press: () {
                          _buttonAnimationController.isActive = true;
                        }),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
