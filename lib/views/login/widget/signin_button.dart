
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zartek/controller/provider/google_btn_provider.dart';
import 'package:zartek/core/color/color.dart';


Widget googleSignUpBtn(context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: teal, width: 1),
            ),
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin(context);
            
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // kWidth,
              Image.asset('assets/images/icons8-google-512.png', scale: 13.5),
              Text(
                'Sign In with Google',
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