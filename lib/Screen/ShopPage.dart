import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/GlobaleVarribale/Globalevarribale.dart';

import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/appBar.dart';
import '../Widgets/appColor.dart';
import '../controllers/ShopController/ShopController.dart';
import '../utils/StatusClass.dart';
import 'Scaner.dart';
import 'ShopDetailsPage.dart';
import 'ShowAllProductDetails.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  ShopPageController shopPageController = Get.put(ShopPageController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shopPageController.shopPage();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // Set this property to true

          title: Text(
            "Shop",
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
                fontFamily: 'Gilroy-sb',
                fontWeight: FontWeight.bold),
          ),
          // leading: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.arrow_back_ios_new_sharp,
          //       size: 22,
          //     ))
        ),
        body: Obx(() {
          switch (shopPageController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorConstants.appColor,
              ));
            case Status.ERROR:
              if (shopPageController.error.value == 'No internet') {
                return Center(
                  child: InterNetExceptionWidget(
                    onPress: () {
                      shopPageController.refreshApi();
                    },
                  ),
                );
              } else {
                return GeneralExceptionWidget(
                  onPress: () {
                    shopPageController.refreshApi();
                  },
                );
              }
            case Status.COMPLETED:
              return SingleChildScrollView(
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
                                      fontFamily: 'Gilroy-rg', fontSize: 14),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 0)),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.03),
                          Container(
                            height: Get.height,
                            child: ListView.separated(
                              itemCount: shopPageController
                                  .shoppage.value.data!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Container(
                                  height: 8,
                                  // Adjust the height of the separator as needed
                                  color: Colors.white,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    height: Get.height * 0.09,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: Colors.green[50],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        categoryId = null;
                                        categoryId = shopPageController
                                            .shoppage.value.data![index].id
                                            .toString();
                                        setState(() {});
                                        if (shopPageController.shoppage.value
                                                .data![index].categoryStatus ==
                                            "true") {
                                          if (categoryId != null) {
                                            Get.to(ShopDetailsPage(
                                                title: shopPageController
                                                    .shoppage
                                                    .value
                                                    .data![index]
                                                    .name));
                                          }
                                        } else {
                                          if (categoryId != null) {
                                            Get.to(ProductDetailsPage(
                                                title: shopPageController
                                                    .shoppage
                                                    .value
                                                    .data![index]
                                                    .name));
                                          }
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  categoryId = null;
                                                  categoryId =
                                                      shopPageController
                                                          .shoppage
                                                          .value
                                                          .data![index]
                                                          .id
                                                          .toString();
                                                  setState(() {});
                                                  if (shopPageController
                                                          .shoppage
                                                          .value
                                                          .data![index]
                                                          .categoryStatus ==
                                                      "true") {
                                                    if (categoryId != null) {
                                                      Get.to(ShopDetailsPage(
                                                          title:
                                                              shopPageController
                                                                  .shoppage
                                                                  .value
                                                                  .data![index]
                                                                  .name));
                                                    }
                                                  } else {
                                                    if (categoryId != null) {
                                                      Get.to(ProductDetailsPage(
                                                          title:
                                                              shopPageController
                                                                  .shoppage
                                                                  .value
                                                                  .data![index]
                                                                  .name));
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  height: Get.height * 0.07,
                                                  width: Get.width * .2,
                                                  child: shopPageController
                                                          .shoppage
                                                          .value
                                                          .data![index]
                                                          .img
                                                          .toString()
                                                          .endsWith(".svg")
                                                      ? SvgPicture.network(
                                                    shopPageController
                                                        .shoppage
                                                        .value
                                                        .data![index]
                                                        .img,
                                                          semanticsLabel:
                                                              'A shark?!',
                                                          placeholderBuilder: (BuildContext
                                                                  context) =>
                                                              Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          30.0),
                                                                  child:
                                                                      const CircularProgressIndicator(  color:
                                                                      ColorConstants
                                                                          .appColor,)),
                                                        )
                                                      : CachedNetworkImage(
                                                          imageUrl:
                                                              shopPageController
                                                                  .shoppage
                                                                  .value
                                                                  .data![index]
                                                                  .img,
                                                          placeholder: (context,
                                                                  url) =>
                                                              Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                            color:
                                                                ColorConstants
                                                                    .appColor,
                                                          )),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons
                                                                  .error), // Customize the error widget as needed.
                                                        ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 5),
                                                  Container(
                                                    width: Get.width - 225,
                                                    child: Text(
                                                      shopPageController
                                                          .shoppage
                                                          .value
                                                          .data![index]
                                                          .name,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                ],
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    categoryId = null;
                                                    categoryId =
                                                        shopPageController
                                                            .shoppage
                                                            .value
                                                            .data![index]
                                                            .id
                                                            .toString();
                                                    setState(() {});
                                                    if (shopPageController
                                                            .shoppage
                                                            .value
                                                            .data![index]
                                                            .categoryStatus ==
                                                        "true") {
                                                      if (categoryId != null) {
                                                        Get.to(ShopDetailsPage(
                                                            title:
                                                                shopPageController
                                                                    .shoppage
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .name));
                                                      }
                                                    } else {
                                                      if (categoryId != null) {
                                                        Get.to(ProductDetailsPage(
                                                            title:
                                                                shopPageController
                                                                    .shoppage
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .name));
                                                      }
                                                    }
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    size: 22,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
          }
        }));
  }
}
