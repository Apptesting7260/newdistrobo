import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/appColor.dart';
import '../controllers/AdressUpdateController/AddressUpdateController.dart';
import '../controllers/profileController/ProfileDetailsController.dart';
import '../utils/StatusClass.dart';

class EditeMyProfile extends StatefulWidget {
  const EditeMyProfile({super.key});

  @override
  State<EditeMyProfile> createState() => _EditeMyProfileState();
}

class _EditeMyProfileState extends State<EditeMyProfile> {
  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  AdressUpdateController adressUpdateController =
      Get.put(AdressUpdateController());
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    profileDetailsController.ProfilePageApi();
    adressUpdateController.setControllerData();
    super.initState();
  }

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
      body: Obx(() {
        switch (profileDetailsController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
                child: CircularProgressIndicator(
              color: ColorConstants.appColor,
            ));
          case Status.ERROR:
            if (profileDetailsController.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {
                  profileDetailsController.refreshApi();
                },
              );
            } else {
              return GeneralExceptionWidget(
                onPress: () {
                  profileDetailsController.refreshApi();
                },
              );
            }
          case Status.COMPLETED:
            return SingleChildScrollView(
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
                          child: Center(child: Icon(Icons.person)),
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              profileDetailsController.profiledetails.value.userDetails![0].userName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/locationW.png",
                                  height: 10,
                                ),
                                SizedBox(
                                  width: Get.width * 0.005,
                                ),
                                Text(
                                  profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1,
                                  overflow: TextOverflow.ellipsis,
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
                                      profileDetailsController.profiledetails.value.userDetails![0].userName,
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
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/editeicon.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                              ],
                            )
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        profileDetailsController.profiledetails.value.userDetails![0].userPhonenumber,
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
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/editeicon.png",
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                ],
                              )
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        profileDetailsController.profiledetails.value.userDetails![0].userEmail,
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
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/editeicon.png",
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
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
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/editeicon.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                              ],
                            )
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
                                      profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1,
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
                              InkWell(
                                onTap: () {
                                  adressUpdateController.setControllerData();
                                  ShowbuttonShett();
                                },
                                child: Image.asset(
                                  "assets/images/editeicon.png",
                                  height: 20,
                                ),
                              ),
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
            );
        }
      }),
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
                  child: Obx(() => Form(
                    key: formkey,
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: adressUpdateController.HouseNumberController.value,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: ColorConstants.appColor,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your House/Building No';
                            }
                            return null;
                          },
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: adressUpdateController.streetController.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Street Name';
                              }
                              return null;
                            },
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: adressUpdateController.areaController.value,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: ColorConstants.appColor,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Area';
                              }
                              return null;
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: adressUpdateController.countryController.value,
                            cursorColor: ColorConstants.appColor,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Country';
                              }
                              return null;
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
                              hintText: 'Enter County',
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: adressUpdateController.stateController.value,
                            cursorColor: ColorConstants.appColor,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your State';
                              }
                              return null;
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: adressUpdateController.cityController.value,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: ColorConstants.appColor,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your City';
                              }
                              return null;
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: adressUpdateController.postcodeController.value,
                            cursorColor: ColorConstants.appColor,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Post Code';
                              }
                              return null;
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
                        // Text(
                        //   'Phone Number',
                        //   style: TextStyle(
                        //     color: Color(0xFF181725),
                        //     fontSize: 18,
                        //     fontFamily: 'Gilroy-SemiBold',
                        //     fontWeight: FontWeight.w400,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: Get.height * 0.01,
                        // ),
                        // TextFormField(
                        //     controller: adressUpdateController.postcodeController.value,
                        //     keyboardType: TextInputType.emailAddress,
                        //     cursorColor: ColorConstants.appColor,
                        //     decoration: InputDecoration(
                        //       focusedBorder: UnderlineInputBorder(
                        //           borderSide:
                        //               BorderSide(color: ColorConstants.appColor)),
                        //       enabledBorder: UnderlineInputBorder(
                        //         borderSide: BorderSide(color: Color(0xffBABABA)),
                        //       ),
                        //       errorBorder: UnderlineInputBorder(
                        //           borderSide:
                        //               BorderSide(color: Color(0xffBABABA))),
                        //       focusedErrorBorder: UnderlineInputBorder(
                        //           borderSide:
                        //               BorderSide(color: Color(0xffBABABA))),
                        //       hintText: 'Enter phone number',
                        //       hintStyle: TextStyle(
                        //         color: Color(0xFF7C7C7C),
                        //         fontSize: 16,
                        //         fontFamily: 'Gilroy-Regular',
                        //         fontWeight: FontWeight.w400,
                        //       ),
                        //       prefixIcon: CountryCodePicker(
                        //         padding: EdgeInsets.only(bottom: 1),
                        //         onChanged: (element) =>
                        //             debugPrint(element.toLongString()),
                        //         initialSelection: 'IN',
                        //         showCountryOnly: false,
                        //         showOnlyCountryWhenClosed: false,
                        //         favorite: const [
                        //           '+91',
                        //           'IN',
                        //         ],
                        //         showDropDownButton: true,
                        //         showFlag: false,
                        //       ),
                        //     )),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                      ],
                    ),
                  )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      title: "Submit",
                      bgColor: ColorConstants.appColor,
                      width: Get.width * 0.5,
                      loading: adressUpdateController.resendVisible.value,
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          adressUpdateController.AdresssUpdateHitApi(context);
                        }

                        // Get.back();
                      },
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
