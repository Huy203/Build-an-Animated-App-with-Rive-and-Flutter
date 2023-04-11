import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    super.key,
    required RiveAnimationController buttonAnimationController,
    required this.press,
  }) : _buttonAnimationController = buttonAnimationController;

  final RiveAnimationController _buttonAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //see now once you tap it
      //it show the animation
      /*1*/
      onTap: press,
      ///*2*/
      // onTap: () {
      //   _buttonAnimationController.isActive = true;
      // },
      child: SizedBox(
        width: 200,
        height: 100,
        child: Stack(
          children: [
            RiveAnimation.asset(
              'assets/RiveAssets/button.riv',
              controllers: [_buttonAnimationController],
            ),
            Positioned.fill(
              top: 7,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      CupertinoIcons.arrow_right,
                      color: Color.fromARGB(255, 247, 19, 201),
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text("Start the course",
                        style: TextStyle(
                          color: Color.fromARGB(255, 247, 19, 201),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
