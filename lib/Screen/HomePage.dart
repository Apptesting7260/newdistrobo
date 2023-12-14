import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/MyDrawer.dart';
import '../Widgets/ProdactContantener.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: DrawerClass(
          emailText: "",
        ),

        body: SingleChildScrollView(
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
                              "saran",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Gilroy-rg',
                                  fontSize: 10,
                                  color: Colors.grey[600]),
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
                                onTap: () => Scaffold.of(context).openEndDrawer(),
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
                                        onTap: () {},
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
                          itemCount: 2,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    // width: Get.width * 1,
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          // height: MediaQuery.of(context)
                                          //         .size
                                          //         .height *
                                          //     .19,
                                          child: CachedNetworkImage(
                                            imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd_anlQxAS6NrNRrUj1Bkz2BMSUX99xsDyCZvCORB1EzBHZxgxDcKCkLzzMEpYIIg46nQ&usqp=CAU",
                                            width: Get.width * 1,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            // Optional: Show a loading indicator
                                            errorWidget: (context, url, error) =>
                                                const Icon(Icons
                                                    .error), // Optional: Show an error icon
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
                        padding: const EdgeInsets.only(left: 30, top: 11),
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
                        padding: const EdgeInsets.only(right: 25, top: 11),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "See All",
                            style: TextStyle(
                                fontFamily: 'Gilroy-rg',
                                color: Color.fromRGBO(233, 13, 65, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Container(
                    height: Get.height * 0.155,
                    width: Get.width,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Container(
                            height: Get.height * 0.15,
                            width: Get.width * 0.15,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  slugg;
                                });
                              },
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      height: Get.height * 0.08,
                                      width: Get.width * 0.16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),

                                      child: Image.network(
                                        "https://img.freepik.com/free-vector/gradient-circular-economy-infographic_52683-78120.jpg",
                                      )),
                                  SizedBox(
                                    height: Get.height * 0.005,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Test",
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Color.fromRGBO(16, 24, 17, 1),
                                          ),
                                        ),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
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
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                                height: MediaQuery.of(context).size.height * .21,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd_anlQxAS6NrNRrUj1Bkz2BMSUX99xsDyCZvCORB1EzBHZxgxDcKCkLzzMEpYIIg46nQ&usqp=CAU',
                                  placeholder: (context, url) =>
                                      Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                )),
                          );
                        },
                      ),
                    ),
                  ),

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
                        padding: const EdgeInsets.only(left: 30, top: 11),
                        child: const Text(
                          "Candy & Snack",
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: Color(0xff181725),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 25, top: 11),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "See All",
                            style: TextStyle(
                                fontFamily: 'Gilroy-rg',
                                color: Color.fromRGBO(233, 13, 65, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Container(
                    height: Get.height * 0.45,

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                      return ProductView();
                    },),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(
                      //   width: Get.width * 0.05,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 11),
                        child: const Text(
                          "Candy & Snack",
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: Color(0xff181725),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 25, top: 11),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "See All",
                            style: TextStyle(
                                fontFamily: 'Gilroy-rg',
                                color: Color.fromRGBO(233, 13, 65, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Container(
                    height: Get.height * 0.45,

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ProductView();
                      },),
                  )



                ],
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
