import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newdistrobo/data/modals/CategoryDetailsModel.dart';

import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/ProdactContantener.dart';
import '../Widgets/appColor.dart';
import '../controllers/CatagarryDetailsController/CategoryDetailsController.dart';
import '../controllers/whishlitcontroller/wishlistController.dart';
import '../utils/StatusClass.dart';
import 'Scaner.dart';

class ProductDetailsPage extends StatefulWidget {
  String title;
   ProductDetailsPage({super.key, required this.title});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  CatagoryDetailsController catagoryDetailsController = Get.put(
      CatagoryDetailsController());
  WhishlistAddController whishlistAddController = Get.put(WhishlistAddController());


  @override
  void initState() {
    // TODO: implement initState
    catagoryDetailsController.CategoryPagedeatails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              toolbarHeight: Get.height * .1,
              title: Text(
                widget.title,
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
              switch (catagoryDetailsController.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(
                      child: CircularProgressIndicator(
                        color: ColorConstants.appColor,
                      ));
                case Status.ERROR:
                  if (catagoryDetailsController.error.value == 'No internet') {
                    return Center(
                      child: InterNetExceptionWidget(
                        onPress: () {
                          catagoryDetailsController.refreshApi();
                        },
                      ),
                    );
                  } else {
                    return GeneralExceptionWidget(
                      onPress: () {
                        catagoryDetailsController.refreshApi();
                      },
                    );
                  }
                case Status.COMPLETED:
                  return SingleChildScrollView(
                    child: Column(
                      children: [
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
                              SizedBox(height: Get.height * 0.03),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: catagoryDetailsController
                                    .categeaoryData.value.data!.length,
                                itemBuilder: (context, index) {
                                  var productData = catagoryDetailsController
                                      .categeaoryData.value.data![index]
                                      .productData;
                                  return GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        mainAxisExtent: Get.height * 0.4),
                                    itemCount: productData!.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context,
                                        int p_index) {
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
                                                        height: Get.height *
                                                            0.18,
                                                        width: Get.width * 0.32,
                                                        decoration: BoxDecoration(
                                                            color: Color
                                                                .fromRGBO(
                                                                242, 243, 242,
                                                                1),
                                                            borderRadius: BorderRadius
                                                                .circular(20)),
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius
                                                              .circular(20),
                                                          child: CachedNetworkImage(
                                                            imageUrl:
                                                            productData[p_index]
                                                                .productImg.toString(),
                                                            placeholder: (
                                                                context, url) =>
                                                                Center(
                                                                    child:
                                                                    CircularProgressIndicator(
                                                                      color: ColorConstants
                                                                          .appColor,)),
                                                            errorWidget: (
                                                                context, url,
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
                                                    Obx(() =>
                                                        Positioned(
                                                            right: 8,
                                                            top: 8,
                                                            child: productData[p_index]
                                                                .isLoding.value
                                                                ? CupertinoActivityIndicator(
                                                              color: ColorConstants
                                                                  .appColor,)
                                                                : GestureDetector(
                                                              onTap: () {
                                                                productId =
                                                                    productData[p_index]
                                                                        .productId
                                                                        .toString();
                                                                if (productId !=
                                                                    null) {
                                                                  whishlistAddController.CategoryWhishLisAddPageApi(p_index,index);
                                                                  productData[p_index].isLoding.value=true;
                                                                  print(   productData[p_index].isLoding.value);
                                                                }
                                                              },
                                                              child: Container(
                                                                child: productData[p_index]
                                                                    .productWishlist ==
                                                                    true ? Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  size: 18,
                                                                  color: Colors
                                                                      .red,
                                                                ) : Icon(
                                                                  Icons
                                                                      .favorite_border,
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
                                                  padding: const EdgeInsets
                                                      .only(left: 15.0),
                                                  child: GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: Get.height * 0.04,
                                                      child: Text(
                                                        productData[p_index]
                                                            .productTitle,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            fontFamily: 'Gilroy',
                                                            color: Color
                                                                .fromRGBO(
                                                                9, 64, 94, 1)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.01,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(left: 15.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '\$${ productData[p_index]
                                                            .productPrice}',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            fontFamily: 'Gilroy',
                                                            color: Color
                                                                .fromRGBO(
                                                                214, 51, 72,
                                                                1)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.015,
                                                ),
                                                Container(
                                                    child:productData[p_index].productQuantity!="Out of Stock"&&
                                                  productData[p_index].productQuantity!=null?
                                                    MyButton(
                                                      title: 'Add to Cart',
                                                      onTap: () {
                                                        // Get.to(MyCart());
                                                      },
                                                      bgColor: ColorConstants
                                                          .appColor,
                                                      width: Get.width * 0.28,
                                                      height: Get.height * 0.05,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily: 'Gilroy-SemiBold',
                                                        fontWeight: FontWeight
                                                            .w400,
                                                      ),
                                                    ):
                                                    Container(
                                                      width: Get.width * 0.28,
                                                      height: Get.height * 0.05,
                                                      decoration: ShapeDecoration(
                                                        color: Color(0xFF53B175),
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                                                    )


                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },),


                            ],
                          ),
                        ),
                      ],
                    ),
                  );
              }
            })));
  }

}