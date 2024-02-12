import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Screen/splashscreen.dart';
import 'package:newdistrobo/Widgets/appColor.dart';
import '../GlobaleVarribale/Globalevarribale.dart';
import '../Screen/Aboutus.dart';
import '../Screen/ContactusPage.dart';
import '../Screen/MyFaveroutList.dart';
import '../Screen/MyOrder.dart';
import '../Screen/NewArrival.dart';
import '../Shareprefene.dart';
import '../controllers/profileController/ProfileDetailsController.dart';
import '../view/NvigationTabButton.dart';
import '../view/create_new_password.dart';

// ignore: must_be_immutable
class DrawerClass extends StatefulWidget {
  String? emailText;

  DrawerClass({super.key, required this.emailText});

  @override
  State<DrawerClass> createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  ProfileDetailsController profileDetailsController =
  Get.put(ProfileDetailsController());
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        height: Get.height * 1.3,
        width: Get.width * 0.62,
        color: Colors.white,
        alignment: Alignment.centerLeft,
        child: ListView(
          children: [
            Center(
              child: Container(
                height: Get.height * 0.27,
                width: double.infinity,
                color: ColorConstants.appColor,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9.0, right: 10),
                            child: Image.asset(
                              'assets/images/closebutton.png',
                              scale: 2.5,
                            ),
                          )),
                    ),
                    Container(
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(70)),
                        child: ClipRRect(

                          borderRadius: BorderRadius.circular(70),
                          child: profileDetailsController
                              .profiledetails.value.userDetails![0].profilePicture!="null"?
                          CachedNetworkImage(

                            imageUrl:profileDetailsController
                                .profiledetails.value.userDetails![0].profilePicture,

                            fit: BoxFit.cover,

                            placeholder: (context,
                                url) =>
                            const Center(
                                child:
                                CircularProgressIndicator(
                                  color: ColorConstants
                                      .appColor,
                                )),
                            // Optional: Show a loading indicator
                            errorWidget: (context,
                                url, error) =>
                            const Icon(Icons
                                .error), // Optional: Show an error icon
                          ): Image.asset(
                            "assets/images/demoPic.jpg",
                            fit: BoxFit.cover,

                          ),
                        ),
                      ),

                      //       : Container(
                      //     height: 90,
                      //     width: 90,
                      //     decoration: BoxDecoration(
                      //         color: Colors.green,
                      //         borderRadius: BorderRadius.circular(60)),
                      //     child: CachedNetworkImage(
                      //       imageUrl: profileDetailsController.profileModel
                      //           .value.userDetails![0].profilePicture!
                      //           .toString(),
                      //       imageBuilder: (context, imageProvider) =>
                      //           Container(
                      //             width: 90.0,
                      //             height: 90.0,
                      //             decoration: BoxDecoration(
                      //               shape: BoxShape.circle,
                      //               image: DecorationImage(
                      //                   image: imageProvider,
                      //                   fit: BoxFit.cover),
                      //             ),
                      //           ),
                      //       placeholder: (context, url) => Center(
                      //         child: CircularProgressIndicator(
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       errorWidget: (context, url, error) =>
                      //           Icon(Icons.error),
                      //     ),
                      //   ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                     "${
                        profileDetailsController
                            .profiledetails.value.userDetails![0].userName.toString()
                      } ${
                         profileDetailsController
                             .profiledetails.value.userDetails![0].lastName.toString()
                     }",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'Gilory'),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width * 0.10,
                        ),
                        Image.asset(
                          "assets/images/locationW.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Flexible(

                          child: Text(
                            currentAddress.toString()=="null"?"Update Adress":currentAddress.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[200],
                                fontFamily: "Gilroy-rg"),
                            textAlign: TextAlign.start
                            ,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ListTile(
                  onTap: () {
                    Get.to(Tab_view(
                      index: 0,
                    ));
                    Navigator.pop(context);
                  },
                  horizontalTitleGap: 0,
                  dense: true,
                  leading: IconButton(
                    icon: Image.asset(
                      'assets/images/homeu.png',
                      scale: 1.8,
                      color: ColorConstants.appColor,
                    ),
                    onPressed: () {},
                  ),
                  title: InkWell(
                      child: Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Gilroy-mg"),
                  )),
                ),
                ListTile(
                  onTap: () {
                    Get.to(AboutPage());
                  },
                  horizontalTitleGap: 0,
                  dense: true,
                  leading: IconButton(
                    onPressed: () {
                      Get.to(AboutPage());
                    },
                    icon: Image.asset(
                      'assets/images/abot.png',
                      color: ColorConstants.appColor,
                      scale: 1.8,
                    ),
                  ),
                  title: InkWell(
                      // onTap: () => //Get.to(AboutPage()),
                      child: Text(
                    "About Us",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Gilroy-mg"),
                  )),
                ),
                ListTile(
                  onTap: () {

                  latestProduct.clear();
                  latestProduct.clear();
                  callArrivalPagination.value=true;
                  new_arri_page.value=0;
                  new_currentPage.value=1;
                    Get.to(NewArrivals());
                  },
                  horizontalTitleGap: 0,
                  dense: true,
                  leading: IconButton(
                    onPressed: () {
                      // Get.to(NewArrivals());
                    },
                    icon: Image.asset(
                      'assets/images/arrivals.png',
                      color: ColorConstants.appColor,
                      scale: 1.8,
                    ),
                  ),
                  title: InkWell(
                    onTap: () {
                      Get.to(NewArrivals());
                    },
                    child: Text(
                      "New Arrival",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Gilroy-mg"),
                    ),
                  ),
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  dense: true,
                  onTap: () {
                    Get.to(CreatePassword(email: "",));
                  },
                  leading: IconButton(
                      onPressed: () {
                        // Get.to((ResetPassword()));
                      },
                      icon: Icon(
                        Icons.lock,
                        color: ColorConstants.appColor,
                      )),
                  title: InkWell(
                      // onTap: () => Get.to(ResetPassword()),
                      child: Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Gilroy-mg"),
                  )),
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  dense: true,
                  leading: IconButton(
                    onPressed: () {
                      Get.to((MyOrder()));
                    },
                    icon: Image.asset(
                      'assets/images/myorder.png',
                      color: ColorConstants.appColor,
                      scale: 1.8,
                    ),
                  ),
                  title: InkWell(
                      onTap: () => Get.to(MyOrder()),
                      child: Text(
                        "My Order",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Gilroy-mg"),
                      )),
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  dense: true,
                  onTap: () {
                    selectedIndex=2;
                    Get.offAll(Tab_view(index: 2));
                  },
                  leading: IconButton(
                    onPressed: () {
                      selectedIndex=3;
                      Get.offAll(Tab_view(index: 2));
                    },
                    icon: Icon(
                      Icons.favorite_outlined,
                      color: ColorConstants.appColor,
                    ),
                  ),
                  title: InkWell(
                      // onTap: () => Get.to(Wishlist()),
                      child: Text(
                    "My Wishlist",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Gilroy-mg"),
                  )),
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  dense: true,
                  onTap: () {
                    Get.to(ContactUs());
                  },
                  leading: IconButton(
                    onPressed: () {
                      // Get.to((ContactUs()));
                    },
                    icon: Image.asset(
                      'assets/images/contactus.png',
                      color: ColorConstants.appColor,
                      scale: 2,
                    ),
                  ),
                  title: InkWell(
                      // onTap: () => Get.to(ContactUs()),
                      child: Text(
                    "Contact Us",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Gilroy-mg"),
                  )),
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  dense: true,
                  leading: IconButton(
                    onPressed: () {
                      Get.to((()));
                    },
                    icon: Image.asset(
                      'assets/images/livelocate.png',
                      color: ColorConstants.appColor,
                    ),
                  ),
                  title: InkWell(
                      onTap: () => Get.to(()),
                      child: Text(
                        "Our Location",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Gilroy-mg"),
                      )),
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  dense: true,
                  leading: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/setting.png',
                      color: ColorConstants.appColor,
                      scale: 2,
                      height: Get.height * 0.06,
                      width: Get.width * 0.06,
                    ),
                  ),
                  title: InkWell(
                      onTap: () => Get.to(()),
                      child: Text(
                        "Our Services",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Gilroy-mg"),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: SizedBox(
                    width: Get.width * 0.5,
                    height: Get.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        // MySharedPreferences.logout();
                        SharePrefence().clearAllData();
                        print(SharePrefence().getStringData("token"));
                        print(SharePrefence().getStringData("userId"));
                        Get.to(SplashScreen());
                        // Get.to(SplashScreen());
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.appColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
