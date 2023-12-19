import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Screen/productItemIncrement.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../Widgets/MyButton.dart';
import '../Widgets/appBar.dart';
import 'Scaner.dart';

class ProductDetailais extends StatefulWidget {
  ProductDetailais({super.key});

  @override
  State<ProductDetailais> createState() => _ProductDetailaisState();
}

class _ProductDetailaisState extends State<ProductDetailais> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true, // Set this property to true

        title: Text(
          "MyList",
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Color(0xFF0F1811),
            fontSize: 20,
            fontFamily: 'Gilroy-SemiBold',
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 22,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Get.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  decoration: InputDecoration(
                      //zzz************************ for scanning working sotp *************************
                      suffixIcon: Container(
                          height: Get.height * 0.06,
                          width: Get.width * 0.15,
                          child: GestureDetector(
                              onTap: () {
                                Get.to(ScanPage());
                              },
                              child: Image.asset('assets/images/scano.png'))),
                      prefixIcon: Image.asset(
                        'assets/images/search.png',
                        scale: 0.9,
                      ),
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(fontFamily: 'Gilroy-rg', fontSize: 14),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 0)),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Container(
              // height: Get.height * 0.2,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  )),
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.35,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 243, 242, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      alignment: FractionalOffset.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: Get.height * 0.25,
                            width: Get.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/jerkyWeed.png",
                                height: Get.height * 0.03,
                                width: Get.width,
                              ),
                              // child: Image.network(
                              //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd_anlQxAS6NrNRrUj1Bkz2BMSUX99xsDyCZvCORB1EzBHZxgxDcKCkLzzMEpYIIg46nQ&usqp=CAU",
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 20,
                          child: Container(
                            child: Icon(
                              Icons.favorite,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alien Jerky Weed Killer Hot Beef 3.25oz',
                    style: TextStyle(
                      color: Color(0xFF181725),
                      fontSize: 22,
                      fontFamily: 'Gilroy-Bold',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    children: [
                      Text(
                        'Categories:',
                        style: TextStyle(
                          color: Color(0xFF8C8D8C),
                          fontSize: 14,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          height: 0.13,
                        ),
                      ),
                      SizedBox(width: Get.width * 0.01),
                      Text(
                        'Candy and Snacks',
                        style: TextStyle(
                          color: Color(0xFFE90D41),
                          fontSize: 12,
                          fontFamily: 'Gilroy-Regular',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Text(
                    '\$24.99',
                    style: TextStyle(
                      color: Color(0xFFED5176),
                      fontSize: 26,
                      fontFamily: 'Gilroy-Bold',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.10,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  MyButton(
                    bgColor: ColorConstants.appColor,
                    title: "Add To Cart",
                    width: Get.width,
                    style: TextStyle(
                      color: Color(0xFFFFF9FF),
                      fontSize: 18,
                      fontFamily: 'Gilroy-Bold',
                      fontWeight: FontWeight.w400,
                    ),
                    onTap: () {
                      Get.to(ProductDetailaisIncrementPage());
                    },
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    children: [
                      Text(
                        'Delivery',
                        style: TextStyle(
                          color: Color(0xFF8C8D8C),
                          fontSize: 16,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: Get.width * 0.04),
                      Text(
                        'Estimated Monday, December 4',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 16,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Get.height * 0.05),
                  Text(
                    'SKU: SW1285-24',
                    style: TextStyle(
                      color: Color(0xFF181725),
                      fontSize: 16,
                      fontFamily: 'Gilroy-SemiBold',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
