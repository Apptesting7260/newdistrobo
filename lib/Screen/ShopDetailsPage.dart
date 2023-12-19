import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/appBar.dart';
import 'Scaner.dart';
import 'ShowAllProductDetails.dart';

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
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            // Parse price as double

                            // counter3=myCartController.myCartData.value.items![index].quantity!.value!;
                            return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: Get.height * 0.13,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(23),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => Get.to(ProductDetailsPage()),
                                    child: Row(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                borderRadius:
                                                    BorderRadius.circular(23)),
                                            height: Get.height * 0.09,
                                            width: Get.width * .2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Image.asset(
                                                  "assets/images/candyim5.png"),
                                              // child: CachedNetworkImage(
                                              //   imageUrl: "https://freepngimg.com/thumb/grocery/53982-2-grocery-png-image-high-quality-thumb.png",
                                              //   placeholder: (context, url) =>
                                              //       Center(
                                              //           child:
                                              //           CircularProgressIndicator()),
                                              //   errorWidget: (context, url,
                                              //       error) =>
                                              //       Icon(Icons
                                              //           .error), // Customize the error widget as needed.
                                              // )
                                            )),
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
                                                "Candy & Snack",
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    //overflow: TextOverflow.ellipsis,
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Gilroy-sb'),
                                              ),
                                            ),
                                            Container(
                                              width: Get.width - 225,
                                              child: Text(
                                                "48 Product",
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    //overflow: TextOverflow.ellipsis,
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontFamily: 'Gilroy-sb'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Get.to(ShopDetailsPage(
                                                  title: "Candy & Snack"));
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 22,
                                            ))
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
