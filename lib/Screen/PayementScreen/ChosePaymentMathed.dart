import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Widgets/appColor.dart';
import '../../controllers/OrderController.dart';
import 'PaymentScreen.dart';

class ChosePaymentMethod extends StatefulWidget {
  const ChosePaymentMethod({super.key});

  @override
  State<ChosePaymentMethod> createState() => _ChosePaymentMethodState();
}

class _ChosePaymentMethodState extends State<ChosePaymentMethod> {
  OrderController orderController=Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(
        "Payment Method",
        style: TextStyle(
            color: Color.fromRGBO(16, 24, 17, 1),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy-sb'),
      )),
          body: Column(children: [
            GestureDetector(
              onTap: () {
                orderController.CasHOncreateOrder(context);
              },
              child: Container(
                margin:
                EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Colors.white,
                    border: Border.all(width: 0.5, color: Colors.grey)),
                alignment: Alignment.topCenter,
                height: Get.height*.15,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                  BorderRadius.circular(23)),
                              height: 85,
                              width: 75,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Image.asset(
                                      'assets/aapIcon/cashdeleveryPic.png',height: 50,width:50,),
                                ),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          const Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cash on delivery",
                                  style: TextStyle(
                                      color: Color.fromRGBO(16, 24, 17, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Gilroy-sb'),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(PaymentScreen());
              },
              child: Container(
                margin:
                EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Colors.white,
                    border: Border.all(width: 0.5, color: Colors.grey)),
                alignment: Alignment.topCenter,
                height: Get.height*.15,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                  BorderRadius.circular(23)),
                              height: 85,
                              width: 75,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Image.asset(
                                      'assets/aapIcon/onlinePayment.png',height: 50,width:50,),
                                ),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          const Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Debit Card",
                                  style: TextStyle(
                                      color: Color.fromRGBO(16, 24, 17, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Gilroy-sb'),
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            )
          ]),


    ));
  }
}
