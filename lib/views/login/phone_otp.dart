import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zartek/core/color/color.dart';
import 'package:zartek/core/constant/constant.dart';
import 'package:zartek/services/otp_auth_services.dart';
import 'package:zartek/views/login/otp_screen.dart';
import 'package:zartek/views/login/widget/button_widget.dart';
import 'package:zartek/views/login/widget/textform_widget.dart';

Auth a = Auth();

TextEditingController mobileController = TextEditingController();

class MobileLoginPage extends StatelessWidget {
  MobileLoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 250, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    "Register",
                    style: loginRegister,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Add your phone number.\n We'll send you a verification code",
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormFieldWidget(
                        lableText: 'Mobile',
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile';
                          } else if (value.length != 10) {
                            return 'Enter a valid mobile.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  ButtonWidget(
                    label: 'Send OTP',
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) return;
                      sendOtp();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => CheckLoginOtp(
                            mobile: '+91${mobileController.text.trim()}'),
                      ));
                    },
                    buttonColor: buttongreen,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 12,
                            color: white,
                            decoration: TextDecoration.none),
                        children: [
                          TextSpan(
                            text: "By continuing, you agree to our ",
                            style: textStyle,
                          ),
                          TextSpan(
                            text: "User Agreement",
                            style: userTextStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                log('User Agreement');
                              },
                          ),
                          TextSpan(
                            text: "\nand ",
                            style: textStyle,
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: userTextStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                log('Privacy Policy');
                              },
                          ),
                          const TextSpan(
                            text: ".",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  sendOtp() async {
    await a.sendOTP('+91${mobileController.text.trim()}');
  }
}
