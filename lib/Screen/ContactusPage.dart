import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../Widgets/TextFilled.dart';
import '../Widgets/appBar.dart';
import '../controllers/ContactContorall/ContactCpntroller.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  final formkey = GlobalKey<FormState>();

  bool _isValidPhoneNumber(String value) {
    return RegExp(r'^\d{10}$').hasMatch(value);
  }
  ContactsController contactsController=Get.put(ContactsController());
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
                      child: TextFilled(
                        controller: contactsController.nameController.value,
                        textColor: null,
                        borderColor: ColorConstants.appColor,
                        hintText: 'Enter name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter name';
                          }
                        },
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
                    child: TextFilled(
                      controller: contactsController.emailController.value,
                      textColor: null,
                      borderColor: ColorConstants.appColor,
                      hintText: 'Enter Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your email';
                        }
                        else if ( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Please Enter Valid Gmail";
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: contactsController.numberController.value,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10)
                      ],
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
                          hintText: "Enter your Phone Number",

                          prefixIcon: CountryCodePicker(
                            padding: EdgeInsets.only(bottom: 1),
                            onChanged: (element) =>
                                debugPrint(element.toLongString()),
                            initialSelection: 'IN',

                            showCountryOnly: false,

                            showOnlyCountryWhenClosed: false,
                            favorite: const [
                              '+91',
                              'IN',
                            ],


                            showDropDownButton: true,
                            showFlag: false,
                          ),
                          hintStyle: TextStyle(fontFamily: 'Gilroy-rg'),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: ColorConstants.appColor)),
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
                              BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                            BorderSide(color: Colors.red),
                          ),
                          filled: true,
                          fillColor: Colors.white),
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
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller:contactsController.mesengeController.value,
                      cursorColor: ColorConstants.appColor,
                      maxLines: 3,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: ColorConstants.appColor)),
                          hintStyle: TextStyle(
                              fontSize: 16, color: Color(0xFF7C7C7C)),
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
                              BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                            BorderSide(color: Colors.red),
                          ),
                          hintText: 'Enter Message',
                          filled: true,
                          fillColor: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Message";
                          }
                            return null;

                        }
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: Get.height * 0.078,
                    width: Get.width * 0.65,
                    child:Obx(() =>  MyButton(
                      title: "send",
                      width: Get.width * 0.05,
                      bgColor: ColorConstants.appColor,
                      loading: contactsController.resendVisible.value,
                      onTap: () {
                        validate();
                      },
                    ),)
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

    if (formkey.currentState!.validate()) {
      contactsController.SendMessage(context);
      print("send");
    }
  }

  bool isLoading = false;
}
