import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/data/modals/CategoryDetailsModel.dart';

import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/ProdactContantener.dart';
import '../Widgets/appColor.dart';
import '../controllers/AddToCartController/AddToCartController.dart';
import '../controllers/CartQuantityUpdateController/CartQuantityUpdateController.dart';
import '../controllers/CatagarryDetailsController/CategoryDetailsController.dart';
import '../controllers/whishlitcontroller/wishlistController.dart';
import '../utils/StatusClass.dart';
import 'Scaner.dart';

class ProductDetailsPage extends StatefulWidget {
  String title;
   ProductDetailsPage({super.key, required this.title});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  CatagoryDetailsController catagoryDetailsController = Get.put(
      CatagoryDetailsController());
  WhishlistAddController whishlistAddController = Get.put(WhishlistAddController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  CartQuantityUpdateController cartQuantityUpdateController =
  Get.put(CartQuantityUpdateController());


  @override
  void initState() {
    // TODO: implement initState
    catagoryDetailsController.CategoryPagedeatails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,

              title: Text(
                widget.title,
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
                    size: 20,
                  )),
            ),
            body: Obx(() {
              switch (catagoryDetailsController.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(
                      child: CircularProgressIndicator(
                        color: ColorConstants.appColor,
                      ));
                case Status.ERROR:
                  if (catagoryDetailsController.error.value == 'No internet') {
                    return Center(
                      child: InterNetExceptionWidget(
                        onPress: () {
                          catagoryDetailsController.refreshApi();
                        },
                      ),
                    );
                  } else {
                    return GeneralExceptionWidget(
                      onPress: () {
                        catagoryDetailsController.refreshApi();
                      },
                    );
                  }
                case Status.COMPLETED:
                  return RefreshIndicator(child: SingleChildScrollView(
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
                                              child: Image.asset(
                                                  'assets/images/scano.png'))),
                                      prefixIcon: Image.asset(
                                        'assets/images/search.png',
                                        scale: 0.9,
                                      ),
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Gilroy-rg',
                                          fontSize: 14),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 0)),
                                ),
                              ),
                              SizedBox(height: Get.height * 0.03),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: catagoryDetailsController
                                    .categeaoryData.value.data!.length,
                                itemBuilder: (context, index) {
                                  var productData = catagoryDetailsController
                                      .categeaoryData.value.data![index]
                                      .productData;
                                  return GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        mainAxisExtent: Get.height * 0.4),
                                    itemCount: productData!.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context,
                                        int p_index) {
                                      productData[p_index]
                                          .productlocalCartQuantity
                                          .value= productData[p_index]
                                          .productCartQuantity==""?0: int.parse(productData[p_index]
                                          .productCartQuantity.toString());
                                      return Padding(
                                        padding: EdgeInsets.only(left: 0.0),
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
                                                        height: Get.height *
                                                            0.18,
                                                        width: Get.width * 0.32,
                                                        decoration: BoxDecoration(
                                                            color: Color
                                                                .fromRGBO(
                                                                242, 243, 242,
                                                                1),
                                                            borderRadius: BorderRadius
                                                                .circular(20)),
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius
                                                              .circular(20),
                                                          child: CachedNetworkImage(
                                                            imageUrl:
                                                            productData[p_index]
                                                                .productImg.toString(),
                                                            placeholder: (
                                                                context, url) =>
                                                                Center(
                                                                    child:
                                                                    CircularProgressIndicator(
                                                                      color: ColorConstants
                                                                          .appColor,)),
                                                            errorWidget: (
                                                                context, url,
                                                                error) =>
                                                                Icon(Icons
                                                                    .error), // Customize the error widget as needed.
                                                          ),
                                                          // child: Image.network(
                                                          //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd_anlQxAS6NrNRrUj1Bkz2BMSUX99xsDyCZvCORB1EzBHZxgxDcKCkLzzMEpYIIg46nQ&usqp=CAU",
                                                          //   fit: BoxFit.cover,
                                                          // ),
                                                        ),
                                                      ),
                                                    ),
                                                    Obx(() =>
                                                        Positioned(
                                                            right: 8,
                                                            top: 8,
                                                            child: productData[p_index]
                                                                .isLoding.value
                                                                ? CupertinoActivityIndicator(
                                                              color: ColorConstants
                                                                  .appColor,)
                                                                : GestureDetector(
                                                              onTap: () {
                                                                productId =
                                                                    productData[p_index]
                                                                        .productId
                                                                        .toString();
                                                                if (productId !=
                                                                    null) {
                                                                  whishlistAddController.CategoryWhishLisAddPageApi(p_index,index);
                                                                  productData[p_index].isLoding.value=true;
                                                                  print(   productData[p_index].isLoding.value);
                                                                }
                                                              },
                                                              child: Container(
                                                                child: productData[p_index]
                                                                    .productWishlist ==
                                                                    true ? Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  size: 18,
                                                                  color: Colors
                                                                      .red,
                                                                ) : Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  size: 18,

                                                                ),
                                                              ),
                                                            )
                                                        ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(left: 15.0),
                                                  child: GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: Get.height * 0.04,
                                                      child: Text(
                                                        productData[p_index]
                                                            .productTitle,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            fontFamily: 'Gilroy',
                                                            color: Color
                                                                .fromRGBO(
                                                                9, 64, 94, 1)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.01,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(left: 15.0),
                                                  child: Row(
                                                    children: [
                                                      Obx(() =>   Text(
                                                        productData[p_index].productlocalCartQuantity.value==0?
                                                        '\$ ${ productData[p_index]
                                                            .productPrice}':'\$ ${ int.parse(productData[p_index].productPrice.toString())*int.parse(productData[p_index].productlocalCartQuantity.value.toString())}',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            fontFamily: 'Gilroy',
                                                            color: Color
                                                                .fromRGBO(
                                                                214, 51, 72,
                                                                1)),
                                                      ),)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.015,
                                                ),
                                                Container(
                                                    child: productData[p_index]
                                                        .productQuantity !=
                                                        "false"
                                                        ?
                                                    Obx(() =>   productData[p_index]
                                                        .productCartKey ==
                                                        "true"
                                                        ?  Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          child:
                                                          Container(
                                                            height:
                                                            Get.height * 0.05,
                                                            width:
                                                            Get.width * 0.1,
                                                            decoration: BoxDecoration(
                                                                color: ColorConstants.appColor,
                                                                border: Border.all(color: ColorConstants.appColor, width: 0.2, style: BorderStyle.solid),
                                                                borderRadius: BorderRadius.circular(8)),
                                                            child: Center(
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color:
                                                                  Colors.white,
                                                                )),
                                                          ),
                                                          onTap:
                                                              () {
                                                            if(  productData[p_index]
                                                                .productlocalCartQuantity
                                                                .value>1){
                                                              productData[p_index]
                                                                  .productlocalCartQuantity
                                                                  .value -= 1;

                                                              Future
                                                                  .delayed(
                                                                Duration(seconds: 1),
                                                                    () {
                                                                  cartQuantityUpdateController.cartQuantityUpdateApi(
                                                                      productData[p_index].productKey.toString(),
                                                                      (int.parse(
                                                                        productData[p_index].productlocalCartQuantity.value.toString(),
                                                                      )).toString());
                                                                },
                                                              );
                                                            }
                                                          },
                                                        ),
                                                        Center(
                                                            child:
                                                            Text(
                                                              "${productData[p_index].productlocalCartQuantity.value.toString()}",
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                  14,
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  fontFamily: 'Gilroy'),
                                                            )),
                                                        GestureDetector(
                                                          onTap:
                                                              () {
                                                            productData[p_index]
                                                                .productlocalCartQuantity.value += 1;

                                                            Future
                                                                .delayed(
                                                              Duration(seconds: 1),
                                                                  () {
                                                                cartQuantityUpdateController.cartQuantityUpdateApi(
                                                                    productData[p_index].productKey,
                                                                    int.parse(
                                                                      productData[p_index].productlocalCartQuantity.value.toString(),
                                                                    ).toString());
                                                              },
                                                            );
                                                          },
                                                          child:
                                                          Container(
                                                            height:
                                                            Get.height * 0.05,
                                                            width:
                                                            Get.width * 0.1,
                                                            decoration: BoxDecoration(
                                                                color: ColorConstants.appColor,
                                                                border: Border.all(color: ColorConstants.appColor, width: 0.2, style: BorderStyle.solid),
                                                                borderRadius: BorderRadius.circular(8)),
                                                            child: Center(
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color:
                                                                  Colors.white,
                                                                )),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                        : MyButton(
                                                      loading:   productData[p_index]
                                                          .cartLoding.value ,
                                                      title:
                                                      'Add to Cart',
                                                      onTap: () {
                                                        // Get.to(MyCart());
                                                        CartproductId = productData[p_index]
                                                            .productId
                                                            .toString();
                                                        if (CartproductId !=
                                                            null) {
                                                          productData[p_index]
                                                              .cartLoding.value=true;
                                                          addToCartController
                                                              .SubCategoryAddToCartApiHit(index,p_index);
                                                        }
                                                      },
                                                      bgColor:
                                                      ColorConstants
                                                          .appColor,
                                                      width:
                                                      Get.width *
                                                          0.28,
                                                      height:
                                                      Get.height *
                                                          0.05,
                                                      style:
                                                      TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontSize:
                                                        10,
                                                        fontFamily:
                                                        'Gilroy-SemiBold',
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                      ),
                                                    ))
                                                        : Container(
                                                      width: Get.width *
                                                          0.28,
                                                      height:
                                                      Get.height *
                                                          0.05,
                                                      decoration:
                                                      ShapeDecoration(
                                                        color: Color(
                                                            0xFF53B175),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                15)),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Out of Stock',
                                                          textAlign:
                                                          TextAlign
                                                              .center,
                                                          style:
                                                          TextStyle(
                                                            color: Colors
                                                                .white,
                                                            fontSize:
                                                            10,
                                                            fontFamily:
                                                            'Gilroy-SemiBold',
                                                            fontWeight:
                                                            FontWeight
                                                                .w400,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                    color: ColorConstants.appColor,
                    onRefresh: ()async {
                    catagoryDetailsController.refreshApi();
                  },);
              }
            })));
  }

}