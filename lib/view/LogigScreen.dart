import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/MyButton.dart';
import '../Widgets/PasswordTextFilled.dart';
import '../Widgets/TextFilled.dart';
import '../Widgets/appColor.dart';
import 'ForgetPassword.dart';
import 'NvigationTabButton.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height* 0.05,
                ),
                Center(
                  child: Image.asset("assets/aapIcon/appIcon.png"),
                ),
                SizedBox(
                  height: Get.height* 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Color(0xff181725),
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height* 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter your emails and password",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                            fontFamily: 'Gilroy-m'),
                      )),
                ),
                SizedBox(
                  height: Get.height* 0.05,
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    fontFamily: 'Gilroy-sb',
                                    color: Color(0xff181725),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: TextFilled(
                            controller: emailController,
                            borderColor: ColorConstants.appColor,
                            textColor: null,
                            hintText: "Enter Email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: Get.height* 0.05,
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
                          height: Get.height* 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                  onTap: () => Get.to(ResetPassword()),
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Color(0xff53B175),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ))),
                        ),
                      ],
                    )),
                SizedBox(
                  height: Get.height* 0.05,
                ),
                SizedBox(
                  height: Get.height * 0.084,
                  width: Get.width * 0.65,
                  child: Center(
                    child: MyButton(
                      title: "Log In",
                      loading: false,
                      bgColor: ColorConstants.appColor,
                      onTap: () {
                        Get.off(Tab_view(index: 0,));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height* 0.05,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Don't have an acoount?",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                  WidgetSpan(
                      child: SizedBox(
                    width: 5,
                  )),
                  TextSpan(
                    text: "SignUp",
                    style: TextStyle(color: Color(0xff53B175), fontSize: 16),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => (Get.to(SignupScreen())),
                  )
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
