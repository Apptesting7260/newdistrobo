import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

//le last
class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  bool starIcon = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: Get.height * .1,
          title: Text(
            'My Order',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0F1811),
              fontSize: 20,
              fontFamily: 'Gilroy-SemiBold',
              fontWeight: FontWeight.w400,
              height: 0,
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.white,
                            border: Border.all(width: 0.5, color: Colors.grey)),
                        alignment: Alignment.topCenter,
                        height: 280,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(23)),
                                      height: 95,
                                      width: 85,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Image.asset(
                                            'assets/images/seedbeez.png'),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "David Buffalo Style Ranch\nSunflower Seeds.",
                                          style: TextStyle(
                                            color: Color(0xFF0F1811),
                                            fontSize: 16,
                                            fontFamily: 'Gilroy-SemiBold',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 7),
                                        Text("Items 3",
                                            style: TextStyle(
                                              color: Color(0xFF8C8D8C),
                                              fontSize: 14,
                                              fontFamily: 'Gilroy-Regular',
                                              fontWeight: FontWeight.w400,
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Order Id",
                                            style: TextStyle(
                                              color: Color(0xFF101811),
                                              fontSize: 12,
                                              fontFamily: 'Gilroy-Medium',
                                              fontWeight: FontWeight.w400,
                                            )),
                                        Text("##0DF2589",
                                            style: TextStyle(
                                              color: Color(0xFF101811),
                                              fontSize: 12,
                                              fontFamily: 'Gilroy-Medium',
                                              fontWeight: FontWeight.w400,
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total Product",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Gilroy-Medium',
                                              fontWeight: FontWeight.w400,
                                            )),
                                        Text("\$74.97",
                                            style: TextStyle(
                                              color: Color(0xFFED5176),
                                              fontSize: 14,
                                              fontFamily: 'Gilroy-SemiBold',
                                              fontWeight: FontWeight.w400,
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Status",
                                            style: TextStyle(
                                              color: Color(0xFF101811),
                                              fontSize: 12,
                                              fontFamily: 'Gilroy-Medium',
                                              fontWeight: FontWeight.w400,
                                            )),
                                        Text("Finished",
                                            style: TextStyle(
                                              color: Color(0xFF53B175),
                                              fontSize: 12,
                                              fontFamily: 'Gilroy-Medium',
                                              fontWeight: FontWeight.w400,
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Row(
                                        //   mainAxisAlignment:
                                        //   MainAxisAlignment.start,
                                        //   children: [
                                        //     Text("Rating",
                                        //         style: TextStyle(
                                        //             fontFamily: 'Gilroy-rg',
                                        //             fontSize: 12)),
                                        //     RatingBarIndicator(
                                        //       direction: Axis.horizontal,
                                        //       rating: 2.75,
                                        //       itemBuilder: (context, _) => Icon(
                                        //         Icons.star,
                                        //         color: Colors.amber,
                                        //       ),
                                        //       itemCount: 5,
                                        //       itemSize: 20.0,
                                        //     ),
                                        //   ],
                                        // ),
                                        SizedBox(
                                          height: Get.height * .035,
                                          width: Get.width * .23,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Center(
                                                child: Text(
                                              'Re-Order',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: 'Gilroy-SemiBold',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ColorConstants.appColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
