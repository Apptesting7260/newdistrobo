import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../Widgets/MyButton.dart';
import '../Widgets/TextFilled.dart';
import '../Widgets/appBar.dart';

class ProductDetailaisIncrementPage extends StatefulWidget {
  ProductDetailaisIncrementPage({super.key});

  @override
  State<ProductDetailaisIncrementPage> createState() =>
      _ProductDetailaisIncrementPageState();
}

class _ProductDetailaisIncrementPageState
    extends State<ProductDetailaisIncrementPage> {
  TextEditingController listController = TextEditingController();

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
                              onTap: () {},
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
                  Column(
                    children: [
                      SizedBox(width: Get.width * 2),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.08,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF2F3F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: Get.width * 0.1,
                                    height: Get.height * 0.05,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF53B175),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                        child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    )),
                                  ),
                                  onTap: () {
                                    showAlert();
                                  },
                                ),
                                Text(
                                  '1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF181725),
                                    fontSize: 22,
                                    fontFamily: 'Gilroy-Bold',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showAlert();
                                  },
                                  child: Container(
                                    width: Get.width * 0.1,
                                    height: Get.height * 0.05,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF53B175),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                        child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
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
              content: Container(
                height: Get.height * 0.36,
                width: Get.width * 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * .04,
                    ),
                    Text(
                      'New List',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF181725),
                        fontSize: 26,
                        fontFamily: 'Gilroy-Bold',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .02,
                    ),
                    Text(
                      'Pick a name for your new List',
                      style: TextStyle(
                        color: Color(0xFF7C7C7C),
                        fontSize: 14,
                        fontFamily: 'Gilroy-Medium',
                        fontWeight: FontWeight.w400,
                        height: 0.10,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    TextFilled(
                      controller: listController,
                      textColor: Color(0xFF7C7C7C),
                      borderColor: ColorConstants.appColor,
                      hintText: 'My list name',
                      validator: null,
                    ),
                    SizedBox(height: Get.height * .05),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              width: Get.width * 0.3,
                              height: Get.height * 0.05,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.50, color: Color(0xFF53B175)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF53B175),
                                    fontSize: 16,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ),
                        SizedBox(width: Get.width * .05),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            ShowbuttonShett();
                          },
                          child: Container(
                            width: Get.width * 0.3,
                            height: Get.height * 0.05,
                            decoration: ShapeDecoration(
                              color: Color(0xFF53B175),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Create',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                  ],
                ),
              ));
        });
  }

  ShowbuttonShett() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: Get.width,
          height: Get.height * 0.47,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Cancle',
                    style: TextStyle(
                      color: Color(0xFF8C8D8C),
                      fontSize: 16,
                      fontFamily: 'Gilroy-Bold',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Save To',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF181725),
                      fontSize: 20,
                      fontFamily: 'Gilroy-Bold',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: Get.width * 0.09,
                      height: Get.height * 0.04,
                      decoration: ShapeDecoration(
                        color: Color(0xFF53B175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.05,
                  ),
                  Container(
                      height: Get.height * 0.3,
                      width: Get.width * 0.7,
                      child: Container(
                        height: Get.height * 0.2,
                        width: Get.width,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      width: Get.width * 0.3,
                                      height: Get.height * 0.2,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF2F3F2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Container(
                                        width: Get.width * 0.05,
                                        height: Get.height * 0.025,
                                        child: Image.asset(
                                          "assets/images/candyim5.png",
                                          height: Get.height * 0.03,
                                          width: Get.width,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Text(
                                  'Shopping list 1',
                                  style: TextStyle(
                                    color: Color(0xFF0F1811),
                                    fontSize: 14,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: Get.width * 0.05,
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      width: Get.width * 0.3,
                                      height: Get.height * 0.2,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF2F3F2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Container(
                                        width: Get.width * 0.05,
                                        height: Get.height * 0.025,
                                        child: Image.asset(
                                          "assets/images/candyim5.png",
                                          height: Get.height * 0.03,
                                          width: Get.width,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Text(
                                  'Shopping list 1',
                                  style: TextStyle(
                                    color: Color(0xFF0F1811),
                                    fontSize: 14,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              Container(
                width: Get.width,
                height: Get.width * 0.159,
                decoration: BoxDecoration(color: Color(0xFF53B175)),
                child: Center(
                  child: Text(
                    'Save',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFF9FF),
                      fontSize: 18,
                      fontFamily: 'Gilroy-Bold',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
