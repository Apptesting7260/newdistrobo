import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/MyButton.dart';
import '../Widgets/ProdactContantener.dart';
import '../Widgets/appColor.dart';
import 'Scaner.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
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
        return ProductView();
      },
    );
  }
}
