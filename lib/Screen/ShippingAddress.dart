import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/TextFilled.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({
    super.key,
  });

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ;
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
              'Shipping Address',
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TextFilled(
                          controller: addressController,
                          textColor: Color(0xFF7C7C7C),
                          borderColor: ColorConstants.appColor,
                          hintText: 'Enter address',
                          validator: null),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'City',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TextFilled(
                          controller: cityController,
                          textColor: Color(0xFF7C7C7C),
                          borderColor: ColorConstants.appColor,
                          hintText: 'Enter city',
                          validator: null),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State',
                                style: TextStyle(
                                  color: Color(0xFF181725),
                                  fontSize: 18,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFilled(
                                  controller: stateController,
                                  textColor: Color(0xFF7C7C7C),
                                  borderColor: ColorConstants.appColor,
                                  hintText: 'Enter state',
                                  validator: null),
                            ],
                          )),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ZIP Code',
                                style: TextStyle(
                                  color: Color(0xFF181725),
                                  fontSize: 18,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFilled(
                                  controller: stateController,
                                  textColor: Color(0xFF7C7C7C),
                                  borderColor: ColorConstants.appColor,
                                  hintText: 'Enter zip code',
                                  validator: null),
                            ],
                          ))
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      MyButton(
                        title: 'Save',
                        width: Get.width,
                        bgColor: ColorConstants.appColor,
                        onTap: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
