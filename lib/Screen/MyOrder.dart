import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../controllers/MyOrderController/MyOrderController.dart';
import '../utils/StatusClass.dart';
import '../view/NvigationTabButton.dart';

//le last
class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  bool starIcon = false;
  MyOrderController myOrderController = Get.put(MyOrderController());

  void _onItemTapped(int index) {
    if (selectedIndex == index) {
      print(index);
      setState(() {
        selectedIndex = index; // Update selected index
      });
    } else {
      Get.offAll(Tab_view(index: index));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    myOrderController.MyOrderAPi();
    super.initState();
  }

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
        body: Obx(() {
          switch (myOrderController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorConstants.appColor,
              ));
            case Status.ERROR:
              if (myOrderController.error.value == 'No internet') {
                return Center(
                  child: InterNetExceptionWidget(
                    onPress: () {
                      myOrderController.refreshApi();
                    },
                  ),
                );
              } else {
                return GeneralExceptionWidget(
                  onPress: () {
                    myOrderController.refreshApi();
                  },
                );
              }
            case Status.COMPLETED:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child:   myOrderController
              .sheduleDelever.value.orderDetails!.length==0 ? EmptyOrder() : ListView.builder(
                          itemCount: myOrderController
                              .sheduleDelever.value.orderDetails!.length,
                          itemBuilder: (context, index) {
                            if (myOrderController
                                        .sheduleDelever.value.orderDetails ==
                                    [] &&
                                myOrderController
                                        .sheduleDelever.value.orderDetails ==
                                    null) {
                              return Container();
                            } else {
                              var name = myOrderController.sheduleDelever.value
                                  .orderDetails?[index].ItemTitle;
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(23),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0.5, color: Colors.grey)),
                                alignment: Alignment.topCenter,
                                height: 280,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              alignment: Alignment.topLeft,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          23)),
                                              height: 95,
                                              width: 85,
                                              child: Center(
                                                child: CachedNetworkImage(
                                                  imageUrl: myOrderController
                                                      .sheduleDelever
                                                      .value
                                                      .orderDetails?[index]
                                                      .ItemName,
                                                  // width: Get.width * 1,
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                    color:
                                                        ColorConstants.appColor,
                                                  )),
                                                  // Optional: Show a loading indicator
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons
                                                          .error), // Optional: Show an error icon
                                                ),
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Container(
                                              width: Get.width * .6,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    myOrderController
                                                        .sheduleDelever
                                                        .value
                                                        .orderDetails?[index]
                                                        .ItemTitle,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Color(0xFF0F1811),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Gilroy-SemiBold',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(height: 7),
                                                  Text(
                                                      "Items ${myOrderController.sheduleDelever.value.orderDetails?[index].ItemQuantity}",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF8C8D8C),
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Gilroy-Regular',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Order Id",
                                                    style: TextStyle(
                                                      color: Color(0xFF101811),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Gilroy-Medium',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                Text(
                                                    myOrderController
                                                        .sheduleDelever
                                                        .value
                                                        .orderDetails?[index]
                                                        .ID,
                                                    style: TextStyle(
                                                      color: Color(0xFF101811),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Gilroy-Medium',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Total Product",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Gilroy-Medium',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                Text(
                                                    "\$ ${myOrderController.sheduleDelever.value.orderDetails?[index].Value}",
                                                    style: TextStyle(
                                                      color: Color(0xFFED5176),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Gilroy-SemiBold',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Status",
                                                    style: TextStyle(
                                                      color: Color(0xFF101811),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Gilroy-Medium',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                Text(
                                                    myOrderController
                                                        .sheduleDelever
                                                        .value
                                                        .orderDetails?[index]
                                                        .OrderStatus,
                                                    style: TextStyle(
                                                      color: Color(0xFF53B175),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Gilroy-Medium',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
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
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            'Gilroy-SemiBold',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )),
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            ColorConstants
                                                                .appColor,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                            }
                          }),
                    )
                  ],
                ),
              );
          }
        }),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          // Set the current index
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,

          selectedItemColor: ColorConstants.appColor,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(
            color: ColorConstants.appColor,
          ),
          unselectedIconTheme: const IconThemeData(
            color: const Color(0xffADADAD),
          ),
          elevation: 8,
          backgroundColor: Colors.white,
          selectedFontSize: 12,
          unselectedFontSize: 10,

          selectedLabelStyle: const TextStyle(color: ColorConstants.appColor),
          // Selected label color
          unselectedLabelStyle: const TextStyle(color: const Color(0xffADADAD)),
          // Unselected label color

          // Callback for when an item is tapped
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: ImageIcon(
                AssetImage("assets/aapIcon/colorhome.png"),
                color: selectedIndex == 0 ? Colors.green : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: "Shop",
              icon: ImageIcon(
                AssetImage("assets/aapIcon/CategorycolorIcon.png"),
                color: selectedIndex == 1 ? Colors.green : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: "My List",
              icon: ImageIcon(
                AssetImage("assets/aapIcon/Heart.png"),
                color: selectedIndex == 2 ? Colors.green : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: ImageIcon(
                AssetImage("assets/aapIcon/ColorCart.png"),
                color: selectedIndex == 3 ? Colors.green : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: ImageIcon(
                AssetImage("assets/aapIcon/profilrimagecolor.png"),
                color: selectedIndex == 4 ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget EmptyOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
              "assets/aapIcon/EmtyOrder.png",
              height: 120,
            )),
        SizedBox(
          height: Get.width * 0.03,
        ),
        Text(
          'Your Order History is empty',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF181725),
            fontSize: 20,
            fontFamily: 'Gilroy-Bold',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: Get.width * 0.03,
        ),
        Text(
          "  Looks like you haven't made your \n order yet'",
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            color: Color(0xFF777777),
            fontSize: 14,
            fontFamily: 'Gilroy-Regular',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: Get.width * 0.1,
        ),
        MyButton(
          title: "Start Shopping",
          width: Get.width * 0.7,
          bgColor: ColorConstants.appColor,
          onTap: () {
            selectedIndex = 1;
            Get.offAll(Tab_view(index: 1));
          },
        )
      ],
    );
  }
}
