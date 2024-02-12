import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Widgets/pincode.dart';
import 'package:newdistrobo/controllers/EmailVerifyController/EmailVerifyController.dart';
import 'package:newdistrobo/controllers/SignUpController/SignupController.dart';
import 'package:newdistrobo/utils/StatusClass.dart';
import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/PasswordTextFilled.dart';
import '../Widgets/TextFilled.dart';
import '../Widgets/appColor.dart';
import 'LogigScreen.dart';
import 'package:new_pinput/new_pinput.dart';
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

  TextEditingController optcontroller=TextEditingController();
SignUpViewModal SignUpViewModalin=SignUpViewModal();
  var genderItems = [ 
    "Convenience Store",
    "Laundromat",
    "Gas Satation",
    "Restaurant",
    "Liquor Store",
    "Market",
    "Smoke Shop"
  ];
  String? selectLocalGender;
  bool passwordVisible = true;
  bool passwordVisiblen = true;
  final SignupVM = Get.put(SignUpViewModal());
EmailVerifycontroller EmailVerifycontrollerin= EmailVerifycontroller();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownFocus1.addListener(_onDropdownFocusChange1);
  }

  bool _isDropdownOpen1 = false;
  bool Verifyed=false;

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

                              controller: SignupVM.namecontroller.value,
                              borderColor: ColorConstants.appColor,
                              textColor: null,
                              hintText: "First Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your first name';
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
                              controller: SignupVM.lastnamecontroller.value,
                              borderColor: ColorConstants.appColor,
                              textColor: null,
                              hintText: "Last Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your last name';
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
                            controller: SignupVM.emailcontroller.value,
                            borderColor: ColorConstants.appColor,
                            textColor: null,
                            hintText: "Enter Email",
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
SizedBox(height:15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                         if(Verifyed==false)   InkWell(child: Text("Verify",style:TextStyle(color: ColorConstants.appColor,fontWeight:FontWeight.bold),),onTap: (){
//                               showDialog(
                              
//   context: context,
//   builder: (BuildContext context) {
//     return OTPDialog(
    
//       onSubmit: (otp) {
//         // Handle OTP submission
//         print('Submitted OTP: $otp');
//       },
//     );
//   },
// );
EmailVerifycontrollerin.emailtoverify.value= SignupVM.emailcontroller.value.text;
EmailVerifycontrollerin.EmailVerifyhitApi(context);

showAlert();
                            },),
                             if(Verifyed==true)   InkWell(child: Text("Verifyed",style:TextStyle(color: ColorConstants.appColor,fontWeight:FontWeight.bold),),onTap: (){

                            },),

                            SizedBox(width: 15,)
                          ],
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
                            cursorColor: ColorConstants.appColor,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: SignupVM.phonecontroller.value,
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
                            controller: SignupVM.passwordController.value,
                            borderColor: ColorConstants.appColor,
                            textColor: null,
                            hintText: "Enter  Password",
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
                            controller:
                                SignupVM.confirmpasswordController.value,

                            borderColor: ColorConstants.appColor,
                            textColor: null,
                            hintText: "Enter Confirm Password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Confirm Password';
                              }
                              else if ( SignupVM.passwordController.value.text !=
                                  SignupVM.confirmpasswordController.value.text) {
                                // Passwords do not match

                                return "Passwords do not match";
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
                  child: Center(child: Obx(() {
                    return MyButton(
                      loading:  SignupVM.loading.value,
                      title: "Sign Up",
                      bgColor: ColorConstants.appColor,
                      onTap: () {

                        if (formkey.currentState!.validate()) {

                          if(Verifyed==true){
  SignupVM.SignupHitApi(context);
                          }else{
showDialog(context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 80,
            child: Column(
              children: [
                  Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child:Icon(Icons.cancel)
                            )),
                Text("Please verify Your Email"),
              ],
            ),
          ),
        );});
                          }
                        
                        }
                      },
                    );
                  })),
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



   showAlert() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(

            // Color(0xffFFFFFF)
            backgroundColor: Color(0xffFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content:  Container(
                  height: Get.height * 0.45,
                  width: Get.width * 1,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child:Icon(Icons.cancel)
                          )),
                      SizedBox(
                        height: Get.height * .04,
                      ),

                      Center(
                        child: Text(
                          "Type the verification code\n         we've sent you",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .05,
                      ),
                      Center(
                        child: Pinput(
                          validator: (value) {
                            if (value!.isEmpty && value.length != 6) {
                              return "Please enter your 6 digit pin";
                            } else {
                              return null;
                            }
                          },
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          length: 6,
                          autofocus: true,
                          //
                          // validator: (s) {
                          //   if (s?.contains('1')??false) return null;
                          //   return 'NOT VALID';
                          // },
                          useNativeKeyboard: true,
                          keyboardType: TextInputType.number,
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: TextStyle(
                                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration( color:ColorConstants.appColor,
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(50),)),
                          // submittedPinTheme: submittedPinTheme,
                          // onSubmitted: (String pin) => _showSnackBar(context,pin),
                          // focusNode: _pinPutFocusNode,
                          controller: optcontroller
                          // submittedPinTheme: PinTheme(
                          //     height: 56,
                          //     width: 56,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(40.0),
                          //         border: Border.all(color: Color(0xffFE0091)),
                          //         color: Color(0xffFe0091))),
                          // focusedPinTheme: defaultPinTheme,
                          // followingPinTheme: defaultPinTheme,
                        ),
                      ),
                      SizedBox(height: Get.height * .05),
                      Center(
                        child: MyButton(
                            loading: SignUpViewModalin.loading.value,
                            bgColor: ColorConstants.appColor,
                            title: "Verify",
                            onTap: () {
                              // if(UserEmailAndphone.emailAndPhoneVerifyController.value.text.contains("@")){
                              //   // UserEmailAndphone.email_verify.value=1;
                              // }
                              // else{
                              //   // UserEmailAndphone.phone_verify.value=1;
                              // }
                              // if(UserEmailAndphone.otpController.value.text.isNotEmpty) {
                              //   UserEmailAndphone.PhoneAndEmaiOtpVerifyed(context);
                              // }
                              // else{
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Center(child: Text("full fill the otp")),
                              //       action: SnackBarAction(
                              //         label: '',
                              //         onPressed: () {
                              //           // Handle the action when the button in the SnackBar is pressed.
                              //         },
                              //       ),
                              //     ),
                              //   );
                              // }

                              if(EmailVerifycontrollerin.otpvalue.value== optcontroller.text){
setState(() {
  Verifyed=true;
  optcontroller.clear();
});
                                Get.back();
                              }else{
                                showDialog(context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 80,
            child: Column(
              children: [
                  Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child:Icon(Icons.cancel)
                            )),
                Text("Otp invalid"),
              ],
            ),
          ),
        );});
                          
                              }
                            }),
                      ),
                        SizedBox(
                        height: Get.height*0.01,
                      ),
                    // if(UserEmailAndphone.resendOtp.value==true) 
                    Center(
                        child: SignUpViewModalin.loading.value==true ?
                        CircularProgressIndicator() :TextButton(onPressed: () {
                          // UserEmailAndphone.PhoneAndEmailVerifiyed();
                        }, child: Text("resend otp")
                        ),
                      )
                    ],
                  ),
                ));
              
            
      },
    );
  }
}
