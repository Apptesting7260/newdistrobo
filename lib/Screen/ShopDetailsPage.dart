import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/appBar.dart';
import '../Widgets/appColor.dart';
import '../controllers/AddToCartController/AddToCartController.dart';
import '../controllers/CartQuantityUpdateController/CartQuantityUpdateController.dart';
import '../controllers/SubCategortController/SubCategoryControoler.dart';
import '../controllers/whishlitcontroller/wishlistController.dart';
import '../utils/StatusClass.dart';
import 'MyCart.dart';
import 'ProductDetails.dart';
import 'Scaner.dart';
import 'ShowAllProductDetails.dart';
import 'SubCategeoryPage.dart';

class ShopDetailsPage extends StatefulWidget {
  final String title;

  ShopDetailsPage({
    super.key,
    required this.title,
  });

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  SubCategoryCotroller subCategoryCotroller = Get.put(SubCategoryCotroller());
  WhishlistAddController whishlistAddController =
      Get.put(WhishlistAddController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  CartQuantityUpdateController cartQuantityUpdateController =
  Get.put(CartQuantityUpdateController());

  @override
  void initState() {
    // TODO: implement initState
    subCategoryCotroller.ShopPageApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true, // Set this property to true

              title: Text(
                widget.title,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    fontFamily: 'Gilroy-sb',
                    fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 20,
                  ))),
          body: Obx(() {
            switch (subCategoryCotroller.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorConstants.appColor,
                ));
              case Status.ERROR:
                if (subCategoryCotroller.error.value == 'No internet') {
                  return Center(
                    child: InterNetExceptionWidget(
                      onPress: () {
                        subCategoryCotroller.refreshApi();
                      },
                    ),
                  );
                } else {
                  return GeneralExceptionWidget(
                    onPress: () {
                      subCategoryCotroller.refreshApi();
                    },
                  );
                }
              case Status.COMPLETED:
                return RefreshIndicator(
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
                              SizedBox(height: Get.height * 0.02),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: subCategoryCotroller
                                    .subCategoryPage.value.data!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            subCategoryCotroller
                                                .subCategoryPage
                                                .value
                                                .data![index]
                                                .name,
                                            style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                color: Color(0xff181725),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              categoryId = null;
                                              categoryId = subCategoryCotroller
                                                  .subCategoryPage
                                                  .value
                                                  .data![index]
                                                  .id
                                                  .toString();
                                              setState(() {});
                                              if (subCategoryCotroller
                                                      .subCategoryPage
                                                      .value
                                                      .data![index]
                                                      .subcategoriesExist ==
                                                  "true") {
                                                if (categoryId != null) {
                                                  Get.to(ShopDetailsPage(
                                                      title: subCategoryCotroller
                                                          .subCategoryPage
                                                          .value
                                                          .data![index]
                                                          .name));
                                                }
                                              }

                                              else {
                                                callHomePagination.value = true;
                                                page.value = 1;

                                                ProductCategoryLists.clear();

                                                currentPage.value = 0;
                                                categoryId =subCategoryCotroller
                                                    .subCategoryPage
                                                    .value
                                                    .data![index]
                                                    .id.toString();
                                                categoryName = subCategoryCotroller
                                                    .subCategoryPage
                                                    .value
                                                    .data![index]
                                                    .name;
                                                print(categoryId);

                                                if (categoryId != null &&
                                                    categoryName != null) {
                                                  Get.to(SubCategoryPage(
                                                      title: categoryName
                                                          .toString()));
                                                  print(categoryName);
                                                  print(categoryId);
                                                }
                                              }
                                            },
                                            child: const Text(
                                              "See All",
                                              style: TextStyle(
                                                  fontFamily: 'Gilroy-rg',
                                                  color: Color.fromRGBO(
                                                      233, 13, 65, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 1),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      Container(
                                        height: Get.height * 0.39,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: subCategoryCotroller
                                              .subCategoryPage
                                              .value
                                              .data![index]
                                              .catPosts!
                                              .length,
                                          itemBuilder: (context, c_index) {

                                            subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].productlocalCartQuantity
                                                .value=subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].productCartQuantity==""?1:
                                                int.parse(subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].productCartQuantity.toString());
                                            print(subCategoryCotroller
                                                .subCategoryPage
                                                .value
                                                .data![index]
                                                .catPosts!.length);
                                            return subCategoryCotroller
                                                        .subCategoryPage
                                                        .value
                                                        .data![index]
                                                        .catPosts !=
                                                    []
                                                ? GestureDetector(
                                              onTap: () {
                                                // productId= subCategoryCotroller
                                                //     .subCategoryPage
                                                //     .value
                                                //     .data![
                                                // index]
                                                //     .catPosts![
                                                // c_index].productId.toString();
                                                // print(productId);
                                                // if(productId!=null){
                                                //   Get.to(ProductDetailais());
                                                //git }
                                              },
                                                  child: Card(
                                                      child: Container(
                                                        // height: Get.height * 0.2,
                                                        width: Get.width * 0.38,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.all(
                                                              Radius.circular(20),
                                                            )),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: Get.height *
                                                                  0.018,
                                                            ),
                                                            Stack(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        Get.height *
                                                                            0.18,
                                                                    width:
                                                                        Get.width *
                                                                            0.32,
                                                                    decoration: BoxDecoration(
                                                                        color: Color.fromRGBO(
                                                                            242,
                                                                            243,
                                                                            242,
                                                                            1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20)),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl: subCategoryCotroller
                                                                            .subCategoryPage
                                                                            .value
                                                                            .data![
                                                                                index]
                                                                            .catPosts![
                                                                                c_index]
                                                                            .productImg,
                                                                        placeholder: (context,
                                                                                url) =>
                                                                            Center(
                                                                                child: CircularProgressIndicator(
                                                                          color: ColorConstants
                                                                              .appColor,
                                                                        )),
                                                                        errorWidget: (context,
                                                                                url,
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
                                                                Obx(
                                                                  () => Positioned(
                                                                      right: 8,
                                                                      top: 8,
                                                                      child: subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].isLoding.value
                                                                          ? CupertinoActivityIndicator(
                                                                              color:
                                                                                  ColorConstants.appColor,
                                                                            )
                                                                          : GestureDetector(
                                                                              onTap:
                                                                                  () {
                                                                                productId = subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].productId.toString();
                                                                                if (productId != null) {
                                                                                  whishlistAddController.ProSubCategoryWhishLisAddPageApi(c_index, index);
                                                                                  subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].isLoding.value = true;
                                                                                  print(subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].isLoding.value);
                                                                                }
                                                                              },
                                                                              child:
                                                                                  Obx(() {
                                                                                return Container(
                                                                                  child: subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].productWishlist == "true"
                                                                                      ? Icon(
                                                                                          Icons.favorite,
                                                                                          size: 18,
                                                                                          color: Colors.red,
                                                                                        )
                                                                                      : Icon(
                                                                                          Icons.favorite_border,
                                                                                          size: 18,
                                                                                        ),
                                                                                );
                                                                              }),
                                                                            )),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: Get.height *
                                                                  0.02,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 15.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {},
                                                                child: Container(
                                                                  height:
                                                                      Get.height *
                                                                          0.04,
                                                                  child: Text(
                                                                    subCategoryCotroller
                                                                        .subCategoryPage
                                                                        .value
                                                                        .data![
                                                                            index]
                                                                        .catPosts![
                                                                            c_index]
                                                                        .productTitle,
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Gilroy',
                                                                        color: Color
                                                                            .fromRGBO(
                                                                                9,
                                                                                64,
                                                                                94,
                                                                                1)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: Get.height *
                                                                  0.01,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 15.0),
                                                              child:  Row(
                                                                children: [
                                                                  Text(
                                                                    '\$ ${ subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].productPrice}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        16,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                        fontFamily:
                                                                        'Gilroy',
                                                                        color: Color.fromRGBO(
                                                                            214,
                                                                            51,
                                                                            72,
                                                                            1)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: Get.height *
                                                                  0.015,
                                                            ),
                                                         Container(
                                                          child: subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].productQuantity !=
                                                              "false"
                                                              ? Obx(() => subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].productCartKey == "true"
                                                              ? Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              GestureDetector(
                                                                child: Container(
                                                                  height: Get.height * 0.05,
                                                                  width: Get.width * 0.1,
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                      ColorConstants.appColor,
                                                                      border: Border.all(
                                                                          color: ColorConstants
                                                                              .appColor,
                                                                          width: 0.2,
                                                                          style: BorderStyle.solid),
                                                                      borderRadius:
                                                                      BorderRadius.circular(8)),
                                                                  child: Center(
                                                                      child: Icon(
                                                                        Icons.remove,
                                                                        color: Colors.white,
                                                                      )),
                                                                ),
                                                                onTap: () {
                                                                  if (subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].productlocalCartQuantity
                                                                      .value >
                                                                      1) {
                                                                    subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index]
                                                                        .productlocalCartQuantity
                                                                        .value -= 1;

                                                                    Future.delayed(
                                                                      Duration(seconds: 1),
                                                                          () {
                                                                        cartQuantityUpdateController
                                                                            .cartQuantityUpdateApi(
                                                                            subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index]
                                                                                .productKey
                                                                                .toString(),
                                                                            (int.parse(
                                                                              subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index]
                                                                                  .productlocalCartQuantity
                                                                                  .value
                                                                                  .toString(),
                                                                            )).toString());
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              Center(
                                                                  child: Text(
                                                                    "${subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].productlocalCartQuantity.value.toString()}",
                                                                    style: const TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.bold,
                                                                        fontFamily: 'Gilroy'),
                                                                  )),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index]
                                                                      .productlocalCartQuantity
                                                                      .value += 1;

                                                                  Future.delayed(
                                                                    Duration(seconds: 1),
                                                                        () {
                                                                      cartQuantityUpdateController
                                                                          .cartQuantityUpdateApi(
                                                                          subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index]
                                                                              .productKey,
                                                                          int.parse(
                                                                            subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index]
                                                                                .productlocalCartQuantity
                                                                                .value
                                                                                .toString(),
                                                                          ).toString());
                                                                    },
                                                                  );
                                                                },
                                                                child: Container(
                                                                  height: Get.height * 0.05,
                                                                  width: Get.width * 0.1,
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                      ColorConstants.appColor,
                                                                      border: Border.all(
                                                                          color: ColorConstants
                                                                              .appColor,
                                                                          width: 0.2,
                                                                          style: BorderStyle.solid),
                                                                      borderRadius:
                                                                      BorderRadius.circular(8)),
                                                                  child: Center(
                                                                      child: Icon(
                                                                        Icons.add,
                                                                        color: Colors.white,
                                                                      )),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                              : MyButton(
                                                            loading: subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index].cartLoding
                                                                .value,
                                                            title: 'Add to Cart',
                                                            onTap: () {
                                                              // Get.to(MyCart());
                                                              CartproductId =subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index]
                                                                  .productId
                                                                  .toString();
                                                              if (CartproductId != null) {
                                                                subCategoryCotroller.subCategoryPage.value.data![index].catPosts![c_index]
                                                                    .cartLoding
                                                                    .value = true;
                                                                addToCartController
                                                                    .SubHomeAddToCartApiHit(index,c_index);
                                                              }
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
                                                          ))
                                                              : Container(
                                                            width: Get.width * 0.28,
                                                            height: Get.height * 0.05,
                                                            decoration: ShapeDecoration(
                                                              color: Color(0xFF53B175),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15)),
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
                                                          )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                )
                                                : Center(
                                                    child: Text(
                                                      "No Data",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onRefresh: () async {
                    subCategoryCotroller.refreshApi();
                  },
                  color: ColorConstants.appColor,
                );
            }
          })
      ),
    );
  }
}
