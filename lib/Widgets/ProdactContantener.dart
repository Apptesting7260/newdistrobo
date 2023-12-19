import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Screen/MyCart.dart';
import 'MyButton.dart';
import 'appColor.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
  }
}
