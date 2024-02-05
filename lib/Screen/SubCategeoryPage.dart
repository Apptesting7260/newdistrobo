import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/circular_reveal_clipper.dart';

import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/appColor.dart';
import '../controllers/AddToCartController/AddToCartController.dart';
import '../controllers/CartQuantityUpdateController/CartQuantityUpdateController.dart';
import '../controllers/CategoryPageController/CategoryPageController.dart';
import '../controllers/whishlitcontroller/wishlistController.dart';
import '../utils/StatusClass.dart';
import 'ProductDetails.dart';
import 'Scaner.dart';

class SubCategoryPage extends StatefulWidget {
  String title;

  SubCategoryPage({super.key, required this.title});

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  ScrollController scrollController = ScrollController();
  SubCategoryPageController subCategoryPageController =
      Get.put(SubCategoryPageController());
  WhishlistAddController whishlistAddController =
      Get.put(WhishlistAddController());
  RxBool gridEnd = false.obs;
  AddToCartController addToCartController = Get.put(AddToCartController());
  CartQuantityUpdateController cartQuantityUpdateController =
  Get.put(CartQuantityUpdateController());

  @override
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

  void _scroller() {}

  RxBool noMoreData = false.obs;

  fetchData() async {
    print(' callin funation');
    gridEnd.value = true;
    print(callHomePagination.value);
    if (callHomePagination.value == true) {
      print('calling it ');
      print('Length ===> ${ProductCategoryLists.length}');
      print("Pageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee ->>>>>>> ${page}");
      subCategoryPageController.page_no = page.toString().obs;
      subCategoryPageController.SubCatageoryPageApi(true);
      callHomePagination.value = false;
    } else {
      print('not callin');
    }
  }

  void dispose() {
    scrollController.dispose();
    super.dispose();
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
                    size: 22,
                  ))),
          body: Obx(() {
            switch (subCategoryPageController.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorConstants.appColor,
                ));
              case Status.ERROR:
                if (subCategoryPageController.error.value == 'No internet') {
                  return InterNetExceptionWidget(
                    onPress: () {

                      subCategoryPageController.refreshApi(true);
                    },
                  );
                } else {
                  return GeneralExceptionWidget(
                    onPress: () {
                      subCategoryPageController.refreshApi(true);
                    },
                  );
                }
              case Status.COMPLETED:
                return RefreshIndicator(
                  onRefresh: () async{
                    callHomePagination.value = true;
                    page.value = 1;

                    ProductCategoryLists.clear();

                    currentPage.value = 0;
                    fetchData();
                  },
                  child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
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
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          Container(
                            // height: Get.height,
                            child: Gride(),
                          ),
                          if (subCategoryPageController.isLoading.value)
                            CircularProgressIndicator(
                              color: ColorConstants.appColor,
                            ),
                              SizedBox(height: Get.height*0.005,)
                        ]),
                      )),
                );
            }
          })),
    );
  }

  Widget Gride() {
    return Container(
      child: GridView.builder(

        itemCount: ProductCategoryLists!.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: Get.height * 0.39),
        itemBuilder: (context, index) {
          print(ProductCategoryLists!.length);
          print(index);
          ProductCategoryLists![index].productlocalCartQuantity.value=ProductCategoryLists![index].productCartQuantity==""?0:
          int.parse(ProductCategoryLists![index].productCartQuantity.toString());
          if (index < ProductCategoryLists.length) {
            return GestureDetector(
              onTap: () {
                // productId= ProductCategoryLists[index].productId.toString();
                // print(productId);
                // if(productId!=null){
                //   Get.to(ProductDetailais());
                //}
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
                                imageUrl: ProductCategoryLists[index].productImg,
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
                          Obx(
                            () => Positioned(
                                right: 8,
                                top: 8,
                                child: ProductCategoryLists![index]!.isLoding.value
                                    ? CupertinoActivityIndicator(
                                        color: ColorConstants.appColor,
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          productId = ProductCategoryLists![index]
                                              .productId
                                              .toString();
                                          if (productId != null) {
                                            whishlistAddController
                                                .SubCategoryWhishLisAddPageApi(
                                                    index);
                                            ProductCategoryLists![index]!
                                                .isLoding
                                                .value = true;
                                            print(ProductCategoryLists![index]!
                                                .isLoding
                                                .value);
                                          }
                                        },
                                        child: Container(
                                          child: ProductCategoryLists![index]
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
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            height: Get.height*0.04,
                            child: Text(
                              ProductCategoryLists![index].productTitle,
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
                              '\$ ${ProductCategoryLists![index].productPrice}',
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
                   Obx(() => Container(
                       child: ProductCategoryLists![index].productQuantity !=
                           "false"
                           ?ProductCategoryLists![index].productCartKey == "true"
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
                               if (ProductCategoryLists![index].productlocalCartQuantity
                                   .value >
                                   1) {
                                 ProductCategoryLists![index]
                                     .productlocalCartQuantity
                                     .value -= 1;

                                 Future.delayed(
                                   Duration(seconds: 1),
                                       () {
                                     cartQuantityUpdateController
                                         .cartQuantityUpdateApi(
                                         ProductCategoryLists![index]
                                             .productKey
                                             .toString(),
                                         (int.parse(
                                           ProductCategoryLists![index]
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
                                 "${ProductCategoryLists![index].productlocalCartQuantity.value.toString()}",
                                 style: const TextStyle(
                                     fontSize: 14,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: 'Gilroy'),
                               )),
                           GestureDetector(
                             onTap: () {
                               ProductCategoryLists![index]
                                   .productlocalCartQuantity
                                   .value += 1;

                               Future.delayed(
                                 Duration(seconds: 1),
                                     () {
                                   cartQuantityUpdateController
                                       .cartQuantityUpdateApi(
                                       ProductCategoryLists![index]
                                           .productKey,
                                       int.parse(
                                         ProductCategoryLists![index]
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
                       ):MyButton(
                         loading:  ProductCategoryLists![index]
                             .cartLoding
                             .value,
                         title: 'Add to Cart',

                         onTap: () {
                           // Get.to(MyCart());
                           CartproductId =ProductCategoryLists![index]
                               .productId
                               .toString();
                           if (CartproductId != null) {
                             ProductCategoryLists![index]
                                 .cartLoding
                                 .value = true;
                             addToCartController
                                 .SubPaginationAddToCartApiHit(index);
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
                       )
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
                       )))
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
