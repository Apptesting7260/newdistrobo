import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/PasswordTextFilled.dart';
import 'package:newdistrobo/Widgets/appColor.dart';
import 'package:newdistrobo/view/NvigationTabButton.dart';

import '../controllers/createPassword/CreatePassword.dart';

// ignore: must_be_immutable
class CreatePassword extends StatefulWidget {
  var email;


  CreatePassword({super.key, required this.email});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  CreatePasswordController passwordController =Get.put(CreatePasswordController());
  final _formkey = GlobalKey<FormState>();
  bool passwordVisible = true;
  bool passwordVisiblen = true;
  bool route = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formkey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_sharp)),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Create New Password",
                    style: TextStyle(
                        color: Color(0xff181725),
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Please enter your email address to request a password reset",
                      style: TextStyle(
                          color: ColorConstants.subTextColor,
                          fontSize: 16,
                          fontFamily: 'Gilroy-m',
                          fontWeight: FontWeight.w400),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                          fontFamily: 'Gilroy-sb',
                          color: Color(0xff181725),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: PasswordTextFilled(
                  controller: passwordController.passWord.value,
                  borderColor: ColorConstants.appColor,
                  textColor: null,
                  hintText: "Enter Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your Password';
                    }
                    else if (value.length < 8) {
                      return "Password must be at least 8 characters long";
                    }
                    else if (!value.contains(RegExp(r'[A-Z]'))) {
                      return "Password must contain at least one uppercase letter";
                    } else if (!value.contains(RegExp(r'[a-z]'))) {
                      return "Password must contain at least one lowercase letter";
                    } else if (!value.contains(RegExp(r'[0-9]'))) {
                      return "Password must contain at least one digit";
                    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return "Password must contain at least one special character";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Confirm Password",
                      style: TextStyle(
                          fontFamily: 'Gilroy-sb',
                          color: Color(0xff181725),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
              ),

              // for ********************* widget **************************
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: PasswordTextFilled(
                    controller: passwordController.con_passWord.value,
                    borderColor: ColorConstants.appColor,
                    textColor: null,
                    hintText: "Enter Confirm Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Confirm Password';
                      }else if ( passwordController.passWord.value.text !=
                          passwordController.con_passWord.value.text) {
                        // Passwords do not match

                        return "Passwords do not match";
                      }
                    },
                  )),
              SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  height: Get.height * 0.078,
                  width: Get.width,
                  child: Center(
                    child: Obx(()=>
                       MyButton(
                        title: "Confirm",
                        bgColor: ColorConstants.appColor,
                        loading:  passwordController.resendVisible.value,
                        onTap: () {
                          // Get.off(OtpVerification());
                          if (_formkey.currentState!.validate()) {
                            passwordController.CreatePassHitApi(widget.email);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          )),
    )));
  }
}
