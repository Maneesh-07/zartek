import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:zartek/core/color/color.dart';
import 'package:zartek/core/constant/constant.dart';
import 'package:zartek/views/login/phone_otp.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.lableText,
    required this.controller,
    this.isobscure = false,
    this.keyboardType,
    this.maxLength,
    this.validator,
  });
  final String lableText;
  final TextEditingController controller;
  final bool isobscure;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? Function(String?)? validator;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 0.0),
      child: TextFormField(
        obscureText: widget.isobscure,
        controller: widget.controller,
        style: textStyle,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          counterStyle:  TextStyle(
            color: colorGrey,
          ),
          labelText: widget.lableText,
          labelStyle: subFontStyle,
          filled: true,
          fillColor: Colors.grey.shade300,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                showCountryPicker(
                    context: context,
                    countryListTheme: const CountryListThemeData(
                      bottomSheetHeight: 550,
                    ),
                    onSelect: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    });
              },
              child: Text(
                "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          suffixIcon: mobileController.text.length > 9
              ? Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 25,
                  ),
                )
              : null,
        ),
        validator: widget.validator,
      ),
    );
  }
}

class TextFormFieldWidget1 extends StatefulWidget {
  const TextFormFieldWidget1({
    super.key,
    required this.lableText,
    required this.controller,
    this.isobscure = false,
    this.keyboardType,
    this.maxLength,
    this.validator,
  });
  final String lableText;
  final TextEditingController controller;
  final bool isobscure;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? Function(String?)? validator;

  @override
  State<TextFormFieldWidget1> createState() => _TextFormFieldWidget1State();
}

class _TextFormFieldWidget1State extends State<TextFormFieldWidget1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 0.0),
      child: TextFormField(
        obscureText: widget.isobscure,
        controller: widget.controller,
        style: textStyle,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          counterStyle:  TextStyle(
            color: white,
          ),
          labelText: widget.lableText,
          labelStyle: subFontStyle,
          filled: true,
          fillColor: colorGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          // suffixIcon: mobileController.text.length > 6
          //     ? Container(
          //         height: 30,
          //         width: 30,
          //         margin: const EdgeInsets.all(10.0),
          //         decoration: const BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Colors.green,
          //         ),
          //         child: const Icon(
          //           Icons.done,
          //           color: Colors.white,
          //           size: 20,
          //         ),
          //       )
          //     : null,
        ),
        validator: widget.validator,
      ),
    );
  }
}
