import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/appColor.dart';
import 'package:newdistrobo/controllers/VerifyPage_controller/VerifyPage_controller.dart';
import 'package:pinput/pinput.dart';
import '../Widgets/MyButton.dart';

class OtpVerification extends StatefulWidget {
  OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  bool route = false;
  final VerifyPageVm = Get.put(VerifyPageViewModal());
  final validatekey = GlobalKey<FormState>();

  // String verificationStatus = '';

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
          fontSize: 28, fontWeight: FontWeight.w800, color: Colors.green),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(50),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(50),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
    );
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
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Enter OTP",
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
                        "Please enter the four digit otp we sent to your email.",
                        style: TextStyle(
                            color: ColorConstants.subTextColor,
                            fontSize: 16,
                            fontFamily: 'Gilroy-m',
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.start,
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                // **********************  for pinput to generate opt verifications ***********************

                Center(
                  child: Form(
                    key: validatekey,
                    child: Pinput(
                      controller: VerifyPageVm.otpController.value,
                      keyboardType: TextInputType.phone,
                      validator: (pin) {
                        if (pin!.isEmpty) {
                          return 'Enter OTP';
                        } else if (pin.length < 6) {
                          return "Please Fill All Input";
                        } else {
                          return null;
                        }
                      },
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) => print(pin),
                    ),
                  ),
                ),

                SizedBox(
                  height: Get.height * 0.05,
                ),
                Center(
                    child: SizedBox(
                  height: Get.height * 0.078,
                  width: Get.width * 0.65,
                  child: Center(
                    child: Obx(() {
                      return MyButton(
                        bgColor: ColorConstants.appColor,
                        title: "Verify",
                        loading: VerifyPageVm.resendVisible.value,
                        onTap: () {
                          if (validatekey.currentState!.validate()) {
                            VerifyPageVm.VerifyHitApi();
                          }
                        },
                      );
                    }),
                  ),
                )),

                SizedBox(
                  height: 25,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "I don't received OTP!",
                        style: TextStyle(
                            color: Color(0xff030303),
                            fontWeight: FontWeight.w500,
                            fontSize: 14)),
                    TextSpan(
                        text: " Resend again",
                        style: TextStyle(
                          color: ColorConstants.appColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ))
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
