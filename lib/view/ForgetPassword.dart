
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/MyButton.dart';
import '../Widgets/TextFilled.dart';
import '../Widgets/appColor.dart';
import 'VerifyPage.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool loading = false;
  final TextEditingController emailcontroller = TextEditingController();
  RxBool resendVisible = true.obs;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_sharp)),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          color: Color(0xff181725),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
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
                  height: Get.height * 0.04,
                ),
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
                  child: Form(
                    key: _formkey,
                    child: TextFilled(
                      controller: emailcontroller,
                      borderColor: ColorConstants.appColor,
                      textColor: null,
                      hintText: "Enter Email",
                      validator:(value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email";
                        } else if (!value.endsWith("@gmail.com")) {
                          return "Please Enter Valid Gmail";
                        } else {
                          return null;
                        }
                      },
                    ),
                    ),
                  ),

                SizedBox(
                  height: Get.height * 0.04,
                ),
                Center(
                  child: SizedBox(
                      height: Get.height * 0.078,
                      width: Get.width * 0.65,
                      child:  Center(
                          child: MyButton(
                            title: "Send",
                            bgColor: ColorConstants.appColor,
                            loading: !resendVisible.value,
                            onTap: () {
                              Get.off(OtpVerification());
                            },
                          ),
                      )

                  ),
                ),
          ]
            ),
          ),
        ),
      ));
  }


}