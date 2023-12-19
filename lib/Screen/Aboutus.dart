import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/appBar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
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
                title: "About",
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage("assets/images/aboutlogo.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: Get.width * 0.1),
                            Text(
                              'About',
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
                              child: Image.asset("assets/images/about.png"),
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
                    Text(
                      "'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'",
                      style: TextStyle(
                        color: Color(0xFF8C8D8C),
                        fontSize: 12,
                        fontFamily: 'Gilroy-Regular',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'What is Lorem Ipsum?'
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
                      "'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'",
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
                    Text(
                      " 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'",
                      style: TextStyle(
                        color: Color(0xFF8C8D8C),
                        fontSize: 12,
                        fontFamily: 'Gilroy-Regular',
                        fontWeight: FontWeight.w400,
                      ),
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
                            child: Image.asset("assets/images/phone.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '9876543210',
                          style: TextStyle(
                            color: Color(0xFF323643),
                            fontSize: 14,
                            fontFamily: 'Gilroy-Regular',
                            fontWeight: FontWeight.w400,
                            height: 0.10,
                          ),
                        )
                      ],
                    ),
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
                            child: Image.asset("assets/images/mail.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'examplecompany@gmail.com',
                          style: TextStyle(
                            color: Color(0xFF323643),
                            fontSize: 14,
                            fontFamily: 'Gilroy-Regular',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
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
                            child: Image.asset("assets/images/livelocate.png")),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            'Sandford RoadSandford, Wareham,Dorset BH20 7DD',
                            style: TextStyle(
                              color: Color(0xFF323643),
                              fontSize: 14,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'",
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
          ),
        ),
      )),
    );
  }
}
