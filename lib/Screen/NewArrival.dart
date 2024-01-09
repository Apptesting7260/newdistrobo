import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Screen/MyCart.dart';

import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/ProdactContantener.dart';
import '../Widgets/appColor.dart';
import '../controllers/NewArrivalsController/NewArrivalController.dart';
import '../controllers/whishlitcontroller/wishlistController.dart';
import '../utils/StatusClass.dart';
import 'Scaner.dart';

class NewArrivals extends StatefulWidget {
  const NewArrivals({super.key});

  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  NewArrivalController newArrivalController = Get.put(NewArrivalController());
  ScrollController scrollController = ScrollController();
  WhishlistAddController whishlistAddController =
      Get.put(WhishlistAddController());
  RxBool gridEnd = false.obs;

  void initState() {
    // fetchData();
    fetchData();

    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          print("callll");
          fetchData();
        }
      },
    );
    // TODO: implement initState
    super.initState();
  }

  RxBool noMoreData = false.obs;

  fetchData() async {
    print(' callin funation');
    gridEnd.value = true;
    print(callArrivalPagination.value);
    if (callArrivalPagination.value == true) {
      print('calling it ');
      print('Length ===> ${latestProduct.length}');
      print("Pageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee ->>>>>>> ${new_arri_page}");
      newArrivalController.page_no = new_arri_page.toString().obs;
      newArrivalController.NewArrivalPageApi(true);
      callArrivalPagination.value = false;
    } else {
      print('not callin');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(latestProduct.length);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              toolbarHeight: Get.height * .1,
              title: Text(
                'New Arrivals',
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
            body: Obx(() {
              switch (newArrivalController.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(
                      child: CircularProgressIndicator(
                    color: ColorConstants.appColor,
                  ));
                case Status.ERROR:
                  if (newArrivalController.error.value == 'No internet') {
                    return InterNetExceptionWidget(
                      onPress: () {
                        newArrivalController.refreshApi(true);
                      },
                    );
                  } else {
                    return GeneralExceptionWidget(
                      onPress: () {
                        newArrivalController.refreshApi(true);
                      },
                    );
                  }
                case Status.COMPLETED:
                  return SingleChildScrollView(
                    controller: scrollController,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                                          child: Image.asset(
                                              'assets/images/scano.png'))),
                                  prefixIcon: Image.asset(
                                    'assets/images/search.png',
                                    scale: 0.9,
                                  ),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Gilroy-rg', fontSize: 14),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 0)),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.03),
                          Container(
                            // height: Get.height,
                            child: GrideView(),
                            //        child: GridView.builder(
                            //          shrinkWrap: true,
                            //          physics: NeverScrollableScrollPhysics(),
                            //          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            //              crossAxisCount: 2,
                            //              crossAxisSpacing: 8,
                            //              mainAxisSpacing: 8,
                            //              mainAxisExtent: Get.height * 0.39),
                            //          itemCount: latestProduct.value.length,
                            //
                            //          itemBuilder: (BuildContext context, int index) {
                            //            print(latestProduct.value.length);
                            //     if (index < latestProduct.value.length) {
                            //       return Card(
                            //         child: Container(
                            //           // height: Get.height * 0.2,
                            //           width: Get.width * 0.38,
                            //           decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(20),
                            //   )),
                            //           child: Column(
                            // children: [
                            //   SizedBox(
                            //     height: Get.height * 0.018,
                            //   ),
                            //   Stack(
                            //     children: [
                            //       GestureDetector(
                            //         onTap: () {},
                            //         child: Container(
                            //           height: Get.height * 0.18,
                            //           width: Get.width * 0.32,
                            //           decoration: BoxDecoration(
                            //               color: Color.fromRGBO(242, 243, 242, 1),
                            //               borderRadius: BorderRadius.circular(20)),
                            //           child: ClipRRect(
                            //             borderRadius: BorderRadius.circular(20),
                            //             child: Image.asset("assets/images/candyim5.png"),
                            //             // child: Image.network(
                            //             //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd_anlQxAS6NrNRrUj1Bkz2BMSUX99xsDyCZvCORB1EzBHZxgxDcKCkLzzMEpYIIg46nQ&usqp=CAU",
                            //             //   fit: BoxFit.cover,
                            //             // ),
                            //           ),
                            //         ),
                            //       ),
                            //       Positioned(
                            //         right: 8,
                            //         top: 8,
                            //         child: Container(
                            //           child: Icon(
                            //             Icons.favorite,
                            //             size: 18,
                            //             color: Colors.red,
                            //           ),
                            //         ),
                            //       ),
                            //       Positioned(
                            //         left: 8,
                            //         top: 8,
                            //         child: Container(
                            //           child: Image.asset(
                            //             'assets/images/arrivals.png',
                            //             color: ColorConstants.appColor,
                            //             scale: 1.8,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            //   SizedBox(
                            //     height: Get.height * 0.02,
                            //   ),
                            //   Container(
                            //     height: Get.height * 0.04,
                            //     child: Padding(
                            //       padding: const EdgeInsets.only(left: 15.0),
                            //       child: GestureDetector(
                            //         onTap: () {},
                            //         child: Text(
                            //           latestProduct[index].productName,
                            //           maxLines: 2,
                            //           overflow: TextOverflow.ellipsis,
                            //           style: TextStyle(
                            //               fontSize: 10,
                            //               fontWeight: FontWeight.w400,
                            //               fontFamily: 'Gilroy',
                            //               color: Color.fromRGBO(9, 64, 94, 1)),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            //   SizedBox(
                            //     height: Get.height * 0.01,
                            //   ),
                            //   Padding(
                            //     padding: const EdgeInsets.only(left: 15.0),
                            //     child: Row(
                            //       children: [
                            //         Text(
                            //           '\$ ${latestProduct[index].productPrice}',
                            //           style: TextStyle(
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.w600,
                            //               fontFamily: 'Gilroy',
                            //               color: Color.fromRGBO(214, 51, 72, 1)),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            //   SizedBox(
                            //     height: Get.height * 0.015,
                            //   ),
                            //   Container(
                            //       child: MyButton(
                            //         title: 'Add to Cart',
                            //         onTap: () {
                            //           Get.to(MyCart());
                            //         },
                            //         bgColor: ColorConstants.appColor,
                            //         width: Get.width * 0.28,
                            //         height: Get.height * 0.05,
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 10,
                            //           fontFamily: 'Gilroy-SemiBold',
                            //           fontWeight: FontWeight.w400,
                            //         ),
                            //       )),
                            // ],
                            //           ),
                            //         ),
                            //       );
                            //     }
                            //          },
                            //        ),
                            // child: Grideview(),
                          ),
                          if (newArrivalController.isLoading.value)
                            CircularProgressIndicator(
                              color: ColorConstants.appColor,
                            ),
                          SizedBox(
                            height: Get.height * 0.005,
                          )

                        ],
                      ),
                    ),
                  );
              }
            })));
  }

  Widget GrideView() {
    return Container(

      child:  GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: Get.height * 0.39),
        itemCount: latestProduct.length,
        itemBuilder: (BuildContext context, int index) {
          print(latestProduct.length);
          if (index < latestProduct.length) {
            return Card(
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
                              child: CachedNetworkImage(
                                imageUrl: latestProduct[index].productImage.toString(),
                                width: Get.width * 1,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: ColorConstants.appColor,
                                    )),
                                // Optional: Show a loading indicator
                                errorWidget: (context, url, error) => const Icon(
                                    Icons.error), // Optional: Show an error icon
                              ),
                              // child: Image.network(
                              //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd_anlQxAS6NrNRrUj1Bkz2BMSUX99xsDyCZvCORB1EzBHZxgxDcKCkLzzMEpYIIg46nQ&usqp=CAU",
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                        ),
                        Obx(
                              () => Positioned(
                              right: 8,
                              top: 8,
                              child: latestProduct![index]!.isLoding.value
                                  ? CupertinoActivityIndicator(
                                color: ColorConstants.appColor,
                              )
                                  : GestureDetector(
                                onTap: () {
                                  productId = latestProduct![index]
                                      .productId
                                      .toString();
                                  if (productId != null) {
                                    whishlistAddController
                                        .latestProductWhishLisAddPageApi(
                                        index);
                                    latestProduct![index]!
                                        .isLoding
                                        .value = true;
                                    print(latestProduct![index]!
                                        .isLoding
                                        .value);
                                  }
                                },
                                child: Container(
                                  child: latestProduct![index]
                                      .productWishlist ==
                                      true
                                      ? Icon(
                                    Icons.favorite,
                                    size: 18,
                                    color: Colors.red,
                                  )
                                      : Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                  ),
                                ),
                              )),
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
                    Container(
                      height: Get.height * 0.04,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            latestProduct[index].productName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Gilroy',
                                color: Color.fromRGBO(9, 64, 94, 1)),
                          ),
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
                            '\$ ${latestProduct[index].productPrice}',
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
                      child:
                      latestProduct[index].productQuantity!="Out of Stock"&&
                          latestProduct[index].productQuantity!=null?
                      MyButton(
                        title: 'Add to Cart',
                        onTap: () {
                          // Get.to(MyCart());
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
                      ):  Container(
                        width: Get.width * 0.28,
                        height: Get.height * 0.05,
                        decoration: ShapeDecoration(
                          color: Color(0xFF53B175),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Center(
                          child: Text(
                            'Out of Stock',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Gilroy-SemiBold',
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                        ),
                      )

                    ),
                  ],
                ),
              ),
            );
          }  return SizedBox.shrink();
        }

    ));

  }
// Widget Grideview() {
//   return Container(
//       child: GridView.builder(
//
//         itemCount: latestProduct.length,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 8,
//             mainAxisExtent: Get.height * 0.39),
//         itemBuilder: (context, index) {
//           print(latestProduct.length);
//           print(index);
//           if (index < latestProduct.length) {
//             return Card(
//               child: Container(
//                 height: Get.height * 0.35,
//                 width: Get.width * 0.38,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     )),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: Get.height * 0.018,
//                     ),
//                     Stack(
//                       children: [
//                         Container(
//                           height: Get.height * 0.18,
//                           width: Get.width * 0.32,
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(242, 243, 242, 1),
//                               borderRadius: BorderRadius.circular(20)),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: CachedNetworkImage(
//                               imageUrl: latestProduct[index].productImage,
//                               width: Get.width * 1,
//                               fit: BoxFit.cover,
//                               placeholder: (context, url) => const Center(
//                                   child: CircularProgressIndicator(
//                                     color: ColorConstants.appColor,
//                                   )),
//                               // Optional: Show a loading indicator
//                               errorWidget: (context, url, error) => const Icon(
//                                   Icons.error), // Optional: Show an error icon
//                             ),
//                           ),
//                         ),
//                         Obx(
//                               () => Positioned(
//                               right: 8,
//                               top: 8,
//                               child: ProductCategoryLists![index]!.isLoding.value
//                                   ? CupertinoActivityIndicator(
//                                 color: ColorConstants.appColor,
//                               )
//                                   : GestureDetector(
//                                 onTap: () {
//                                   productId = ProductCategoryLists![index]
//                                       .productId
//                                       .toString();
//                                   if (productId != null) {
//                                     whishlistAddController
//                                         .SubCategoryWhishLisAddPageApi(
//                                         index);
//                                     ProductCategoryLists![index]!
//                                         .isLoding
//                                         .value = true;
//                                     print(ProductCategoryLists![index]!
//                                         .isLoding
//                                         .value);
//                                   }
//                                 },
//                                 child: Container(
//                                   child: ProductCategoryLists![index]
//                                       .productWishlist ==
//                                       true
//                                       ? Icon(
//                                     Icons.favorite,
//                                     size: 18,
//                                     color: Colors.red,
//                                   )
//                                       : Icon(
//                                     Icons.favorite_border,
//                                     size: 18,
//                                   ),
//                                 ),
//                               )),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: Get.height * 0.02,
//                     ),
//                     Padding(
//                         padding: const EdgeInsets.only(left: 15.0),
//                         child: Container(
//                           height: Get.height*0.04,
//                           child: Text(
//                             ProductCategoryLists[index].productTitle,
//                             textAlign: TextAlign.center,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: Color(0xFF0F1811),
//                               fontSize: 9,
//                               fontFamily: 'Gilroy-Medium',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         )),
//                     SizedBox(
//                       height: Get.height * 0.01,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15.0),
//                       child: Row(
//                         children: [
//                           Text(
//                             '\$ ${latestProduct[index].productPrice}',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: 'Gilroy',
//                                 color: Color.fromRGBO(214, 51, 72, 1)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: Get.height * 0.015,
//                     ),
//                     Container(
//                         child: MyButton(
//                           title: 'Add to Cart',
//                           onTap: () {
//                             // Get.to(MyCart());
//                           },
//                           bgColor: ColorConstants.appColor,
//                           width: Get.width * 0.28,
//                           height: Get.height * 0.05,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 10,
//                             fontFamily: 'Gilroy-SemiBold',
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )),
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }




}
