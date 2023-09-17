import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zartek/core/color/color.dart';
import 'package:zartek/core/constant/constant.dart';
import 'package:zartek/services/user_details.dart';
import 'package:zartek/views/home/home_page.dart';
import 'package:zartek/views/login/phone_otp.dart';
import 'package:zartek/views/login/widget/button_widget.dart';
import 'package:zartek/views/login/widget/textform_widget.dart';

class CheckLoginOtp extends StatelessWidget {
  const CheckLoginOtp({super.key, required this.mobile});

  final String mobile;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 250, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  label: 'Verify your phone number',
                  fontSize: 24,
                ),
                kHeight,
                const CustomText(
                  label: 'Enter the 6 digit code sent to',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  label: mobile,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                kHeight,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormFieldWidget1(
                    lableText: 'Verification Code',
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                  ),
                ),
                ButtonWidget(
                    label: 'Continue',
                    onTap: () {
                      verifyOtp(otpController.text.trim(), context);
                    },
                    buttonColor: buttongreen)
              ],
            ),
          ),
        ),
      ),
    );
  }

  verifyOtp(String otp, context) async {
    final User? user = FirebaseAuth.instance.currentUser;
    bool verified = await a.verifyOTP(a.userVerificationId, otp);
    bool isExisist = await UserDetails().isUserIdExists(mobile);
    if (verified) {

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  HomeScreen(user: user,)));

      if (isExisist) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  HomeScreen()));
      }
    } else {
      return;
    }
  }
}
