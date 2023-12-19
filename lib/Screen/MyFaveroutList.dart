import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/appBar.dart';
import 'ProductDetails.dart';

class FaverouteListPage extends StatefulWidget {
  FaverouteListPage({super.key});

  @override
  State<FaverouteListPage> createState() => _FaverouteListPageState();
}

class _FaverouteListPageState extends State<FaverouteListPage> {
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
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 22,
            )),
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
      body: SingleChildScrollView(
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
                    height: Get.height * 0.35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1), // Shadow color
                          spreadRadius:
                              0.5, // How much the shadow should spread
                          blurRadius: 1, // How blurry the shadow should be
                          offset: Offset(0, 2), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Shopping List 2",
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    color: Color(0xff181725),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.3,
                            ),
                            Expanded(
                              child: Text(
                                "2 Items ",
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    color: Color(0xf38a8686),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            Expanded(
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
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        Container(
                          height: Get.height * 0.25,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 8.0, // Spacing between columns
                              mainAxisSpacing: 8.0, // Spacing between rows
                            ),
                            itemCount: 2,
                            // Number of items in the grid
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(ProductDetailais());
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius:
                                            BorderRadius.circular(23)),
                                    height: 130,
                                    width: 120,
                                    child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "https://freepngimg.com/thumb/grocery/53982-2-grocery-png-image-high-quality-thumb.png",
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons
                                                  .error), // Customize the error widget as needed.
                                        ))),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * 0.35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1), // Shadow color
                          spreadRadius:
                              0.5, // How much the shadow should spread
                          blurRadius: 1, // How blurry the shadow should be
                          offset: Offset(0, 2), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Shopping List 2",
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    color: Color(0xff181725),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.3,
                            ),
                            Expanded(
                              child: Text(
                                "2 Items ",
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    color: Color(0xf38a8686),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            Expanded(
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
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        Container(
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 8.0, // Spacing between columns
                              mainAxisSpacing: 8.0, // Spacing between rows
                            ),
                            itemCount: 2,
                            // Number of items in the grid
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.off(ProductDetailais());
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius:
                                            BorderRadius.circular(23)),
                                    height: Get.height * 0.5,
                                    width: Get.width,
                                    child: Center(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://freepngimg.com/thumb/grocery/53982-2-grocery-png-image-high-quality-thumb.png",
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons
                                                .error), // Customize the error widget as needed.
                                      ),
                                    )),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
