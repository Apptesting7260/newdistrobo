import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/appColor.dart';
import 'package:pinput/pinput.dart';

import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../Widgets/Commponent/Commponent.dart';
import '../../Widgets/Commponent/GeneralException.dart';
import '../../Widgets/MyButton.dart';
import '../../controllers/AddToCartController/AddToCartController.dart';
import '../../controllers/CartQuantityUpdateController/CartQuantityUpdateController.dart';
import '../../controllers/SearchController/ProductSearchController.dart';
import '../../controllers/whishlitcontroller/wishlistController.dart';
import '../../data/modals/CategeroryPageModel/CategoryPageModel.dart';
import '../../utils/StatusClass.dart';
import '../../view/NvigationTabButton.dart';
import '../ProductDetails.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({super.key});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  ProductSearchController productSearchController =
      Get.put(ProductSearchController());
  CartQuantityUpdateController cartQuantityUpdateController =
      Get.put(CartQuantityUpdateController());
  WhishlistAddController whishlistAddController =
      Get.put(WhishlistAddController());
  AddToCartController addToCartController = Get.put(AddToCartController());

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
    productSearchController.ProductSearchApi();
    super.initState();
  }
  var teXtData=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,

              centerTitle: true,

              title: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: ColorConstants.appColor)),
                    hintStyle:
                        TextStyle(fontSize: 12, color: Color(0xffBABABA)),
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    prefixIcon: Image.asset(
                      'assets/images/search.png',
                      scale: 0.9,
                    ),
                    suffixIcon:teXtData==true? IconButton(
                        onPressed: () {
                         setState(() {
                           teXtData=false;
                         });
                          productSearchController.searchController.value
                              .clear();
                          Get.back();
                        },
                        icon: Icon(Icons.clear)):null,
                    hintText: "Search....",
                    filled: true,
                    fillColor: Colors.white),
                controller: productSearchController.searchController.value,
                onChanged: (value) {
                  if(value.isNotEmpty){
                   setState(() {

                     teXtData=true;                   });
                  }
                  else{
                  setState(() {
                    teXtData=false;
                  });
                  }
                  productSearchController.ProductSearchApi();
                },
              )),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * .002,
                ),
                Stack(
                  children: [],
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                Expanded(child: Container(
                  child: Obx(() {
                    switch (productSearchController.rxRequestStatus.value) {
                      case Status.LOADING:
                        return const Center(
                            child: CircularProgressIndicator(
                          color: ColorConstants.appColor,
                        ));
                      case Status.ERROR:
                        if (productSearchController.error.value ==
                            'No internet') {
                          return InterNetExceptionWidget(
                            onPress: () {
                              productSearchController.ProductSearchApi();
                            },
                          );
                        } else {
                          return GeneralExceptionWidget(
                            onPress: () {
                              productSearchController.ProductSearchApi();
                            },
                          );
                        }
                      case Status.COMPLETED:
                        return Container(
                          child: productSearchController.ProductSearch.value
                                      .productCategory!.length ==
                                  0
                              ? Center(
                                  child:  EmptyCart())
                              : GrideView(),
                        );
                    }
                  }),
                ))
              ],
            ),
          ),
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
            unselectedLabelStyle:
                const TextStyle(color: const Color(0xffADADAD)),
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
          )),
    );
  }

  // void search(String query) {
  //   // Use the original list and filter it based on the query
  //   List<ProductCategory> searchResults = productSearchController
  //       .ProductSearch.value.productCategory
  //   !.where((item) => item.name!.toLowerCase().contains(query.toLowerCase())).cast<Allmakers>()
  //       .toList();
  //
  //   // Update the UI with the search results
  //   setState(() {
  //     if(_searchController.text !=""){
  //       allmaker = searchResults;
  //     }
  //     else{
  //       allmaker=ListAllMakerControllerinstance
  //           .userList.value.allmakers!;
  //     }
  //   });
  // }

  Widget GrideView() {
    return Container(
        child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: Get.height * 0.39),
            itemCount: productSearchController
                .ProductSearch.value.productCategory!.length,
            itemBuilder: (BuildContext context, int index) {
              print(productSearchController
                  .ProductSearch.value.productCategory!.length);
              productSearchController
                  .ProductSearch
                  .value
                  .productCategory![index]
                  .productlocalCartQuantity
                  .value = productSearchController.ProductSearch.value
                          .productCategory![index].productCartQuantity ==
                      ""
                  ? 0
                  : int.parse(productSearchController.ProductSearch.value
                      .productCategory![index].productCartQuantity
                      .toString());

              return InkWell(
                onTap: () {
                  productId = productSearchController
                      .ProductSearch.value.productCategory![index].productId
                      .toString();
                  print(productId);
                  if (productId != null) {
                    Get.to(ProductDetailais());
                  }
                },
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
                              onTap: () {
                                productId = productSearchController
                                    .ProductSearch
                                    .value
                                    .productCategory![index]
                                    .productId
                                    .toString();
                                print(productId);
                                if (productId != null) {
                                  Get.to(ProductDetailais());
                                }
                              },
                              child: Container(
                                height: Get.height * 0.18,
                                width: Get.width * 0.32,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(242, 243, 242, 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: productSearchController
                                        .ProductSearch
                                        .value
                                        .productCategory![index]
                                        .productImg
                                        .toString(),
                                    width: Get.width * 1,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator(
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
                                  child: productSearchController
                                          .ProductSearch
                                          .value
                                          .productCategory![index]
                                          .isLoding
                                          .value
                                      ? CupertinoActivityIndicator(
                                          color: ColorConstants.appColor,
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            productId = productSearchController
                                                .ProductSearch
                                                .value
                                                .productCategory![index]
                                                .productId
                                                .toString();
                                            if (productId != null) {
                                              whishlistAddController
                                                  .ProductSearchWhishLisAddPageApi(
                                                      index);
                                              productSearchController
                                                  .ProductSearch
                                                  .value
                                                  .productCategory![index]
                                                  .isLoding
                                                  .value = true;
                                              print(productSearchController
                                                  .ProductSearch
                                                  .value
                                                  .productCategory![index]!
                                                  .isLoding
                                                  .value);
                                            }
                                          },
                                          child: Container(
                                            child: productSearchController
                                                        .ProductSearch
                                                        .value
                                                        .productCategory![index]
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
                            // Positioned(
                            //   left: 8,
                            //   top: 8,
                            //   child: Container(
                            //     child: Image.asset(
                            //       'assets/images/arrivals.png',
                            //       color: ColorConstants.appColor,
                            //       scale: 1.8,
                            //     ),
                            //   ),
                            // ),
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
                                productSearchController.ProductSearch.value
                                    .productCategory![index].productTitle
                                    .toString(),
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
                          child: productSearchController.ProductSearch.value
                                      .productCategory![index].perItemPrice ==
                                  ""
                              ? Row(
                                  children: [
                                    Text(
                                      "\$${productSearchController.ProductSearch.value.productCategory![index].productPrice.toString()}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Gilroy',
                                          color:
                                              Color.fromRGBO(214, 51, 72, 1)),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Text(
                                      "\$${productSearchController.ProductSearch.value.productCategory![index].toString()}/ea ",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Gilroy',
                                          color:
                                              Color.fromRGBO(214, 51, 72, 1)),
                                    ),
                                    Text(
                                      "\$${productSearchController.ProductSearch.value.productCategory![index].productPrice.toString()}/case",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Gilroy',
                                          color: ColorConstants.subTextColor),
                                    ),
                                  ],
                                ),

                          // Row(
                          //       children: [
                          //         Text(
                          //         '\$ ${     productSearchController.ProductSearch.value.productCategory![index].productPrice.toString()}',
                          //           style: TextStyle(
                          //               fontSize: 16,
                          //               fontWeight: FontWeight.w600,
                          //               fontFamily: 'Gilroy',
                          //               color: Color.fromRGBO(214, 51, 72, 1)),
                          //         ),
                          //       ],
                          //     ),
                        ),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        Obx(() => Container(
                            child: productSearchController
                                        .ProductSearch
                                        .value
                                        .productCategory![index]
                                        .productQuantity !=
                                    "false"
                                ? productSearchController
                                            .ProductSearch
                                            .value
                                            .productCategory![index]
                                            .productCartKey ==
                                        "true"
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
                                              if (productSearchController
                                                      .ProductSearch
                                                      .value
                                                      .productCategory![index]
                                                      .productlocalCartQuantity
                                                      .value >
                                                  1) {
                                                productSearchController
                                                    .ProductSearch
                                                    .value
                                                    .productCategory![index]
                                                    .productlocalCartQuantity
                                                    .value -= 1;

                                                Future.delayed(
                                                  Duration(seconds: 1),
                                                  () {
                                                    cartQuantityUpdateController
                                                        .cartQuantityUpdateApi(
                                                            productSearchController
                                                                .ProductSearch
                                                                .value
                                                                .productCategory![
                                                                    index]
                                                                .productKey
                                                                .toString(),
                                                            (int.parse(
                                                              productSearchController
                                                                  .ProductSearch
                                                                  .value
                                                                  .productCategory![
                                                                      index]
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
                                            "${productSearchController.ProductSearch.value.productCategory![index].productlocalCartQuantity.value.toString()}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Gilroy'),
                                          )),
                                          GestureDetector(
                                            onTap: () {
                                              productSearchController
                                                  .ProductSearch
                                                  .value
                                                  .productCategory![index]
                                                  .productlocalCartQuantity
                                                  .value += 1;

                                              Future.delayed(
                                                Duration(seconds: 1),
                                                () {
                                                  cartQuantityUpdateController
                                                      .cartQuantityUpdateApi(
                                                          productSearchController
                                                              .ProductSearch
                                                              .value
                                                              .productCategory![
                                                                  index]
                                                              .productKey,
                                                          int.parse(
                                                            productSearchController
                                                                .ProductSearch
                                                                .value
                                                                .productCategory![
                                                                    index]
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
                                    : Obx(() => MyButton(
                                          loading: productSearchController
                                              .ProductSearch
                                              .value
                                              .productCategory![index]
                                              .cartLoding
                                              .value,
                                          title: 'Add to Cart',
                                          onTap: () {
                                            // Get.to(MyCart());
                                            CartproductId =
                                                productSearchController
                                                    .ProductSearch
                                                    .value
                                                    .productCategory![index]
                                                    .productId
                                                    .toString();
                                            if (CartproductId != null) {
                                              productSearchController
                                                  .ProductSearch
                                                  .value
                                                  .productCategory![index]
                                                  .cartLoding
                                                  .value = true;
                                              addToCartController
                                                  .ProductSearchToCartApiHit(
                                                      index);
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
                                  ))),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
  Widget EmptyCart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
              "assets/aapIcon/EmptySerchScreen.png",
              height: 120,
            )),
        SizedBox(
          height: Get.width * 0.03,
        ),
        Text(
          'Data Not Found',
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
          "Maybe go back and try a diffrent\n keyword?",
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

      ],
    );
  }
}
