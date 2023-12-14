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
        body:
               Padding(
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
                          padding:
                          const EdgeInsets.only(left: 12.0, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(children: [
                                Image.network(
                                 "https://img.freepik.com/free-vector/gradient-real-estate-facebook-cover_23-2149051101.jpg?size=626&ext=jpg",
                                  scale: 0.7,
                                ),
                                Positioned(
                                  top: 64,
                                  left: 20,
                                  child: Text(
                                   "tittle",
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-m',
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: CachedNetworkImage(
                                    imageUrl:  "https://img.freepik.com/free-vector/gradient-real-estate-facebook-cover_23-2149051101.jpg?size=626&ext=jpg",
                                    placeholder: (context, url) => const Center(
                                        child:
                                        CircularProgressIndicator()), // Optional: Show a loading indicator
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons
                                        .error), // Optional: Show an error icon
                                  ),
                                )
                              ]),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "aboutUsController.aboutus.value.aboutTitle"
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Gilroy',
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "aboutUsController.aboutus.value.aboutContent!"
                                    .replaceAll("<p>", " ")
                                    .replaceAll("</p>", " ")
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Gilroy-rg',
                                    color: Colors.grey),
                                textAlign: TextAlign.justify,
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
                                        borderRadius:
                                        BorderRadius.circular(23),
                                        color: Colors.green[100],
                                      ),
                                      child: Image.network( "https://img.freepik.com/free-vector/gradient-real-estate-facebook-cover_23-2149051101.jpg?size=626&ext=jpg")),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                  "  aboutUsController.aboutus.value.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Gilroy-rg'),
                                    textAlign: TextAlign.justify,
                                  ),
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
                                        borderRadius:
                                        BorderRadius.circular(23),
                                        color: Colors.green[100],
                                      ),
                                      child: Image.network( "https://img.freepik.com/free-vector/gradient-real-estate-facebook-cover_23-2149051101.jpg?size=626&ext=jpg")),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                  "  aboutUsController.aboutus.value.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Gilroy-rg'),
                                    textAlign: TextAlign.justify,
                                  ),
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
                                        borderRadius:
                                        BorderRadius.circular(23),
                                        color: Colors.green[100],
                                      ),
                                      child: Image.network( "https://img.freepik.com/free-vector/gradient-real-estate-facebook-cover_23-2149051101.jpg?size=626&ext=jpg"
                                          )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "aboutUsController.aboutus.value"
                                          ,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Gilroy-rg'),
                                      textAlign: TextAlign.justify,
                                      softWrap: true,
                                    ),
                                  ),
                                ],
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
               )
      ),
    );
  }
}
