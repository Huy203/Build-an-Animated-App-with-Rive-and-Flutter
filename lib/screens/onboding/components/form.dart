import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email",
            style: TextStyle(
              color: Colors.black54,
            )),
        Padding(
          padding: const EdgeInsets.only(top:6.0, bottom:12,left: 6),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SvgPicture.asset('assets/icons/email.svg'))),
          ),
        ),
        const Text("Password",
            style: TextStyle(
              color: Colors.black54,
            )),
        Padding(
          padding: const EdgeInsets.only(top:6.0, bottom:12,left: 6),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SvgPicture.asset('assets/icons/password.svg'))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:6.0, bottom:12),
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 241, 124, 163),
                minimumSize: const Size(double.infinity, 40),
                shape:const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(7),
        
                ))),
            icon: const Icon(Icons.arrow_forward_rounded,size: 25),
            label: const Text('Sign In',style: TextStyle(fontSize: 15)),
          ),
        )
      ],
    ));
  }
}
