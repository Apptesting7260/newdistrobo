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
import '../controllers/AddToCartController/AddToCartController.dart';
import '../controllers/CartQuantityUpdateController/CartQuantityUpdateController.dart';
import '../controllers/NewArrivalsController/NewArrivalController.dart';
import '../controllers/whishlitcontroller/wishlistController.dart';
import '../utils/StatusClass.dart';
import '../view/NvigationTabButton.dart';
import 'ProductDetails.dart';
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
  CartQuantityUpdateController cartQuantityUpdateController =
      Get.put(CartQuantityUpdateController());
  AddToCartController addToCartController = Get.put(AddToCartController());
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

  void _onItemTapped(int index) {

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
                        latestProduct.clear();
                      },
                    );
                  }
                case Status.COMPLETED:
                  return RefreshIndicator(
                    onRefresh: () async {
                      latestProduct.clear();
                      callArrivalPagination.value=true;
                      new_arri_page.value=0;
                      fetchData();
                    },
                    color: ColorConstants.appColor,
                    child: SingleChildScrollView(
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

        ));
  }

  Widget GrideView() {
    return Container(
        child: GridView.builder(
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
              latestProduct[index].productlocalCartQuantity.value =
                  latestProduct[index].productCartQuantity == ""
                      ? 0
                      : latestProduct[index].productCartQuantity;

              if (index < latestProduct.length) {
                return InkWell(
                  onTap: () {

                    productId= latestProduct[index].productId.toString();
                    print(productId);
                    if(productId!=null){
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
                                  productId= latestProduct[index].productId.toString();
                                  print(productId);
                                  if(productId!=null){
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
                                      imageUrl: latestProduct[index]
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
                                  latestProduct[index].productTitle.toString(),
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
                            child: latestProduct[index].perItemPrice==""?
                            Row(
                              children: [

                                Text(
                                  "\$${latestProduct[index].productPrice.toString()}"
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

                              ],
                            ):

                            Row(
                              children: [
                                Text(
                                  "\$${latestProduct[index].perItemPrice.toString()}/ea "
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
                                  "\$${latestProduct[index].productPrice.toString()}/case"
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
                            )

                            ,

                            // Row(
                            //       children: [
                            //         Text(
                            //         '\$ ${latestProduct[index].productPrice.toString()}',
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
                              child: latestProduct[index].productQuantity !=
                                      "false"
                                  ? latestProduct[index].productCartKey == "true"
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
                                                if (latestProduct[index]
                                                        .productlocalCartQuantity
                                                        .value >
                                                    1) {
                                                  latestProduct[index]
                                                      .productlocalCartQuantity
                                                      .value -= 1;

                                                  Future.delayed(
                                                    Duration(seconds: 1),
                                                    () {
                                                      cartQuantityUpdateController
                                                          .cartQuantityUpdateApi(
                                                              latestProduct[index]
                                                                  .productKey
                                                                  .toString(),
                                                              (int.parse(
                                                                latestProduct[
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
                                              "${latestProduct[index].productlocalCartQuantity.value.toString()}",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Gilroy'),
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                latestProduct[index]
                                                    .productlocalCartQuantity
                                                    .value += 1;

                                                Future.delayed(
                                                  Duration(seconds: 1),
                                                  () {
                                                    cartQuantityUpdateController
                                                        .cartQuantityUpdateApi(
                                                            latestProduct[index]
                                                                .productKey,
                                                            int.parse(
                                                              latestProduct[index]
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
                                          loading: latestProduct[index]
                                              .cartLoding
                                              .value,
                                          title: 'Add to Cart',
                                          onTap: () {
                                            // Get.to(MyCart());
                                            CartproductId = latestProduct[index]
                                                .productId
                                                .toString();
                                            if (CartproductId != null) {
                                              latestProduct[index]
                                                  .cartLoding
                                                  .value = true;
                                              addToCartController
                                                  .LastestAddToCartApiHit(index);
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
                                    ))),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return SizedBox.shrink();
            }));
  }
}
