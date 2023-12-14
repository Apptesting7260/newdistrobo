import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
      onTap: () {

      },
      child: Card(
        child: Container(
          height: Get.height * 0.45,
          width: Get.width * 0.56,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.01,
              ),
              GestureDetector(
                onTap: () {


                  ;
                },
                child: Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd_anlQxAS6NrNRrUj1Bkz2BMSUX99xsDyCZvCORB1EzBHZxgxDcKCkLzzMEpYIIg46nQ&usqp=CAU",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              GestureDetector(
                onTap: () {

                },
                child: Text(
                  "title",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Gilroy',
                      color:
                      Color.fromRGBO(9, 64, 94, 1)),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                "about",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Gilroy',
                    color:
                    Color.fromRGBO(9, 64, 94, 1)),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                '50',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Gilroy',
                    color: Color.fromRGBO(
                        214, 51, 72, 1)),
              ),

              SizedBox(
                height: Get.height * 0.015,
              ),
              Container(
                  child: MyButton(title: 'Add to Cart', onTap: () {  },bgColor: ColorConstants.appColor,
                  width: Get.width*0.5,),
                  )



            ],
          ),
        ),
      ),
    );

  }
}
