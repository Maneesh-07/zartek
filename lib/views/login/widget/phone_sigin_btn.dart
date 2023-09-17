import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zartek/core/color/color.dart';
import 'package:zartek/views/login/phone_otp.dart';

Widget phoneSignUpBtn(context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttongreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: teal, width: 1),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MobileLoginPage(),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // kWidth,
            Image.asset(
              'assets/images/icons8-phone-50.png',
              height: 30,
            ),
            Text(
              'Sign In with Phone',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 26, color: white),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
