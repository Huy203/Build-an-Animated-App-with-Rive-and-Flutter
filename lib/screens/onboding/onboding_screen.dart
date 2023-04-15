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
  bool isStart = false;
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
          AnimatedPositioned(
            top: !isStart ? 0 : -50,
            duration: Duration(milliseconds: 500),
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  width: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 1),
                      const Text("Learn design & code",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            fontFamily: "Poppins",
                            wordSpacing: 2,
                          )),
                      const Text(
                          "Don't skip design because design help you a lot in making the real app !!! \nLearning design and code of Flutter Animated",
                          style: TextStyle(wordSpacing: 1, height: 1.2)),
                      const Spacer(
                        flex: 3,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 70),
                        child: AnimatedButton(
                          buttonAnimationController: _buttonAnimationController,
                          press: () {
                            setState(() {
                              isStart = true;
                            });
                            _buttonAnimationController.isActive = true;
                            //Period is delayed before showing dialog
                            Future.delayed(
                              const Duration(
                                milliseconds: 500,
                              ),
                              () {
                                showGeneralDialog(
                                  //When click outside of dialog -> dialog disappear.
                                  barrierDismissible: true,
                                  barrierLabel: "Sign In",
                                  //the part that show transition (slide animation ...) of dialog
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  // Sign "_" or "__": point to useless
                                  transitionBuilder: (__, animation, _, child) {
                                    Tween<Offset> tween;
                                    tween = Tween(
                                        //Offset(horizontal, vertical) -> -1: left to right (or/and) top to bottom
                                        begin: const Offset(0, -1),
                                        end: Offset.zero);
                                    return SlideTransition(
                                      position: tween.animate(
                                        CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeInOut),
                                      ),
                                      child: child,
                                    );
                                  },
                                  context: context,
                                  pageBuilder: (context, _, __) => Center(
                                    child: Container(
                                      height: 600,
                                      margin: const EdgeInsets.symmetric(
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
                                        body: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Column(
                                              children: const [
                                                Text(
                                                  "Sign In",
                                                  style: TextStyle(
                                                      fontSize: 34,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Poppins"),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 20.0,
                                                      horizontal: 10),
                                                  child: Text(
                                                    "Access to 240 lessons about Flutter Tutorial from Flutter Way channel in Youtube to become a Flutter professor.",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SignInForm(),
                                              ],
                                            ),
                                            const Positioned(
                                              left: 0,
                                              right: 0,
                                              bottom: -30,
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ).then((_) {
                                  setState(() {
                                    isStart = false;
                                  });
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const Text(
                        "Made by Đỗ Huy -HCMUS 15/04/2023",
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
