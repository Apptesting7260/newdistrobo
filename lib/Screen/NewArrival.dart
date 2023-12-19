import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Screen/MyCart.dart';

import '../Widgets/MyButton.dart';
import '../Widgets/ProdactContantener.dart';
import '../Widgets/appColor.dart';
import 'Scaner.dart';

class NewArrivals extends StatefulWidget {
  const NewArrivals({super.key});

  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: Get.height * .1,
        title: Text(
          'Beef Jerky',
          textAlign: TextAlign.center,
          style: TextStyle(
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
              size: 24,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
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
                                  child:
                                      Image.asset('assets/images/scano.png'))),
                          prefixIcon: Image.asset(
                            'assets/images/search.png',
                            scale: 0.9,
                          ),
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(fontFamily: 'Gilroy-rg', fontSize: 14),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 0)),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Grideview()
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget Grideview() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: Get.height * 0.4),
      itemCount: 6,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            child: Container(
              // height: Get.height * 0.2,
              width: Get.width * 0.38,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.018,
                  ),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: Get.height * 0.18,
                          width: Get.width * 0.32,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(242, 243, 242, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/candyim5.png"),
                            // child: Image.network(
                            //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd_anlQxAS6NrNRrUj1Bkz2BMSUX99xsDyCZvCORB1EzBHZxgxDcKCkLzzMEpYIIg46nQ&usqp=CAU",
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 8,
                        child: Container(
                          child: Image.asset(
                            'assets/images/arrivals.png',
                            color: ColorConstants.appColor,
                            scale: 1.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Alien Jerky Weed Killer Hot Beef 3.25oz",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gilroy',
                            color: Color.fromRGBO(9, 64, 94, 1)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(
                          '\$9.99',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Gilroy',
                              color: Color.fromRGBO(214, 51, 72, 1)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Container(
                      child: MyButton(
                    title: 'Add to Cart',
                    onTap: () {
                      Get.to(MyCart());
                    },
                    bgColor: ColorConstants.appColor,
                    width: Get.width * 0.28,
                    height: Get.height * 0.05,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Gilroy-SemiBold',
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
