import 'package:flutter/material.dart';
import 'package:zartek/core/constant/constant.dart';
import 'package:zartek/views/login/widget/phone_sigin_btn.dart';
import 'package:zartek/views/login/widget/signin_button.dart';
import 'package:zartek/views/login/widget/signin_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SignInText(title: 'Sign In'),
          kHeight170,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                googleSignUpBtn(context),
                phoneSignUpBtn(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
