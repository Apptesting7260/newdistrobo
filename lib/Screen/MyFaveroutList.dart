import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Screen/ShopPage.dart';

import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/appBar.dart';
import '../Widgets/appColor.dart';
import '../controllers/whishlitcontroller/ViewWhishLishController.dart';
import '../utils/StatusClass.dart';
import '../view/NvigationTabButton.dart';
import 'ProductDetails.dart';

class FaverouteListPage extends StatefulWidget {
  FaverouteListPage({super.key});

  @override
  State<FaverouteListPage> createState() => _FaverouteListPageState();
}

class _FaverouteListPageState extends State<FaverouteListPage> {
  ViewWhishListcontroller viewWhishListcontroller =
      Get.put(ViewWhishListcontroller());

  @override
  void initState() {
    // TODO: implement initState
    viewWhishListcontroller.ViewWhislistApiHit();
    super.initState();
  }

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
                fontSize: 20,
                fontFamily: 'Gilroy-sb',
                fontWeight: FontWeight.bold),
          ),
          // leading: IconButton(
          //     onPressed: () {
          //       Get.back();
          //     },
          //     icon: Icon(
          //       Icons.arrow_back_ios_new_sharp,
          //       size: 22,
          //     )),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  'assets/images/notification.png',
                  scale: 0.9,
                ),
              ),
            )
          ],
        ),
        body: Obx(() {
          switch (viewWhishListcontroller.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorConstants.appColor,
              ));
            case Status.ERROR:
              if (viewWhishListcontroller.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {
                    viewWhishListcontroller.refreshApi();
                  },
                );
              } else {
                return GeneralExceptionWidget(
                  onPress: () {
                    viewWhishListcontroller.refreshApi();
                  },
                );
              }
            case Status.COMPLETED:
              return RefreshIndicator(
                  onRefresh: () async {
                    viewWhishListcontroller.refreshApi();
                  },
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            viewWhishListcontroller
                                        .wishlidata.value.listProduct?.length !=
                                    0
                                ? Container(
                                    child: Grideview(),
                                  )
                                : EmptyCart()

                            // Container(
                            //   height: Get.height * 0.35,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey.withOpacity(0.1), // Shadow color
                            //         spreadRadius:
                            //             0.5, // How much the shadow should spread
                            //         blurRadius: 1, // How blurry the shadow should be
                            //         offset: Offset(0, 2), // Offset of the shadow
                            //       ),
                            //     ],
                            //   ),
                            //   child: Column(
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Expanded(
                            //             child: Text(
                            //               "Shopping List 2",
                            //               style: TextStyle(
                            //                   fontFamily: 'Gilroy',
                            //                   color: Color(0xff181725),
                            //                   fontSize: 15,
                            //                   fontWeight: FontWeight.w600,
                            //                   letterSpacing: 1),
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: Get.width * 0.3,
                            //           ),
                            //           Expanded(
                            //             child: Text(
                            //               "2 Items ",
                            //               style: TextStyle(
                            //                   fontFamily: 'Gilroy',
                            //                   color: Color(0xf38a8686),
                            //                   fontSize: 10,
                            //                   fontWeight: FontWeight.w600,
                            //                   letterSpacing: 1),
                            //             ),
                            //           ),
                            //
                            //           Expanded(
                            //             child: GestureDetector(
                            //               onTap: () {},
                            //               child: const Text(
                            //                 "See All",
                            //                 style: TextStyle(
                            //                     fontFamily: 'Gilroy-rg',
                            //                     color: Color.fromRGBO(233, 13, 65, 1),
                            //                     fontSize: 16,
                            //                     fontWeight: FontWeight.w600,
                            //                     letterSpacing: 1),
                            //               ),
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //       SizedBox(
                            //         height: MediaQuery.of(context).size.height * .03,
                            //       ),
                            //       Container(
                            //         height: Get.height * 0.25,
                            //         child: GridView.builder(
                            //           physics: NeverScrollableScrollPhysics(),
                            //           shrinkWrap: true,
                            //           gridDelegate:
                            //               SliverGridDelegateWithFixedCrossAxisCount(
                            //             crossAxisCount: 2, // Number of columns
                            //             crossAxisSpacing: 8.0, // Spacing between columns
                            //             mainAxisSpacing: 8.0, // Spacing between rows
                            //           ),
                            //           itemCount: 2,
                            //           // Number of items in the grid
                            //           itemBuilder: (context, index) {
                            //             return GestureDetector(
                            //               onTap: () {
                            //                 Get.to(ProductDetailais());
                            //               },
                            //               child: Container(
                            //                   decoration: BoxDecoration(
                            //                       color: Colors.grey[100],
                            //                       borderRadius:
                            //                           BorderRadius.circular(23)),
                            //                   height: 130,
                            //                   width: 120,
                            //                   child: Padding(
                            //                       padding: const EdgeInsets.all(15.0),
                            //                       child: CachedNetworkImage(
                            //                         imageUrl:
                            //                             "https://freepngimg.com/thumb/grocery/53982-2-grocery-png-image-high-quality-thumb.png",
                            //                         placeholder: (context, url) => Center(
                            //                             child:
                            //                                 CircularProgressIndicator()),
                            //                         errorWidget: (context, url, error) =>
                            //                             Icon(Icons
                            //                                 .error), // Customize the error widget as needed.
                            //                       ))),
                            //             );
                            //           },
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   height: Get.height * 0.35,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey.withOpacity(0.1), // Shadow color
                            //         spreadRadius:
                            //             0.5, // How much the shadow should spread
                            //         blurRadius: 1, // How blurry the shadow should be
                            //         offset: Offset(0, 2), // Offset of the shadow
                            //       ),
                            //     ],
                            //   ),
                            //   child: Column(
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Expanded(
                            //             child: Text(
                            //               "Shopping List 2",
                            //               style: TextStyle(
                            //                   fontFamily: 'Gilroy',
                            //                   color: Color(0xff181725),
                            //                   fontSize: 15,
                            //                   fontWeight: FontWeight.w600,
                            //                   letterSpacing: 1),
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: Get.width * 0.3,
                            //           ),
                            //           Expanded(
                            //             child: Text(
                            //               "2 Items ",
                            //               style: TextStyle(
                            //                   fontFamily: 'Gilroy',
                            //                   color: Color(0xf38a8686),
                            //                   fontSize: 10,
                            //                   fontWeight: FontWeight.w600,
                            //                   letterSpacing: 1),
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: Get.width * 0.01,
                            //           ),
                            //           Expanded(
                            //             child: GestureDetector(
                            //               onTap: () {},
                            //               child: const Text(
                            //                 "See All",
                            //                 style: TextStyle(
                            //                     fontFamily: 'Gilroy-rg',
                            //                     color: Color.fromRGBO(233, 13, 65, 1),
                            //                     fontSize: 16,
                            //                     fontWeight: FontWeight.w600,
                            //                     letterSpacing: 1),
                            //               ),
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //       SizedBox(
                            //         height: MediaQuery.of(context).size.height * .03,
                            //       ),
                            //       Container(
                            //         child: GridView.builder(
                            //           physics: NeverScrollableScrollPhysics(),
                            //           shrinkWrap: true,
                            //           gridDelegate:
                            //               SliverGridDelegateWithFixedCrossAxisCount(
                            //             crossAxisCount: 2, // Number of columns
                            //             crossAxisSpacing: 8.0, // Spacing between columns
                            //             mainAxisSpacing: 8.0, // Spacing between rows
                            //           ),
                            //           itemCount: 2,
                            //           // Number of items in the grid
                            //           itemBuilder: (context, index) {
                            //             return GestureDetector(
                            //               onTap: () {
                            //                 Get.off(ProductDetailais());
                            //               },
                            //               child: Container(
                            //                   decoration: BoxDecoration(
                            //                       color: Colors.grey[100],
                            //                       borderRadius:
                            //                           BorderRadius.circular(23)),
                            //                   height: Get.height * 0.5,
                            //                   width: Get.width,
                            //                   child: Center(
                            //                     child: CachedNetworkImage(
                            //                       imageUrl:
                            //                           "https://freepngimg.com/thumb/grocery/53982-2-grocery-png-image-high-quality-thumb.png",
                            //                       placeholder: (context, url) => Center(
                            //                           child: CircularProgressIndicator()),
                            //                       errorWidget: (context, url, error) =>
                            //                           Icon(Icons
                            //                               .error), // Customize the error widget as needed.
                            //                     ),
                            //                   )),
                            //             );
                            //           },
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  )));
          }
        }));
  }

  Widget Grideview() {
    return Container(
      child: GridView.builder(
          itemCount:
              viewWhishListcontroller.wishlidata.value.listProduct!.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: Get.height * 0.33),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                productId=viewWhishListcontroller.wishlidata.value.listProduct![index].productId;
                print(productId);
               if(productId!=null){
                 Get.to(ProductDetailais());
               }
              },
              child: Card(
                child: Container(
                  height: Get.height * 0.35,
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
                          Container(
                            height: Get.height * 0.18,
                            width: Get.width * 0.32,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(242, 243, 242, 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: viewWhishListcontroller
                                    .wishlidata
                                    .value
                                    .listProduct![index]
                                    .productData!
                                    .productImage,
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
                            ),
                          ),
                          //     Obx(
                          //           () => Positioned(
                          //           right: 8,
                          //           top: 8,
                          //           child: ProductCategoryLists![index]!.isLoding.value
                          //               ? CupertinoActivityIndicator(
                          //             color: ColorConstants.appColor,
                          //           )
                          //               : GestureDetector(
                          //             onTap: () {
                          //               productId = ProductCategoryLists![index]
                          //                   .productId
                          //                   .toString();
                          //               if (productId != null) {
                          //                 whishlistAddController
                          //                     .SubCategoryWhishLisAddPageApi(
                          //                     index);
                          //                 ProductCategoryLists![index]!
                          //                     .isLoding
                          //                     .value = true;
                          //                 print(ProductCategoryLists![index]!
                          //                     .isLoding
                          //                     .value);
                          //               }
                          //             },
                          //             child: Container(
                          //               child: ProductCategoryLists![index]
                          //                   .productWishlist ==
                          //                   true
                          //                   ? Icon(
                          //                 Icons.favorite,
                          //                 size: 18,
                          //                 color: Colors.red,
                          //               )
                          //                   : Icon(
                          //                 Icons.favorite_border,
                          //                 size: 18,
                          //               ),
                          //             ),
                          //           )),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            height: Get.height * 0.04,
                            child: Text(
                              viewWhishListcontroller.wishlidata.value
                                  .listProduct![index].productData!.productName,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF0F1811),
                                fontSize: 9,
                                fontFamily: 'Gilroy-Medium',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text(
                              '\$ ${viewWhishListcontroller.wishlidata.value.listProduct![index].productData!.productPrice}',
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
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget EmptyCart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.width/2.5,
        ),
        Center(
            child: Image.asset(
          "assets/aapIcon/WhishList.png",
          height: 120,
        )),
        SizedBox(
          height: Get.width * 0.03,
        ),
        Text(
          'No Wishlist yet',
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
          " You don't currently have anything in your Wish List",
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
            selectedIndex=1;
            Get.offAll(Tab_view(index: 1));
          },
        )
      ],
    );
  }
}
