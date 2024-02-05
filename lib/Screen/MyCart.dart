import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../controllers/CartDetailsDeleteApi/CartDetailsDeletecontroller.dart';
import '../controllers/CartQuantityUpdateController/CartQuantityUpdateController.dart';
import '../controllers/GetCartDetailsController/GetCartDetailsController.dart';
import '../utils/StatusClass.dart';
import '../view/NvigationTabButton.dart';
import 'ScheduleDelivery.dart';
import 'ShopPage.dart';

class MyCart extends StatefulWidget {
  const MyCart({
    super.key,
  });

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  GetCartDetailsController getCartDetailsController =
      Get.put(GetCartDetailsController());
  CartQuantityUpdateController cartQuantityUpdateController=Get.put(CartQuantityUpdateController());
  CartDeleteController cartDeleteController=Get.put(CartDeleteController());

  @override
  void initState() {
    getCartDetailsController.GetCartDatailsApiHit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "MY Cart",
            style: TextStyle(
                color: Color.fromRGBO(16, 24, 17, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gilroy-sb'),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Show the alert dialog when the IconButton is pressed
                deleteShowAlert();
              },
              icon: Image.asset(
                "assets/images/delete.png",
                height: Get.height * 0.06,
                width: Get.width * 0.06,
              ),
            ),
            SizedBox(width: Get.width*.003,)
          ],
        ),
        body: Obx(() {
          switch (getCartDetailsController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorConstants.appColor,
              ));
            case Status.ERROR:
              if (getCartDetailsController.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {
                    getCartDetailsController.refreshApi();
                  },
                );
              } else {
                return GeneralExceptionWidget(
                  onPress: () {
                    getCartDetailsController.refreshApi();
                  },
                );
              }
            case Status.COMPLETED:
              getCartDetailsController.getCartDetails.value.localitemCont.value=int.parse(getCartDetailsController.getCartDetails.value.itemCount.toString());
              getCartDetailsController.getCartDetails.value.totals!.localTotal.value=int.parse(getCartDetailsController.getCartDetails.value.totals!.total.toString());
              return getCartDetailsController
                          .getCartDetails.value.items!.length ==
                      0
                  ? EmptyCart()
                  : RefreshIndicator(child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: Get.width * 0.1,
                  //     ),
                  //     // IconButton(
                  //     //   onPressed: () {
                  //     //     Get.back();
                  //     //   },
                  //     //   icon: Icon(
                  //     //     Icons.arrow_back_ios_new_sharp,
                  //     //     size: 22,
                  //     //   ),
                  //     // ),
                  //     Row(
                  //       children: [
                  //         SizedBox(
                  //           width: Get.width * 0.26,
                  //         ),
                  //         Text(
                  //           "MY Cart",
                  //           style: TextStyle(
                  //               color: Color.fromRGBO(16, 24, 17, 1),
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'Gilroy-sb'),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         SizedBox(
                  //           width: Get.width * 0.25,
                  //         ),
                  //         IconButton(
                  //           onPressed: () {
                  //             // Show the alert dialog when the IconButton is pressed
                  //             // deleteShowAlert();
                  //           },
                  //           icon: Image.asset(
                  //             "assets/images/delete.png",
                  //             height: Get.height * 0.06,
                  //             width: Get.width * 0.06,
                  //           ),
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Obx(() =>      Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal: \$ ${int.parse(getCartDetailsController.getCartDetails.value.totals!.localTotal.value.toString()) / 100}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy'),
                            ),
                            Text(
                              "${getCartDetailsController.getCartDetails.value.localitemCont.value} items",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-sb'),
                            ),
                          ],
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  MyButton(
                    title: "Schedule Delivery",
                    bgColor: ColorConstants.appColor,
                    width: Get.width * 0.9,
                    onTap: () {
                      Get.to(ScheduleDelivery());
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: getCartDetailsController
                            .getCartDetails.value.items!.length,
                        itemBuilder: (context, index) {
                          // Parse price as double
                          print(getCartDetailsController
                              .getCartDetails.value.items!.length);
                          // counter3=myCartController.myCartData.value.items![index].quantity!.value!;
                          getCartDetailsController
                              .getCartDetails.value.items![index]!.quantity!.quantity.value=getCartDetailsController
                              .getCartDetails.value.items![index]!.quantity!.value;


                          return Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Container(
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 10,vertical: 0),
                              height: Get.height*.2,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(bottom:  Radius.zero),
                                  // border: Border.all(
                                  //     color: Colors.grey, width: 0.2),
                                  border: Border.symmetric(horizontal: BorderSide(color: Colors.grey, width: 0.2))
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                borderRadius:
                                                BorderRadius.circular(
                                                    23)),
                                            height: Get.height*0.18,
                                            width: Get.width*0.3,
                                            child: Padding(
                                                padding:
                                                const EdgeInsets.all(
                                                    15.0),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                  getCartDetailsController
                                                      .getCartDetails
                                                      .value
                                                      .items![index]
                                                      .featuredImage,
                                                  placeholder: (context,
                                                      url) =>
                                                      Center(
                                                          child:
                                                          CircularProgressIndicator(color: ColorConstants.appColor,)),
                                                  errorWidget: (context,
                                                      url, error) =>
                                                      Icon(Icons
                                                          .error), // Customize the error widget as needed.
                                                ))),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 18),
                                          Row(
                                            children: [
                                              Container(
                                                width: Get.width * 0.42,
                                                child: Text(
                                                  getCartDetailsController
                                                      .getCartDetails
                                                      .value
                                                      .items![index]
                                                      .name,
                                                  softWrap: true,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    //overflow: TextOverflow.ellipsis,
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      'Gilroy-sb'),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                    'assets/images/delete.png',
                                                    width:
                                                    Get.width * 0.05,
                                                    height:
                                                    Get.height * 0.05,
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Obx( () {
                                            return Row(

                                              children: [
                                                Container(
                                                  width: Get.width * 0.22,
                                                  child: Text(
                                                    "\$ ${(int.parse(getCartDetailsController.getCartDetails.value.items![index].price)*getCartDetailsController
                                                        .getCartDetails
                                                        .value
                                                        .items![
                                                    index]
                                                        .quantity!
                                                        .quantity.value)  / 100}",
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        color: Colors.red,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontFamily:
                                                        'Gilroy-sb'),
                                                  ),
                                                ),

                                                GestureDetector(
                                                  onTap: () {

                                                    getCartDetailsController
                                                        .checkindex.value = index;






                                                    if( getCartDetailsController
                                                        .getCartDetails
                                                        .value
                                                        .items![
                                                    index]
                                                        .quantity!
                                                        .quantity.value>1){
                                                      getCartDetailsController
                                                          .getCartDetails
                                                          .value
                                                          .items![
                                                      index]
                                                          .quantity!
                                                          .quantity.value-=1;

                                                      getCartDetailsController.getCartDetails.value.totals!.localTotal.value-=int.parse(getCartDetailsController.getCartDetails.value.items![index].price);
                                                      getCartDetailsController.getCartDetails.value.localitemCont.value-=1;
                                                    }

                                                    print( getCartDetailsController
                                                        .getCartDetails
                                                        .value
                                                        .items![
                                                    index]
                                                        .quantity!
                                                        .quantity.value);



                                                    Future.delayed(
                                                        Duration(seconds: 1), () {
                                                      cartQuantityUpdateController
                                                          .cartQuantityUpdateApi(
                                                          getCartDetailsController
                                                              .getCartDetails
                                                              .value
                                                              .items![index]
                                                              .itemKey
                                                              .toString(),
                                                          (int.parse(
                                                            getCartDetailsController
                                                                .getCartDetails
                                                                .value
                                                                .items![
                                                            index]
                                                                .quantity!
                                                                .quantity
                                                                .toString(),
                                                          ) )
                                                              .toString());
                                                      //           if (_signUpGlobalKey.currentState!.validate()) {
                                                      // Get.to(()=>MyCart());

                                                      // }
                                                      // getCartDetailsController

                                                      // Get.to(()=>MyCart());
                                                    });


                                                  },
                                                  child: Container(
                                                    height:
                                                    Get.height * 0.05,
                                                    width: Get.width * 0.1,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        ColorConstants
                                                            .appColor,
                                                        border: Border.all(
                                                            color:
                                                            ColorConstants
                                                                .appColor,
                                                            width: 0.2,
                                                            style:
                                                            BorderStyle
                                                                .solid),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            8)),
                                                    child: Center(
                                                        child:  Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Center(
                                                    child: Text(
                                                      getCartDetailsController
                                                          .getCartDetails
                                                          .value
                                                          .items![index]
                                                          .quantity!
                                                          .quantity.value
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontFamily: 'Gilroy'),
                                                    )),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartQuantityUpdateController.addToCart.value=false;
                                                    getCartDetailsController
                                                        .checkindex.value = index;

                                                    Future.delayed(Duration(seconds: 1),() {
                                                      cartQuantityUpdateController
                                                          .cartQuantityUpdateApi(
                                                          getCartDetailsController
                                                              .getCartDetails
                                                              .value
                                                              .items![index]
                                                              .itemKey
                                                              .toString(),
                                                          (int.parse(
                                                            getCartDetailsController
                                                                .getCartDetails
                                                                .value
                                                                .items![
                                                            index]
                                                                .quantity!
                                                                .quantity.value
                                                                .toString(),
                                                          ))
                                                              .toString());
                                                    }, );
                                                    // if( cartQuantityUpdateController.addToCart.value==true){

                                                    print("dsfsfdgd=====================");

                                                    getCartDetailsController
                                                        .getCartDetails
                                                        .value
                                                        .items![
                                                    index]
                                                        .quantity!
                                                        .quantity.value+=1;

                                                    print( getCartDetailsController
                                                        .getCartDetails
                                                        .value
                                                        .items![
                                                    index]
                                                        .quantity!
                                                        .quantity.value);

                                                    getCartDetailsController.getCartDetails.value.totals!.localTotal.value+=int.parse(getCartDetailsController.getCartDetails.value.items![index].price);
                                                    getCartDetailsController.getCartDetails.value.localitemCont.value+=1;



                                                    //}


                                                  },
                                                  child: Container(
                                                    height:
                                                    Get.height * 0.05,
                                                    width: Get.width * 0.1,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        ColorConstants
                                                            .appColor,
                                                        border: Border.all(
                                                            color:
                                                            ColorConstants
                                                                .appColor,
                                                            width: 0.2,
                                                            style:
                                                            BorderStyle
                                                                .solid),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            8)),
                                                    child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            );
                                          })
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ), onRefresh: () async{
                getCartDetailsController.refreshApi();

              },
            color: ColorConstants.appColor,

              );
          }
        }),
      ),
    );
  }

  Widget EmptyCart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
          "assets/aapIcon/CartIcon.png",
          height: 120,
        )),
        SizedBox(
          height: Get.width * 0.03,
        ),
        Text(
          'Your Cart Is empty',
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
          "  Looks like you haven't added anything to your \n cart yet'",
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
          title: "Add Items",
          width: Get.width * 0.7,
          bgColor: ColorConstants.appColor,
          onTap: () {
            Get.to(ShopPage());
          },
        )
      ],
    );
  }

  deleteShowAlert() {
    showDialog(
      context: context,
      // You can access the BuildContext if you're inside a widget that has access to it
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
         Row(children: [  MyButton(title: "Cancel",
           bgColor: ColorConstants.appColor,
           width: Get.width*.3,
           height: Get.height*.05,
           onTap: () {
             Get.back();
         },),
           SizedBox( width: Get.width*.03,),
           MyButton(title: "Delete",bgColor: ColorConstants.appColor,
             width: Get.width*.3,
             height: Get.height*.05,
             onTap: () {
               cartDeleteController.cartDeleteApi();
           },)],)
          ],
        );
      },
    );
  }
}
