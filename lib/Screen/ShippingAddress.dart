import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/TextFilled.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../controllers/CheckOrderDelevery/CheckOrderDelevery.dart';
import '../controllers/GetAllCartConterller/GetAllCartController.dart';
import '../controllers/ShipingAdressUpdateController.dart';
import 'PayementScreen/PaymentScreen.dart';
import 'ScheduleDelivery.dart';

class ShippingAddressss extends StatefulWidget {
  const ShippingAddressss({
    super.key,
  });

  @override
  State<ShippingAddressss> createState() => _ShippingAddressssState();
}

class _ShippingAddressssState extends State<ShippingAddressss> {
  ShippingAdressUpdateController ShipingAdressController = Get.put(ShippingAdressUpdateController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GetAllCartController GetAllCartControllerin = GetAllCartController();
  @override
  void initState() {
    ShipingAdressController.setControllerData(context);
    GetAllCartControllerin.GetAllCartModelApiHit();
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
                        controller: ShipingAdressController.shippingaddressController.value,
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
                        controller: ShipingAdressController.cityController.value,
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
                                    ShipingAdressController.stateController.value,
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
                                    ShipingAdressController.postcodeController.value,
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
                        controller: ShipingAdressController.countryController.value,
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
                     Obx(() =>  MyButton(
                       title: 'Save',
                       width: Get.width,
                       loading: ShipingAdressController.resendVisible.value,
                       bgColor: ColorConstants.appColor,
                       onTap: () {
                         _onValidate();

                       },
                     ))
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
    ShipingAdressController.ShippingAdresssUpdateHitApi(context);
      // checkDeleveryController.CheckDelevery(context);
    } else {
      print('invalid!');
    }
  }
}
