import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFilled extends StatelessWidget {
  final controller;
  final textColor;
  final borderColor;
  final validator;

  final hintText;
  const TextFilled({Key?key,
    required this.controller,
    required this.textColor,
    required this.borderColor,
    required this.hintText,
    required this.validator,

  });

  @override
  Widget build(BuildContext context) {
    return    TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(20.0)),
              borderSide:
              BorderSide(color: borderColor)),
          hintStyle: TextStyle(
              fontSize: 16, color: textColor),
          contentPadding: EdgeInsets.all(18),
          enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(20.0)),
              borderSide:
              BorderSide(color: Color(0xffBABABA))),
          errorBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(20.0)),
              borderSide:
              BorderSide(color: Color(0xffBABABA))),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Color(0xffBABABA)),
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white),
    );
  }
}
