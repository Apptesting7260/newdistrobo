import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/appColor.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
            Container(
              width: Get.width,
              height: Get.height * 0.1,
              decoration: BoxDecoration(color: Color(0xFFF2F3F2)),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.05,
                  ),
                  Container(
                    width: Get.width * 0.15,
                    height: Get.height * 0.08,
                    decoration: ShapeDecoration(
                      color: Color(0xFF53B175),
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child: Text(
                        'JD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Gilroy-Bold',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  Text(
                    'John Due',
                    style: TextStyle(
                      color: Color(0xFF101811),
                      fontSize: 20,
                      fontFamily: 'Gilroy-Bold',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
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
                        radius: 30,
                        backgroundColor: Color(0xFF97F2B6),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Color(0xFF323643),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                          letterSpacing: 0.54,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.45,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 22,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          'assets/images/myorder.png',
                          color: ColorConstants.appColor,
                        ),
                        radius: 30,
                        backgroundColor: Color(0xFF97F2B6),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Text(
                        'My Orders',
                        style: TextStyle(
                          color: Color(0xFF323643),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                          letterSpacing: 0.54,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.35,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 22,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          "assets/images/profu.png",
                        ),
                        radius: 30,
                        backgroundColor: Color(0xFF97F2B6),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(
                          color: Color(0xFF323643),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                          letterSpacing: 0.54,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.4,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 22,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          "assets/images/profu.png",
                        ),
                        radius: 30,
                        backgroundColor: Color(0xFF97F2B6),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: Color(0xFF323643),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                          letterSpacing: 0.54,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.4,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 22,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          "assets/images/profu.png",
                        ),
                        radius: 30,
                        backgroundColor: Color(0xFF97F2B6),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: Color(0xFF323643),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                          letterSpacing: 0.54,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.45,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 22,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
