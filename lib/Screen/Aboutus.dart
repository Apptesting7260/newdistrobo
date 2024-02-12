import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/appBar.dart';
import '../Widgets/appColor.dart';
import '../controllers/AboutUsController/AbousUsController.dart';
import '../utils/StatusClass.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  AboutUsController aboutUsController = Get.put(AboutUsController());

  @override
  void initState() {
    aboutUsController.AboutUsApiHit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        switch (aboutUsController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
                child: CircularProgressIndicator(
              color: ColorConstants.appColor,
            ));
          case Status.ERROR:
            if (aboutUsController.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {
                  aboutUsController.refreshApi();
                },
              );
            } else {
              return GeneralExceptionWidget(
                onPress: () {
                  aboutUsController.refreshApi();
                },
              );
            }
          case Status.COMPLETED:
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    AppBarWidget(
                      img: 'assets/images/notification.png',
                      title: "About Us",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Container(
                              width: Get.width,
                              height: Get.height * 0.15,

                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(aboutUsController.abouUds.value.aboutBannerImage),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: Get.width * 0.1),
                                  Text(
                                    aboutUsController.abouUds.value.aboutBannerTitle,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Alanta Rosery',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: Get.width * 0.25),
                                  Container(
                                    height: Get.height * 0.1,
                                    child:
                                    CachedNetworkImage(
                                      imageUrl:  aboutUsController.abouUds.value.aboutBannerBackgroundImage,
                                      placeholder: (context, url) => const Center(
                                          child:
                                          CircularProgressIndicator(color:ColorConstants.appColor ,)), // Optional: Show a loading indicator
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons
                                          .error), // Optional: Show an error icon
                                    ),
                                  )
                                ],
                              ),
                              // child: CachedNetworkImage(
                              //   imageUrl:  "https://img.freepik.com/free-vector/gradient-real-estate-facebook-cover_23-2149051101.jpg?size=626&ext=jpg",
                              //   placeholder: (context, url) => const Center(
                              //       child:
                              //       CircularProgressIndicator()), // Optional: Show a loading indicator
                              //   errorWidget: (context, url, error) =>
                              //   const Icon(Icons
                              //       .error), // Optional: Show an error icon
                              // ),
                            ),
                          ]),
                          SizedBox(
                            height: 20,
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            aboutUsController.abouUds.value.aboutTitle
                                .replaceAll("<p>", " ")
                                .replaceAll("</p>", " ")
                                .toString(),
                            style: TextStyle(
                              color: Color(0xFF0F1811),
                              fontSize: 16,
                              fontFamily: 'Gilroy-Bold',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                          aboutUsController.abouUds.value.aboutContent,
                            style: TextStyle(
                              color: Color(0xFF8C8D8C),
                              fontSize: 12,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                       Container(
                         child:  ListView.builder(
                           shrinkWrap: true,
                           physics: NeverScrollableScrollPhysics(),
                           itemCount:  aboutUsController.abouUds.value.aboutUsContactDetails!.length,
                           itemBuilder: (context, index) {
                             return Column(
                               children: [
                                 SizedBox(
                                   height: 20,
                                 ),

                                 Row(
                                   children: [
                                     Container(
                                       height: 35,
                                       width: 35,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(23),
                                         color: Colors.green[100],
                                       ),
                                       child:
                                       CachedNetworkImage(
                                         imageUrl: aboutUsController.abouUds.value.aboutUsContactDetails![index].icon,
                                         placeholder: (context, url) => const Center(
                                             child:
                                             CircularProgressIndicator(color:ColorConstants.appColor ,)), // Optional: Show a loading indicator
                                         errorWidget: (context, url, error) =>
                                         const Icon(Icons
                                             .error), // Optional: Show an error icon
                                       ),

                                     ),
                                     SizedBox(
                                       width: 10,
                                     ),
                                     Container(
                                       width: Get.width*0.75,
                                       child: Text(
                                         aboutUsController.abouUds.value.aboutUsContactDetails![index].title,

                                          overflow: TextOverflow.ellipsis,
                                         maxLines: 2,

                                         style: TextStyle(
                                           color: Color(0xFF323643),
                                           fontSize: 14,
                                           fontFamily: 'Gilroy-Regular',
                                           fontWeight: FontWeight.w400,
                                         ),
                                       ),
                                     )
                                   ],
                                 ),

                               ],
                             );
                           },),
                       ),
                          SizedBox(
                            height: 10,
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //         height: 35,
                          //         width: 35,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(23),
                          //           color: Colors.green[100],
                          //         ),
                          //         child: Image.asset("assets/images/mail.png")),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text(
                          //       'examplecompany@gmail.com',
                          //       style: TextStyle(
                          //         color: Color(0xFF323643),
                          //         fontSize: 14,
                          //         fontFamily: 'Gilroy-Regular',
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Row(
                          //   children: [
                          //     Container(
                          //         height: 35,
                          //         width: 35,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(23),
                          //           color: Colors.green[100],
                          //         ),
                          //         child: Image.asset(
                          //             "assets/images/livelocate.png")),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Flexible(
                          //       child: Text(
                          //         'Sandford RoadSandford, Wareham,Dorset BH20 7DD',
                          //         style: TextStyle(
                          //           color: Color(0xFF323643),
                          //           fontSize: 14,
                          //           fontFamily: 'Gilroy-Regular',
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Text(
        aboutUsController.abouUds.value.aboutBelowContent ,
                            style: TextStyle(
                              color: Color(0xFF8C8D8C),
                              fontSize: 12,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                )));
        }
      })),
    );
  }
}
