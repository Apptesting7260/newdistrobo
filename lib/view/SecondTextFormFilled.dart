import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

class TextFilledWithOutBorder extends StatelessWidget {
  final controller;
  final textColor;

  final validator;

  final hintText;

  const TextFilledWithOutBorder({
    Key? key,
    required this.controller,
    required this.textColor,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.appColor)),
          hintStyle: TextStyle(fontSize: 16, color: textColor),

          // enabledBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Color(0xffBABABA))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffBABABA))),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffBABABA)),
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white),
    );
  }
}
