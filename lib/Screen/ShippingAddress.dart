import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/TextFilled.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../controllers/OrderController.dart';
import 'PayementScreen/PaymentScreen.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({
    super.key,
  });

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  OrderController orderController = Get.put(OrderController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
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
                  child: Form(
                    key: formKey,
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
                        controller: orderController.addressController.value,
                        textColor: Color(0xFF7C7C7C),
                        borderColor: ColorConstants.appColor,
                        hintText: 'Enter address',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your Address';
                          }
                          return null;
                        },
                      ),
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
                        controller: orderController.cityController.value,
                        textColor: Color(0xFF7C7C7C),
                        borderColor: ColorConstants.appColor,
                        hintText: 'Enter city',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your City';
                          }
                          return null;
                        },
                      ),
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
                                controller:
                                    orderController.stateController.value,
                                textColor: Color(0xFF7C7C7C),
                                borderColor: ColorConstants.appColor,
                                hintText: 'Enter state',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your State';
                                  }
                                  return null;
                                },
                              ),
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
                                controller:
                                    orderController.pinController.value,
                                textColor: Color(0xFF7C7C7C),
                                borderColor: ColorConstants.appColor,
                                hintText: 'Enter zip code',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your zip code';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ))
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'Country',
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
                        controller: orderController.contryController.value,
                        textColor: Color(0xFF7C7C7C),
                        borderColor: ColorConstants.appColor,
                        hintText: 'Enter Conuntry',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your Country';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      MyButton(
                        title: 'Save',
                        width: Get.width,
                        bgColor: ColorConstants.appColor,
                        onTap: () {
                          _onValidate();

                        },
                      )
                    ],
                  )),
                )
              ],
            ),
          )),
    );
  }
  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
      Get.to(PaymentScreen());
    } else {
      print('invalid!');
    }
  }
}
