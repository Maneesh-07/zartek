
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zartek/core/color/color.dart';
import 'package:zartek/core/constant/constant.dart';

class SignInText extends StatelessWidget {
  const SignInText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 165),
      child: Column(
        children: [
          Text(
            'Zartek.',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 40,
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          kHeight,
          Text(
            title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 26,
                color: black,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          kHeight20,
          // kHeight20
        ],
      ),
    );
  }
}
