import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../Widgets/appBar.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController namecontrollerr = TextEditingController();
  TextEditingController emailcontrollerr = TextEditingController();
  TextEditingController phonecontrollerr = TextEditingController();
  TextEditingController massegeControllerr = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool _isValidPhoneNumber(String value) {
    return RegExp(r'^\d{10}$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: AppBarWidget(
                      img: 'assets/images/notification.png',
                      title: 'Contact Us',
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
                          "Name",
                          style: TextStyle(
                              fontFamily: 'Gilroy-SemiBold',
                              color: Color(0xff181725),
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: TextFormField(
                        cursorColor: ColorConstants.appColor,
                        controller: namecontrollerr,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Name';
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorConstants.appColor)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBABABA)),
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffBABABA))),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffBABABA))),
                            hintText: "Enter your name",
                            hintStyle: TextStyle(
                              fontFamily: 'Gilroy-Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
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
                          "Email",
                          style: TextStyle(
                              fontFamily: 'Gilroy-SemiBold',
                              color: Color(0xff181725),
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: TextFormField(
                      cursorColor: ColorConstants.appColor,
                      controller: emailcontrollerr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        } else if (!value.endsWith('@gmail.com')) {
                          return 'Please Enter Valid Email';
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorConstants.appColor)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBABABA))),
                          focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBABABA))),
                          hintText: "Enter your Email",
                          hintStyle: TextStyle(
                            fontFamily: 'Gilroy-Regular',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
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
                          "Phone Number",
                          style: TextStyle(
                              fontFamily: 'Gilroy-SemiBold',
                              color: Color(0xff181725),
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: TextFormField(
                      cursorColor: ColorConstants.appColor,
                      controller: phonecontrollerr,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Phone Number";
                        } else if (!_isValidPhoneNumber(value)) {
                          return "Invalid phone number. Please use a valid phone number format.";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorConstants.appColor)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBABABA))),
                          focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBABABA))),
                          hintText: "Enter your Phone Number",
                          hintStyle: TextStyle(
                            fontFamily: 'Gilroy-Regular',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
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
                          "Message",
                          style: TextStyle(
                              fontFamily: 'Gilroy-SemiBold',
                              color: Color(0xff181725),
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: TextFormField(
                      cursorColor: ColorConstants.appColor,
                      controller: massegeControllerr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Message";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorConstants.appColor)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBABABA))),
                          focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBABABA))),
                          hintText: "Type message",
                          hintStyle: TextStyle(
                            fontFamily: 'Gilroy-Regular',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: Get.height * 0.078,
                    width: Get.width * 0.65,
                    child: MyButton(
                      title: "send",
                      width: Get.width * 0.05,
                      bgColor: ColorConstants.appColor,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  validate() {
    print("send");
    if (!formkey.currentState!.validate()) {
      return;
    }
  }

  bool isLoading = false;
}
