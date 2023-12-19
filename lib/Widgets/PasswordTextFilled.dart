import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appColor.dart';

class PasswordTextFilled extends StatefulWidget {
  PasswordTextFilled({
    Key? key,
    required this.controller,
    required this.textColor,
    required this.borderColor,
    required this.hintText,
    required this.validator,
  });

  final controller;
  final textColor;
  final borderColor;
  final validator;
  final hintText;

  @override
  State<PasswordTextFilled> createState() => _PasswordTextFilledState();
}

class _PasswordTextFilledState extends State<PasswordTextFilled> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorConstants.appColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: passwordVisible,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility_off : Icons.visibility,
              color: Color(0xff53B175),
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: widget.borderColor)),
          hintStyle: TextStyle(fontSize: 16, color: widget.textColor),
          contentPadding: EdgeInsets.all(18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Color(0xffBABABA))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Color(0xffBABABA))),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Color(0xffBABABA)),
          ),
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white),
    );
  }
}
