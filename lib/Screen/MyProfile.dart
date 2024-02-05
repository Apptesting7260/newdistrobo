import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Screen/splashscreen.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';

import '../Shareprefene.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/appColor.dart';
import '../controllers/profileController/ProfileDetailsController.dart';
import '../utils/StatusClass.dart';
import 'EditProfile.dart';
import 'MyOrder.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    // profileDetailsController.ProfilePageApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Set this property to true
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 20,
              fontFamily: 'Gilroy-sb',
              fontWeight: FontWeight.bold),
        ),
        //       leading: IconButton(
        //       onPressed: () {
        // Get.back();
        // },
        //     icon: Icon(
        //       Icons.arrow_back_ios_new_sharp,
        //       size: 22,
        //     ))
      ),
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
            return RefreshIndicator(child:SingleChildScrollView(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: profileDetailsController.profiledetails.value
                                .userDetails![0].profilePicture !=
                                "null"
                                ? CachedNetworkImage(
                              imageUrl: profileDetailsController
                                  .profiledetails
                                  .value
                                  .userDetails![0]
                                  .profilePicture,

                              fit: BoxFit.cover,

                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorConstants.appColor,
                                  )),
                              // Optional: Show a loading indicator
                              errorWidget: (context, url, error) =>
                              const Icon(Icons
                                  .error), // Optional: Show an error icon
                            )
                                : Image.asset(
                              "assets/images/demoPic.jpg",
                              fit: BoxFit.cover,
                            ),
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
                              "${profileDetailsController.profiledetails.value.userDetails![0].userName.toString()} ${profileDetailsController.profiledetails.value.userDetails![0].lastName.toString()}",
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
                                  profileDetailsController.profiledetails.value
                                      .userDetails![0].userAddress!.address_1==""?
                                      "Update Address":
                                  profileDetailsController.profiledetails.value
                                      .userDetails![0].userAddress!.address_1,
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
                              width: Get.width * 0.025,
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
                                  "${profileDetailsController.profiledetails.value.userDetails![0].userName.toString()} ${profileDetailsController.profiledetails.value.userDetails![0].lastName.toString()}",
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
                          height: Get.height * 0.025,
                        ),
                        InkWell(
                          onTap: () {
                            // Get.to(MyOrder());
                          },
                          child: Row(
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
                                    profileDetailsController.profiledetails
                                        .value.userDetails![0].userPhonenumber,
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
                                    profileDetailsController.profiledetails
                                        .value.userDetails![0].userEmail,
                                    style: TextStyle(
                                      color: Color(0xFF8C8D8C),
                                      fontSize: 14,
                                      fontFamily: 'Gilroy-Regular',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
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
                              Column(
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
                                    profileDetailsController
                                        .profiledetails
                                        .value
                                        .userDetails![0]
                                        .userAddress!
                                        .address_1,
                                    style: TextStyle(
                                      color: Color(0xFF8C8D8C),
                                      fontSize: 14,
                                      fontFamily: 'Gilroy-Regular',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
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
                            SharePrefence().clearAllData();
                            Get.to(SplashScreen());
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  "assets/images/Logout.png",
                                  height: Get.height * 0.06,
                                  width: Get.width * 0.06,
                                ),
                                radius: 24,
                                backgroundColor: Color(0xFFF2F3F2),
                              ),
                              SizedBox(
                                width: Get.width * 0.03,
                              ),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Color(0xFF53B175),
                                  fontSize: 18,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        MyButton(
                          title: 'Edit Profile',
                          bgColor: ColorConstants.appColor,
                          width: Get.width * 0.5,
                          loading: false,
                          onTap: () {
                            Get.to(EditeMyProfile());
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ), onRefresh: ()async {
              profileDetailsController.refreshApi();
            },color: ColorConstants.appColor,);;
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
