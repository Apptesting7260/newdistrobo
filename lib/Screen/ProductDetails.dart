import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/Screen/productItemIncrement.dart';
import 'package:newdistrobo/Screen/searchpage/Productseachscreen.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/appBar.dart';
import '../controllers/AddToCartController/AddToCartController.dart';
import '../controllers/CartQuantityUpdateController/CartQuantityUpdateController.dart';
import '../controllers/SingleProductControlller/SingleProductController.dart';
import '../controllers/whishlitcontroller/wishlistController.dart';
import '../utils/StatusClass.dart';
import '../view/NvigationTabButton.dart';
import 'Scaner.dart';

class ProductDetailais extends StatefulWidget {
  ProductDetailais({super.key});

  @override
  State<ProductDetailais> createState() => _ProductDetailaisState();
}

class _ProductDetailaisState extends State<ProductDetailais> {
  GetSingleProductController getSingleProductController =
      Get.put(GetSingleProductController());
  CartQuantityUpdateController cartQuantityUpdateController =
      Get.put(CartQuantityUpdateController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  WhishlistAddController whishlistAddController =
      Get.put(WhishlistAddController());

  void _onItemTapped(int index) {
    print(index);
    if(selectedIndex==index){
      print(index);
      setState(() {
        selectedIndex = index; // Update selected index
      });
    }
    else{
      Get.offAll(Tab_view(index: index));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getSingleProductController.GetSingleProductApiHit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Use your desired separator

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true, // Set this property to true

          title: Text('Product Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0F1811),
                fontSize: 20,
                fontFamily: 'Gilroy-SemiBold',
                fontWeight: FontWeight.w400,
              )),

          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                size: 22,
              )),
        ),
        body: Obx(() {
          switch (getSingleProductController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorConstants.appColor,
              ));
            case Status.ERROR:
              if (getSingleProductController.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {
                    getSingleProductController.refreshApi();
                  },
                );
              } else {
                return GeneralExceptionWidget(
                  onPress: () {
                    getSingleProductController.refreshApi();
                  },
                );
              }
            case Status.COMPLETED:
              getSingleProductController.getSinglePageData.value.singleProduct!
                  .productlocalCartQuantity.value = getSingleProductController
                          .getSinglePageData
                          .value
                          .singleProduct!
                          .productCartQuantity ==
                      ""
                  ? 1
                  : int.parse(getSingleProductController.getSinglePageData.value
                      .singleProduct!.productCartQuantity
                      .toString());
              return RefreshIndicator(
                onRefresh: () async {
                  getSingleProductController.refreshApi();
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
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            onTap: () {
                              Get.to(ProductSearchPage());
                            },
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
                      ),
                      SizedBox(height: Get.height * 0.03),
                      Container(
                        // height: Get.height * 0.2,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(0),
                            )),
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.35,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(242, 243, 242, 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                alignment: FractionalOffset.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: Get.height * 0.3,
                                      width: Get.width * 0.5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          imageUrl: getSingleProductController
                                              .getSinglePageData
                                              .value
                                              .singleProduct!
                                              .productImg,
                                          // width: Get.width * 0.2,
                                          // height: Get.height * 0.2,
                                          fit: BoxFit.cover,
                                          height: Get.height * 0.01,
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                            color: ColorConstants.appColor,
                                          )),
                                          // Optional: Show a loading indicator
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons
                                                  .error), // Optional: Show an error icon
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
                                        child: getSingleProductController
                                                .getSinglePageData
                                                .value
                                                .singleProduct!
                                                .isLoding
                                                .value
                                            ? CupertinoActivityIndicator(
                                                color: ColorConstants.appColor,
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  productId =
                                                      getSingleProductController
                                                          .getSinglePageData
                                                          .value
                                                          .singleProduct!
                                                          .productId
                                                          .toString();
                                                  if (productId != null) {
                                                    whishlistAddController
                                                        .SingleWhishLisAddPageApi();
                                                    getSingleProductController
                                                        .getSinglePageData
                                                        .value
                                                        .singleProduct!
                                                        .isLoding
                                                        .value = true;
                                                    print(
                                                        getSingleProductController
                                                            .getSinglePageData
                                                            .value
                                                            .singleProduct!
                                                            .isLoding
                                                            .value);
                                                  }
                                                },
                                                child: Container(
                                                  child: getSingleProductController
                                                              .getSinglePageData
                                                              .value
                                                              .singleProduct!
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
                            ),
                            SizedBox(height: Get.height * 0.03),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getSingleProductController.getSinglePageData.value
                                  .singleProduct!.productTitle,
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 22,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Categories:',
                                  style: TextStyle(
                                    color: Color(0xFF8C8D8C),
                                    fontSize: 14,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,

                                  ),
                                ),
                                SizedBox(width: Get.width * 0.01),
                                Flexible(
                                  fit: FlexFit.tight,
                                    child: Column(children: [

                                  TextWiget()
                                ]))
                              ],
                            ),
                            SizedBox(height: Get.height * 0.03),
                            getSingleProductController.getSinglePageData.value.singleProduct!.perItemPrice==""?  Text(
                              '\$ ${getSingleProductController.getSinglePageData.value.singleProduct!.productPrice}',
                              style: TextStyle(
                                color: Color(0xFFED5176),
                                fontSize: 26,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.10,
                              ),
                            ):  Row(
                              children: [
                                Text(
                                  "\$${getSingleProductController.getSinglePageData.value.singleProduct!.perItemPrice.toString()}/ea "
                                  ,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight
                                          .w600,
                                      fontFamily:
                                      'Gilroy',
                                      color: Color
                                          .fromRGBO(
                                          214,
                                          51,
                                          72,
                                          1)),
                                ),
                                Text(
                                  "\$${getSingleProductController.getSinglePageData.value.singleProduct!.productPrice.toString()}/case"
                                  ,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight
                                          .w400,
                                      fontFamily:
                                      'Gilroy',
                                      color: ColorConstants.subTextColor
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.03),
                            Obx(() => getSingleProductController
                                        .getSinglePageData
                                        .value
                                        .singleProduct!
                                        .productQuantity ==
                                    "false"
                                ? MyButton(
                                    bgColor: ColorConstants.appColor,
                                    title: "Out of Stock",
                                    width: Get.width,
                                    style: TextStyle(
                                      color: Color(0xFFFFF9FF),
                                      fontSize: 18,
                                      fontFamily: 'Gilroy-Bold',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    onTap: () {},
                                  )
                                : getSingleProductController
                                            .getSinglePageData
                                            .value
                                            .singleProduct!
                                            .productCartKey ==
                                        "false"
                                    ? MyButton(
                                        bgColor: ColorConstants.appColor,
                                        title: "Add To Cart",
                                        loading: getSingleProductController
                                            .getSinglePageData
                                            .value
                                            .singleProduct!
                                            .cartLoding
                                            .value,
                                        width: Get.width,
                                        style: TextStyle(
                                          color: Color(0xFFFFF9FF),
                                          fontSize: 18,
                                          fontFamily: 'Gilroy-Bold',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        onTap: () {
                                          CartproductId =
                                              getSingleProductController
                                                  .getSinglePageData
                                                  .value
                                                  .singleProduct!
                                                  .productId
                                                  .toString();
                                          if (CartproductId != null) {
                                            getSingleProductController
                                                .getSinglePageData
                                                .value
                                                .singleProduct!
                                                .cartLoding
                                                .value = true;
                                            addToCartController
                                                .SingleCarProductdToCartApiHit();
                                          }
                                        },
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                            GestureDetector(
                                              child: Container(
                                                width: Get.width * 0.1,
                                                height: Get.height * 0.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF53B175),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                child: Center(
                                                    child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                )),
                                              ),
                                              onTap: () {
                                                if (getSingleProductController
                                                        .getSinglePageData
                                                        .value
                                                        .singleProduct!
                                                        .productlocalCartQuantity
                                                        .value >
                                                    1) {
                                                  getSingleProductController
                                                      .getSinglePageData
                                                      .value
                                                      .singleProduct!
                                                      .productlocalCartQuantity
                                                      .value -= 1;

                                                  Future.delayed(
                                                    Duration(seconds: 1),
                                                    () {
                                                      cartQuantityUpdateController
                                                          .cartQuantityUpdateApi(
                                                              getSingleProductController
                                                                  .getSinglePageData
                                                                  .value
                                                                  .singleProduct!
                                                                  .productKey
                                                                  .toString(),
                                                              (int.parse(
                                                                getSingleProductController
                                                                    .getSinglePageData
                                                                    .value
                                                                    .singleProduct!
                                                                    .productlocalCartQuantity
                                                                    .value
                                                                    .toString(),
                                                              )).toString());
                                                    },
                                                  );
                                                }
                                              },
                                            ),
                                            Text(
                                              "${getSingleProductController.getSinglePageData.value.singleProduct!.productlocalCartQuantity.value}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF181725),
                                                fontSize: 22,
                                                fontFamily: 'Gilroy-Bold',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                getSingleProductController
                                                    .getSinglePageData
                                                    .value
                                                    .singleProduct!
                                                    .productlocalCartQuantity
                                                    .value += 1;

                                                Future.delayed(
                                                  Duration(seconds: 1),
                                                  () {
                                                    cartQuantityUpdateController
                                                        .cartQuantityUpdateApi(
                                                            getSingleProductController
                                                                .getSinglePageData
                                                                .value
                                                                .singleProduct!
                                                                .productKey
                                                                .toString(),
                                                            (int.parse(
                                                              getSingleProductController
                                                                  .getSinglePageData
                                                                  .value
                                                                  .singleProduct!
                                                                  .productlocalCartQuantity
                                                                  .value
                                                                  .toString(),
                                                            )).toString());
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: Get.width * 0.1,
                                                height: Get.height * 0.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF53B175),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                child: Center(
                                                    child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                )),
                                              ),
                                            ),
                                          ])),
                            SizedBox(height: Get.height * 0.03),
                            Row(
                              children: [
                                Text(
                                  'Delivery',
                                  style: TextStyle(
                                    color: Color(0xFF8C8D8C),
                                    fontSize: 16,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.04),
                                Text(
                                  getSingleProductController.getSinglePageData
                                      .value.singleProduct!.productDelivery,
                                  style: TextStyle(
                                    color: Color(0xFF181725),
                                    fontSize: 16,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: Get.height * 0.05),
                            Text(
                              'SKU: ${getSingleProductController.getSinglePageData.value.singleProduct!.productSku}',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 16,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.05),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
          }
        }),
        bottomNavigationBar:  BottomNavigationBar(
          currentIndex: selectedIndex, // Set the current index
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
          unselectedLabelStyle: const TextStyle(
              color: const Color(0xffADADAD)), // Unselected label color

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
        )


    );
  }

  Widget TextWiget() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: getSingleProductController
          .getSinglePageData.value.singleProduct!.productCategories!.length,
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 0),
      itemBuilder: (BuildContext context, int index) {
        return Text(
          getSingleProductController.getSinglePageData.value.singleProduct!
              .productCategories![index].category,
          style: TextStyle(
            color: Color(0xFFE90D41),
            fontSize: 12,
            fontFamily: 'Gilroy-Regular',
            fontWeight: FontWeight.w400,
          ),
        );
      },
    );
    ;
  }
}
