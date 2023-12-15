import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/view/NvigationTabButton.dart';

import '../Widgets/MyButton.dart';
import '../Widgets/PasswordTextFilled.dart';
import '../Widgets/TextFilled.dart';
import '../Widgets/appColor.dart';
import 'LogigScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formkey = GlobalKey<FormState>();
  bool route = false;
  FocusNode focusNode = FocusNode();
  FocusNode _dropdownFocus1 = FocusNode();
  String? selectGender;
  var genderItems = ["Male", "Female", "Other"];
  String? selectLocalGender;
  bool passwordVisible = true;
  bool passwordVisiblen = true;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownFocus1.addListener(_onDropdownFocusChange1);
  }

  bool _isDropdownOpen1 = false;
  void _onDropdownFocusChange1() {
    setState(() {
      _isDropdownOpen1 = _dropdownFocus1.hasFocus;

      print(_isDropdownOpen1);
    });
  }

  bool _isValidPhoneNumber(String value) {
    return RegExp(r'^\d{10}$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Center(
                  child: Image.asset("assets/aapIcon/appIcon.png"),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: ColorConstants.textColor,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter your credential to continue",
                        style: TextStyle(
                            color: ColorConstants.subTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            fontFamily: 'Gilroy-m'),
                      )),
                ),
                SizedBox(height: Get.height * 0.03),
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "First Name",
                                style: TextStyle(
                                    fontFamily: 'Gilroy-sb',
                                    color: Color(0xff181725),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: TextFilled(
                              controller: namecontroller,
                              borderColor: ColorConstants.appColor,
                              textColor: null,
                              hintText: "First Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Last Name",
                                style: TextStyle(
                                    fontFamily: 'Gilroy-sb',
                                    color: Color(0xff181725),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                        SizedBox(height: Get.height * 0.01),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: TextFilled(
                              controller: lastnamecontroller,
                              borderColor: ColorConstants.appColor,
                              textColor: null,
                              hintText: "Last Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Business Type",
                                style: TextStyle(
                                    fontFamily: 'Gilroy-sb',
                                    color: Color(0xff181725),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                        SizedBox(height: Get.height * 0.01),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Focus(
                              focusNode: _dropdownFocus1,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Text("Select Buainess"),
                                  items: genderItems.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  value: selectLocalGender,
                                  onChanged: (String? value) {
                                    setState(() {
                                      print(value);
                                      selectLocalGender = value;
                                      selectGender = value;
                                      print(selectGender);
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: Get.height * 0.07,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: _isDropdownOpen1 == false
                                            ? Colors.grey
                                            : ColorConstants.appColor,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                  iconStyleData: selectLocalGender == null
                                      ? IconStyleData(
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          // Change to up arrow icon
                                          iconSize: 30,
                                          iconEnabledColor: Colors.black,
                                        )
                                      : IconStyleData(
                                          icon: InkWell(
                                            child: Icon(Icons.close),
                                            onTap: () {
                                              setState(() {
                                                selectLocalGender = null;
                                              });
                                            },
                                          ), // Change to down arrow icon
                                          iconSize: 25,
                                          //iconEnabledColor: Colors.black,
                                        ),
                                  dropdownStyleData: DropdownStyleData(
                                    width: Get.width * 0.89,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.white,
                                    ),
                                    offset: const Offset(10, 0),
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: const Radius.circular(20),
                                      thickness:
                                          MaterialStateProperty.all<double>(6),
                                      thumbVisibility:
                                          MaterialStateProperty.all<bool>(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
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
                        SizedBox(height: Get.height * 0.01),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: TextFilled(
                            controller: emailcontroller,
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
                          height: Get.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontFamily: 'Gilroy-sb',
                                    color: Color(0xff181725),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: TextFormField(
                            controller: phonecontroller,
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
                                        BorderSide(color: Color(0xffBABABA))),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
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
                        SizedBox(height: Get.height * 0.01),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: PasswordTextFilled(
                            controller: passwordController,
                            borderColor: ColorConstants.appColor,
                            textColor: null,
                            hintText: "Enter  Password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
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
                        SizedBox(height: Get.height * 0.01),

                        // for ******************** widget *************************

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: PasswordTextFilled(
                            controller: confirmpasswordController,
                            borderColor: ColorConstants.appColor,
                            textColor: null,
                            hintText: "Enter Confirm Password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                SizedBox(
                  height: Get.height * 0.084,
                  width: Get.width,
                  child: Center(
                    child: MyButton(
                      loading: false,
                      title: "Sign Up",
                      bgColor: ColorConstants.appColor,
                      onTap: () {
                        Get.off(Tab_view(
                          index: 0,
                        ));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Already have an acoount? ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                  WidgetSpan(
                      child: SizedBox(
                    height: Get.height * 0.001,
                  )),
                  TextSpan(
                    text: "Login",
                    style:
                        TextStyle(color: ColorConstants.appColor, fontSize: 16),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(LoginScreen()),
                  )
                ])),
                SizedBox(
                  height: Get.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
