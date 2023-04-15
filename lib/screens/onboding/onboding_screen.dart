import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'components/all.dart';

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
                      padding: const EdgeInsets.only(left: 70),
                      child: AnimatedButton(
                        buttonAnimationController: _buttonAnimationController,
                        press: () {
                          _buttonAnimationController.isActive = true;
                          showGeneralDialog(
                            //When click outside of dialog -> dialog disappear.
                            barrierDismissible: true,
                            barrierLabel: "Sign In",
                            context: context,
                            pageBuilder: (context, _, __) => Center(
                              child: Container(
                                height: 600,
                                margin:const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 18),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                                child: Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Column(
                                    children: [
                                      const Text(
                                        "Sign In",
                                        style: TextStyle(
                                            fontSize: 34,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins"),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                                        child: Text(
                                          "Access to 240 lessons about Flutter Tutorial from Flutter Way channel in Youtube to become a Flutter professor.",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SignInForm(),
                                      Row(
                                        children: const[
                                          Expanded(
                                            child: Divider(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Text(
                                              "Or",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 91, 87, 87),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Divider(),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 20,
                                        ),
                                        child: Text(
                                            'Sign in with Email, Apple or Google.'),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                                "assets/icons/email_box.svg",width:64, height:64,),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                                "assets/icons/apple_box.svg",width:64, height:64,),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                                "assets/icons/google_box.svg",width:64, height:64,),
                                          ),
                                        ],
                                      )
                                    
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
