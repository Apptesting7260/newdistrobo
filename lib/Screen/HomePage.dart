import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Screen/MyCart.dart';
import 'package:newdistrobo/Screen/Scaner.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/MyDrawer.dart';
import '../Widgets/ProdactContantener.dart';
import '../controllers/CategoryPageController/CategoryPageController.dart';
import '../controllers/homePageController/HomePageController.dart';
import '../controllers/whishlitcontroller/wishlistController.dart';
import '../utils/StatusClass.dart';
import 'ShopDetailsPage.dart';
import 'SubCategeoryPage.dart';

// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

String? slugg;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // ///////////////// location start ////////////////////////

  String? _currentAddress;

  // //////////////// location end /////////////////////////
  HomePageController homeComtroller = Get.put(HomePageController());
  WhishlistAddController whishlistAddController = Get.put(WhishlistAddController());

  List image = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
  ];

  List imageCat = [
    "assets/images/cat1.png",
    "assets/images/cat2.png",
    "assets/images/car3.png",
    "assets/images/cat1.png",
    "assets/images/car3.png",
    "assets/images/cat1.png",
  ];

  List imageCatName = [
    "Candy & Snacks",
    "Vitamins & Energy Boosters",
    "Personal & Health Care",
    "Candy & Snacks",
    "Vitamins & Energy Boosters",
    "Personal & Health Care",
  ];

  @override
  void initState() {
    homeComtroller.homePageApi();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          endDrawer: DrawerClass(
            emailText: "",
          ),
          body: Obx(() {
            switch (homeComtroller.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator(color: ColorConstants.appColor,));
              case Status.ERROR:
                if (homeComtroller.error.value == 'No internet') {
                  return InterNetExceptionWidget(onPress: () {
                  homeComtroller.refreshApi();
                  },);
                } else {
                  return GeneralExceptionWidget( onPress: () {   homeComtroller.refreshApi(); },);
                }
              case Status.COMPLETED:
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: Get.height * 0.07,
                                  width: Get.width * 0.07,
                                  child: Image.asset(
                                    'assets/images/location.png',
                                    scale: 0.6,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    const Text(
                                      "Home",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-m'),
                                    ),
                                    Text(
                                      "6391 Elgin St. Celina, Delaware 10299",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Gilroy-rg',
                                          fontSize: 10,
                                          color: ColorConstants.subTextColor),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: Get.width * 0.06,
                                  width: Get.width * 0.06,
                                  child: InkWell(
                                      onTap: () {
                                        // Get.to(NotificationPage());
                                      },
                                      child: Image.asset(
                                        'assets/images/notification.png',
                                        scale: 0.9,
                                      )),
                                ),
                                SizedBox(
                                  width: Get.width * 0.02,
                                ),
                                Container(
                                  height: Get.width * 0.06,
                                  width: Get.width * 0.06,
                                  child: InkWell(
                                      onTap: () {
                                        // Get.to(MyCart());
                                      },
                                      child: Image.asset(
                                        'assets/images/cart2.png',
                                        scale: 1,
                                      )),
                                ),
                                SizedBox(
                                  width: Get.width * 0.02,
                                ),
                                Container(
                                  height: Get.width * 0.06,
                                  width: Get.width * 0.06,
                                  child: Builder(builder: (context) {
                                    return InkWell(
                                        onTap: () => Scaffold.of(context)
                                            .openEndDrawer(),
                                        child: Image.asset(
                                          'assets/images/menu.png',
                                          scale: 1,
                                        ));
                                  }),
                                ),
                                SizedBox(
                                  width: Get.width * 0.025,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: Get.width * 0.74,
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
                                SizedBox(
                                  width: Get.width * 0.024,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: Get.height * 0.07,
                                    width: Get.width * 0.12,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/filterlogo.png'))),
                                  ),
                                )
                                // Image.asset("assets/images/filterlogo.png",scale: 1.05,)
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Container(
                        height: Get.height * 0.2,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              left: -Get.width * 0.54,
                              child: Container(
                                // width: double.infinity,
                                width: Get.width * 2,
                                height: MediaQuery.of(context).size.height * .2,
                                child: CarouselSlider.builder(
                                  // carouselController: _controller,
                                  itemCount:  homeComtroller.homepage.value.data!.bannerSection!.length,
                                  itemBuilder: (BuildContext context, int index,
                                      int realIndex) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            // width: Get.width * 1,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // height: MediaQuery.of(context)
                                                  //         .size
                                                  //         .height *
                                                  //     .19,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child:
                                                        // Image.asset(image[0]),
                                                    CachedNetworkImage(
                                                      imageUrl:
                                                      homeComtroller.homepage.value.data!.bannerSection![index].bannerImage,
                                                      width: Get.width * 1,
                                                      fit: BoxFit.cover,
                                                      placeholder: (context, url) =>
                                                          const Center(
                                                              child:

                                                                  CircularProgressIndicator(color: ColorConstants.appColor,)),
                                                      // Optional: Show a loading indicator
                                                      errorWidget: (context, url,
                                                              error) =>
                                                          const Icon(Icons
                                                              .error), // Optional: Show an error icon
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  options: CarouselOptions(
                                    // height: Get.height * 0.2,
                                    viewportFraction: 0.42,
                                    // aspectRatio: 0,
                                    autoPlay: false,

                                    enlargeCenterPage: false,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                child: Container(
                              height: Get.height * 0.2,
                              width: Get.width * 0.04,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SizedBox(
                              //   width: Get.width * 0.05,
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 11),
                                child: const Text(
                                  "Shop By Category",
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: Color(0xff181725),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1),
                                ),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 25, top: 11),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "See All",
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-rg',
                                        color: Color.fromRGBO(233, 13, 65, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: Container(
                              height: Get.height * 0.155,
                              width: Get.width,
                              child: ListView.builder(
                                physics: AlwaysScrollableScrollPhysics(),
                                itemCount: homeComtroller.homepage.value.data!.homeCategory!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 32),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(ShopDetailsPage(
                                            title: "Candy & Snack"));
                                        setState(() {
                                          slugg;
                                        });
                                      },
                                      child: Container(
                                        // color: Colors.amber,
                                        width: Get.width * 0.21,
                                        child: Column(
                                          // mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: Get.width * 0.2,
                                              width: Get.width * 0.2,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child:
                                              CachedNetworkImage(
                                                imageUrl:
                                                homeComtroller.homepage.value.data!.homeCategory![index].categoryIcon,
                                                placeholder: (context, url) => Center(
                                                    child:
                                                    CircularProgressIndicator(color: ColorConstants.appColor,)),
                                                errorWidget: (context, url, error) =>
                                                    Icon(Icons
                                                        .error), // Customize the error widget as needed.
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.015,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      homeComtroller.homepage.value.data!.homeCategory![index].categoryName,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF0F1811),
                                                        fontSize: 9,
                                                        fontFamily:
                                                            'Gilroy-Medium',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              height: Get.height * 0.16,
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/xcc.png', fit: BoxFit.contain,
                                // Set the desired width for the image
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              width: double.infinity,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemExtent: 165,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:  homeComtroller.homepage.value.data!.categoryBannerSection!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(ShopDetailsPage(
                                          title: "Candy & Snack"));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .21,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            child:  CachedNetworkImage(
                                              imageUrl:
                                              homeComtroller.homepage.value.data!.categoryBannerSection![index].categoryBannerImage,
                                              placeholder: (context, url) => Center(
                                                  child:
                                                  CircularProgressIndicator(color: ColorConstants.appColor,)),
                                              errorWidget: (context, url, error) =>
                                                  Icon(Icons
                                                      .error), // Customize the error widget as needed.
                                            ),

                                          )),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                         ListView.builder(
                           itemCount: homeComtroller.homepage.value.data!.categoryDetails!.length,
                           physics: NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           itemBuilder: (context, category_index) {
                           return  Column(
                             children: [
                               SizedBox(
                                 height: Get.height * 0.03,
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   // SizedBox(
                                   //   width: Get.width * 0.05,
                                   // ),
                                   Padding(
                                     padding:
                                     const EdgeInsets.only(left: 30, top: 11),
                                     child:  Text(
                                       homeComtroller.homepage.value.data!.categoryDetails![category_index].name,
                                       style: TextStyle(
                                           fontFamily: 'Gilroy',
                                           color: Color(0xff181725),
                                           fontSize: 16,
                                           fontWeight: FontWeight.w600,
                                           letterSpacing: 1),
                                     ),
                                   ),

                                   Padding(
                                     padding:
                                     const EdgeInsets.only(right: 25, top: 11),
                                     child: GestureDetector(
                                       onTap: () {
                                         if(categoryId!=homeComtroller.homepage.value.data!.categoryDetails![category_index].id){
                                           callHomePagination.value =true;
                                           page.value=1;

                                           ProductCategoryLists.clear();
                                         }
                                         currentPage.value=0;
                                         categoryId=homeComtroller.homepage.value.data!.categoryDetails![category_index].id;
                                         categoryName=homeComtroller.homepage.value.data!.categoryDetails![category_index].name;
                                         print(categoryId);

                                         if(categoryId!=null&&categoryName!=null){
                                           Get.to(SubCategoryPage(title:categoryName.toString()));
                                           print(categoryName);
                                           print(categoryId);
                                         }

                                       },
                                       child: const Text(
                                         "See All",
                                         style: TextStyle(
                                             fontFamily: 'Gilroy-rg',
                                             color: Color.fromRGBO(233, 13, 65, 1),
                                             fontSize: 14,
                                             fontWeight: FontWeight.w400,
                                             letterSpacing: 1),
                                       ),
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
                                   itemCount:  homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts!.length,
                                   itemBuilder: (context, c_index) {
                                     return Padding(
                                       padding: EdgeInsets.only(left: 18.0),
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
                                                       height: Get.height * 0.18,
                                                       width: Get.width * 0.32,
                                                       decoration: BoxDecoration(
                                                           color: Color.fromRGBO(242, 243, 242, 1),
                                                           borderRadius: BorderRadius.circular(20)),
                                                       child: ClipRRect(
                                                         borderRadius: BorderRadius.circular(20),
                                                         child: CachedNetworkImage(
                                                           imageUrl:
                                                           homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].productImg,
                                                           placeholder: (context, url) => Center(
                                                               child:
                                                               CircularProgressIndicator(color: ColorConstants.appColor,)),
                                                           errorWidget: (context, url, error) =>
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
                                                   Obx(()=>
                                                       Positioned(
                                                           right: 8,
                                                           top: 8,
                                                           child: homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].isLoding.value?CupertinoActivityIndicator(color: ColorConstants.appColor,): GestureDetector(
                                                             onTap: () {
                                                               productId=  homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].productId.toString();
                                                               if(productId!=null){
                                                                 whishlistAddController.WhishLisAddPageApi(homeComtroller.homepage.value.data!.categoryDetails![category_index].name,c_index,category_index);
                                                                 homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].isLoding.value=true;
                                                                 print(    homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].isLoding.value);
                                                               }
                                                             },
                                                             child: Container(
                                                               child:  homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].productWishlist==true? Icon(
                                                                 Icons.favorite,
                                                                 size: 18,
                                                                 color: Colors.red,
                                                               ):Icon(
                                                                 Icons.favorite_border,
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
                                                 padding: const EdgeInsets.only(left: 15.0),
                                                 child: GestureDetector(
                                                   onTap: () {},
                                                   child: Container(
                                                     height: Get.height*0.04,
                                                     child: Text(
                                                       homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].productTitle,
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
                                                       '\$${  homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].productPrice}',
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
                                                   child: MyButton(
                                                     title: 'Add to Cart',
                                                     onTap: () {
                                                       Get.to(MyCart());
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
                                                   )),
                                             ],
                                           ),
                                         ),
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
                         },)
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                    ],
                  ),
                );
            }
          })),
    );
  }
}
