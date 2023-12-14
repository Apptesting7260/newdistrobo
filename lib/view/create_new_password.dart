import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/PasswordTextFilled.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

// ignore: must_be_immutable
class CreatePassword extends StatefulWidget {


  CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      color: Color(0xff7c7c7c),
                                      fontSize: 16,
                                      fontFamily: 'Gilroy-m',
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                          SizedBox(
                            height: 50,
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: PasswordTextFilled(
                              controller: passwordController,
                              borderColor: ColorConstants.appColor,
                              textColor: null,
                              hintText: "Enter Password",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your Password';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40,
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

                          Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: PasswordTextFilled(
                                controller: confirmpasswordController,
                                borderColor: ColorConstants.appColor,
                                textColor: null,
                                hintText: "Enter Password",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Confirm Password';
                                  } else if (value != passwordController.text) {
                                    return 'Not Match Password';
                                  }
                                },
                              )
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: SizedBox(
                              height: Get.height * 0.078,
                              width: Get.width * 0.65,
                              child: Center(
                                child: MyButton(
                                  title: "Confirm",
                                  bgColor: ColorConstants.appColor,
                                  loading: false,
                                  onTap: () {
                                    // Get.off(OtpVerification());
                                  },
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  )),
            )));
  }

}
