import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/controllers/ResetPasswordController/ResetPassController.dart';
import 'package:newdistrobo/controllers/SignUpController/SignupController.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/TextFilled.dart';
import '../Widgets/appColor.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool loading = false;
  final ResetPassVM = Get.put(ResetPasswordViewModal());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              height: Get.height * 0.02,
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
            SizedBox(
              height: Get.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Form(
                key: _formkey,
                child: TextFilled(
                  controller: ResetPassVM.emailcontroller.value,
                  borderColor: ColorConstants.appColor,
                  textColor: null,
                  hintText: "Enter Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Email";
                    } else if ( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Please Enter Valid Gmail";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.06,
            ),
            Center(
              child: SizedBox(
                  height: Get.height * 0.078,
                  width: Get.width * 0.65,
                  child: Center(
                    child: Obx(() {
                      return MyButton(
                        title: "Send",
                        bgColor: ColorConstants.appColor,
                        loading: ResetPassVM.resendVisible.value,
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            ResetPassVM.ResetPassHitApi(context);
                          }
                        },
                      );
                    }),
                  )),
            ),
          ]),
        ),
      ),
    ));
  }
}
