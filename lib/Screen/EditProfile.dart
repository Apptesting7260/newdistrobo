import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/MyButton.dart';
import '../Widgets/appColor.dart';

class EditeMyProfile extends StatefulWidget {
  const EditeMyProfile({super.key});

  @override
  State<EditeMyProfile> createState() => _EditeMyProfileState();
}

class _EditeMyProfileState extends State<EditeMyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, // Set this property to true

          title: Text(
            "Profile",
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
                fontFamily: 'Gilroy-sb',
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                size: 22,
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.025,
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.16,
              decoration: BoxDecoration(color: Color(0xFF53B175)),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.05,
                  ),
                  Container(
                    width: Get.width * 0.2,
                    height: Get.width * 0.2,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF2F3F2),
                      shape: OvalBorder(),
                    ),
                    child: Center(
                        child: Icon(Icons.person)
                    ),
                  ),

                  SizedBox(
                    width: Get.width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'John Due',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Gilroy-Bold',
                          fontWeight: FontWeight.w400,

                        ),
                      ),
                      Row(
                        children: [

                          Image.asset("assets/images/locationW.png",height: 10,),
                          Text(
                            '6391 Elgin St. Celina, Delaware 10299',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.025,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset(
                              "assets/images/profu.png",
                            ),
                            radius: 24,
                            backgroundColor: Color(0xFFF2F3F2),
                          ),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                  color: Color(0xFF323643),
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'John Due',
                                style: TextStyle(
                                  color: Color(0xFF8C8D8C),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Regular',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],

                      ),



                    Row(children: [  Image.asset("assets/images/editeicon.png",height: 20,),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),],)
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.to(MyOrder());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Row(
                         children: [
                           CircleAvatar(
                             child: Image.asset(
                               'assets/images/contact.png',
                               height: Get.height * 0.025,
                               color: ColorConstants.appColor,
                             ),
                             radius: 24,
                             backgroundColor: Color(0xFFF2F3F2),
                           ),
                           SizedBox(
                             width: Get.width * 0.03,
                           ),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 'Phone Number',
                                 style: TextStyle(
                                   color: Color(0xFF323643),
                                   fontSize: 16,
                                   fontFamily: 'Gilroy-SemiBold',
                                   fontWeight: FontWeight.w400,
                                 ),
                               ),
                               Text(
                                 '9876543210',
                                 style: TextStyle(
                                   color: Color(0xFF8C8D8C),
                                   fontSize: 14,
                                   fontFamily: 'Gilroy-Regular',
                                   fontWeight: FontWeight.w400,
                                 ),
                               )
                             ],
                           ),
                         ],
                       ),
                        SizedBox(
                          width: Get.width * 0.3,
                        ),
                        Row(children: [  Image.asset("assets/images/editeicon.png",height: 20,),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),],)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  InkWell(
                    onTap: () {
                      // ShowbuttonShett();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Row(
                         children: [
                           CircleAvatar(
                               child: Image.asset(
                                 "assets/images/mail.png",
                               ),
                               radius: 24,
                               backgroundColor: Color(0xFFF2F3F2)),
                           SizedBox(
                             width: Get.width * 0.03,
                           ),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 'Email ID',
                                 style: TextStyle(
                                   color: Color(0xFF323643),
                                   fontSize: 16,
                                   fontFamily: 'Gilroy-SemiBold',
                                   fontWeight: FontWeight.w400,
                                 ),
                               ),
                               Text(
                                 'userdemo@gmail.com',
                                 style: TextStyle(
                                   color: Color(0xFF8C8D8C),
                                   fontSize: 14,
                                   fontFamily: 'Gilroy-Regular',
                                   fontWeight: FontWeight.w400,
                                 ),
                               )
                             ],
                           ),
                         ],
                       ),

                        Row(children: [  Image.asset("assets/images/editeicon.png",height: 20,),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),],)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                          child: Image.asset(
                            "assets/images/lock.png",
                            height: Get.height * 0.06,
                            width: Get.width * 0.06,
                          ),
                          radius: 24,
                          backgroundColor: Color(0xFFF2F3F2),
                        ),
                        SizedBox(
                          width: Get.width * 0.025,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Color(0xFF323643),
                                fontSize: 16,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Change Password',
                              style: TextStyle(
                                color: Color(0xFF8C8D8C),
                                fontSize: 14,
                                fontFamily: 'Gilroy-Regular',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ],),

                      Row(children: [  Image.asset("assets/images/editeicon.png",height: 20,),
                        SizedBox(
                          width: Get.width * 0.03,
                        ),],)
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  InkWell(
                    onTap: () {
                      // ShowbuttonShett();
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                            child: Image.asset(
                              "assets/images/livelocate.png",
                            ),
                            radius: 24,
                            backgroundColor: Color(0xFFF2F3F2)),
                        SizedBox(
                          width: Get.width * 0.03,
                        ),
                        Container(
                          width: Get.width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Address',
                                style: TextStyle(
                                  color: Color(0xFF323643),
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                ' 6391 Elgin St. Celina, Delaware 10299',
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                  color: Color(0xFF8C8D8C),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Regular',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.03,
                        ),
                        Image.asset("assets/images/editeicon.png",height: 20,),
                          SizedBox(
                            width: Get.width * 0.03,
                          )

                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ShowbuttonShett() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: Get.height * .8,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'Address',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 26,
                          fontFamily: 'Gilroy-Bold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'House/Building No',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: ColorConstants.appColor,
                        decoration: InputDecoration(
                          hintText: 'Enter House/Building No',
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
                          hintStyle: TextStyle(
                            color: Color(0xFF7C7C7C),
                            fontSize: 16,
                            fontFamily: 'Gilroy-Regular',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'Street Name',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: ColorConstants.appColor,
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
                            hintText: 'Enter street name',
                            hintStyle: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 16,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'Area',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: ColorConstants.appColor,
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
                            hintText: 'Enter area',
                            hintStyle: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 16,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'County',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TextFormField(
                          cursorColor: ColorConstants.appColor,
                          keyboardType: TextInputType.emailAddress,
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
                            hintText: 'Select County',
                            hintStyle: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 16,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'State',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TextFormField(
                          cursorColor: ColorConstants.appColor,
                          keyboardType: TextInputType.emailAddress,
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
                            hintText: 'Enter state',
                            hintStyle: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 16,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'City',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: ColorConstants.appColor,
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
                            hintText: 'Enter city',
                            hintStyle: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 16,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'Post Code',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TextFormField(
                          cursorColor: ColorConstants.appColor,
                          keyboardType: TextInputType.emailAddress,
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
                            hintText: 'Enter post code',
                            hintStyle: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 16,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: ColorConstants.appColor,
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
                            hintText: 'Enter phone number',
                            hintStyle: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 16,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                            ),
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
                          )),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      title: "Submit",
                      bgColor: ColorConstants.appColor,
                      width: Get.width * 0.5,
                      onTap: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
