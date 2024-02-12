import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/GlobaleVarribale/Globalevarribale.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/TextFilled.dart';
import 'package:newdistrobo/Widgets/appColor.dart';
import 'package:newdistrobo/utils/StatusClass.dart';

import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../controllers/CheckOrderDelevery/CheckOrderDelevery.dart';
import '../controllers/GetAllCartConterller/GetCartdetailsOrderController.dart';
import '../controllers/GetCartDetailsController/GetCartDetailsController.dart';
import '../controllers/OrderController.dart';
import '../controllers/ShedulledDeleverydateController.dart';
import '../controllers/ShippingAddresView/GetShippingAdressController.dart';
import 'PayementScreen/ChosePaymentMathed.dart';
import 'ShippingAddress.dart';

class ScheduleDelivery extends StatefulWidget {
  const ScheduleDelivery({
    super.key,
  });

  @override
  State<ScheduleDelivery> createState() => _ScheduleDeliveryState();
}

class _ScheduleDeliveryState extends State<ScheduleDelivery> {
  FocusNode focusNode = FocusNode();
  FocusNode _dropdownFocus1 = FocusNode();
  FocusNode focusNode1 = FocusNode();
  FocusNode _dropdownFocus2 = FocusNode();
  GetCartDetailsController getCartDetailsController =
      Get.put(GetCartDetailsController());
  OrderController orderController = Get.put(OrderController());
  String? selectDate;
  String? selectTime;
  GetShippingAdressController getShippingAdressController =
      Get.put(GetShippingAdressController());
  ShedeuledeleverydateController shedeuledeleverydateController =
      Get.put(ShedeuledeleverydateController());
  var dateItems = [
    'Monday, December 4',
    'Monday, December 4',
    'Monday, December 4'
  ];
  GetAllorderCartController getAllorderCartController=Get.put(GetAllorderCartController());

  String? selectLocalDate;
  String? selectLocalTime;
  DateTime minimumDate = DateTime.now().subtract(Duration(days: 1));
  String maxdate = DateTime.now().subtract(Duration(days: 10)).toString();

  @override
  void initState() {
    super.initState();
    getShippingAdressController.ShippingAdressApi();
    _dropdownFocus1.addListener(_onDropdownFocusChange1);
    _dropdownFocus2.addListener(_onDropdownFocusChange2);
    getCartDetailsController.GetCartDatailsApiHit();
    shedeuledeleverydateController.ShedeuledeleverydatePageApi();
    getAllorderCartController.GetAllCartModelApiHit();
  }

  bool _isDropdownOpen1 = false;

  void _onDropdownFocusChange1() {
    setState(() {
      _isDropdownOpen1 = _dropdownFocus1.hasFocus;
      _isDropdownOpen2 = _dropdownFocus2.hasFocus;

      print(_isDropdownOpen1);
    });
  }

  bool _isDropdownOpen2 = false;

  void _onDropdownFocusChange2() {
    setState(() {
      _isDropdownOpen2 = _dropdownFocus2.hasFocus;

      print(_isDropdownOpen2);
    });
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
              'Schedule Delivery',
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
            switch (shedeuledeleverydateController.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorConstants.appColor,
                ));
              case Status.ERROR:
                if (shedeuledeleverydateController.error.value ==
                    'No internet') {
                  return Center(
                    child: InterNetExceptionWidget(
                      onPress: () {
                        shedeuledeleverydateController.refreshApi();
                      },
                    ),
                  );
                } else {
                  return GeneralExceptionWidget(
                    onPress: () {
                      shedeuledeleverydateController.refreshApi();
                    },
                  );
                }
              case Status.COMPLETED:
                return SingleChildScrollView(
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



            shedeuledeleverydateController
                .sheduleDelever.value.message ==
            "not_available"? Text(    "Delivery is not available in your Area",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                  fontSize: 20,
                fontWeight: FontWeight.bold,
                  color: Colors.red),):Text(
            'Delivery times are based on earliest availability',
            style: TextStyle(
            color: Color(0xFF7C7C7C),
            fontSize: 16,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w400,
            ),
            ),

                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'Select Delivery Date',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 20,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),

                            Container(
                              decoration: BoxDecoration(),
                              child: Focus(
                                focusNode: _dropdownFocus1,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: Text("Select Date"),
                                    items: shedeuledeleverydateController
                                        .sheduleDelever.value.data!
                                        .map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    value: selectLocalTime,
                                    onChanged: (String? value) {
                                      setState(() {
                                        print(value);
                                        selectLocalTime = value;
                                        time = value;
                                        // selectGender = value;
                                        print(selectLocalTime);
                                      });
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: Get.height * 0.07,
                                      padding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: _isDropdownOpen1 == false
                                              ? Colors.grey
                                              : ColorConstants.appColor,
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                    iconStyleData: selectLocalTime == null
                                        ? IconStyleData(
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            // Change to up arrow icon
                                            iconSize: 30,
                                            iconEnabledColor: Colors.black,
                                          )
                                        : IconStyleData(
                                            icon: InkWell(
                                              child: Icon(Icons.close),
                                              onTap: () {
                                                setState(() {
                                                  selectLocalTime = null;
                                                });
                                              },
                                            ), // Change to down arrow icon
                                            iconSize: 25,
                                            //iconEnabledColor: Colors.black,
                                          ),
                                    dropdownStyleData: DropdownStyleData(
                                      width: Get.width * 0.89,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                      ),
                                      offset: const Offset(10, 0),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(20),
                                        thickness:
                                            MaterialStateProperty.all<double>(
                                                6),
                                        thumbVisibility:
                                            MaterialStateProperty.all<bool>(
                                                true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(height: Get.height * 0.03),
                            // Text(
                            //   'Select Delivery Time',
                            //   style: TextStyle(
                            //     color: Color(0xFF181725),
                            //     fontSize: 20,
                            //     fontFamily: 'Gilroy-Bold',
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: Get.height * 0.01,
                            // ),
                            //
                            // Container(
                            //   decoration: BoxDecoration(),
                            //   child: Focus(
                            //
                            //     focusNode: _dropdownFocus2,
                            //     child: DropdownButtonHideUnderline(
                            //       child: DropdownButton2<String>(
                            //
                            //         isExpanded: true,
                            //         hint: Text("Select Time"),
                            //         items: shedeuledeleverydateController
                            //             .timeItems.value
                            //             .map((String items) {
                            //           return DropdownMenuItem(
                            //             value: items,
                            //             child: Text(items),
                            //           );
                            //         }).toList(),
                            //         value: selectLocalDate,
                            //         onChanged: (String? value) {
                            //           setState(() {
                            //             print(value);
                            //             selectLocalDate = value;
                            //             date = value;
                            //             print(selectLocalDate);
                            //           });
                            //         },
                            //         buttonStyleData: ButtonStyleData(
                            //           height: Get.height * 0.07,
                            //           padding: const EdgeInsets.only(
                            //               left: 14, right: 14),
                            //           decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(20),
                            //             border: Border.all(
                            //               color: _isDropdownOpen2 == false
                            //                   ? Colors.grey
                            //                   : ColorConstants.appColor,
                            //             ),
                            //             color: Colors.white,
                            //           ),
                            //         ),
                            //         iconStyleData: selectLocalDate == null
                            //             ? IconStyleData(
                            //                 icon:
                            //                     Icon(Icons.keyboard_arrow_down),
                            //                 // Change to up arrow icon
                            //                 iconSize: 30,
                            //                 iconEnabledColor: Colors.black,
                            //               )
                            //             : IconStyleData(
                            //                 icon: InkWell(
                            //                   child: Icon(Icons.close),
                            //                   onTap: () {
                            //                     setState(() {
                            //                       selectLocalDate = null;
                            //                     });
                            //                   },
                            //                 ), // Change to down arrow icon
                            //                 iconSize: 25,
                            //                 //iconEnabledColor: Colors.black,
                            //               ),
                            //         dropdownStyleData: DropdownStyleData(
                            //           width: Get.width * 0.89,
                            //           decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(14),
                            //             color: Colors.white,
                            //           ),
                            //           offset: const Offset(10, 0),
                            //           scrollbarTheme: ScrollbarThemeData(
                            //             radius: const Radius.circular(20),
                            //             thickness:
                            //                 MaterialStateProperty.all<double>(
                            //                     6),
                            //             thumbVisibility:
                            //                 MaterialStateProperty.all<bool>(
                            //                     true),
                            //           ),
                            //         ),
                            //         menuItemStyleData: const MenuItemStyleData(
                            //           height: 40,
                            //           padding:
                            //               EdgeInsets.only(left: 14, right: 14),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   decoration: BoxDecoration(),
                            //
                            //   child:   DateTimePicker(
                            //       controller: orderController.dateController.value,
                            //       initialTime: TimeOfDay.now(),
                            //       type: DateTimePickerType.dateTimeSeparate,
                            //       dateMask: 'dd/MM/yyyy',
                            //       dateHintText: "Select date",
                            //       timeHintText:"Select date" ,
                            //
                            //
                            //       decoration: InputDecoration(
                            //           suffixIcon: Icon(Icons.event, color: ColorConstants.appColor),
                            //           fillColor:ColorConstants.appColor ,
                            //           contentPadding: EdgeInsets.fromLTRB(10, 15, 20, 15),
                            //
                            //           focusedBorder: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(25),
                            //               borderSide:
                            //               BorderSide(color: Color(0xffDCDCDC), width: 1)),
                            //           enabledBorder: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(25),
                            //               borderSide:
                            //               BorderSide(color: Color(0xffDCDCDC), width: 1))),
                            //       cursorColor: ColorConstants.appColor,
                            //
                            //       firstDate: DateTime.now(),
                            //       lastDate: DateTime(2100),
                            //       // dateLabelText: 'Date',style: TextStyle(color: Colors.black,fontSize: 15),
                            //       // dateHintText: 'Date',
                            //       onChanged: (val) {
                            //         // print(val);
                            //         // print(val);
                            //         //
                            //         // // setState(() => _valueChanged1 = val);
                            //         // // String dateTimeString = '2023-11-24 06:00';
                            //         //
                            //         // DateTime myDateTime = DateTime.parse(val);
                            //         //
                            //         // String formattedDate =
                            //         //     "${myDateTime.year}-${myDateTime.month}-${myDateTime.day}";
                            //         // String formattedTime =
                            //         //     "${myDateTime.hour}:${myDateTime.minute}";
                            //
                            //         // dateTwo.value.text = formattedDate.toString();
                            //         // time_Controller.value.text =
                            //         //     Taptimebutton.value = formattedTime.toString();
                            //       },
                            //       validator: (val) {
                            //         // setState(() => _valueToValidate1 = val ?? '');
                            //         // dateTwo.value.text = _valueChanged1.toString();
                            //         print(val);
                            //         return null;
                            //       },
                            //       onSaved: (val) {
                            //         print(val);
                            //         print(val);
                            //         // setState(() => _valueSaved1 = val ?? '');
                            //         // dateTwo.value.text = _valueChanged1.toString();
                            //         // Taptimebutton.value = val.toString();
                            //       }),
                            //
                            // ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            Text(
                              'Instructions',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 20,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                                height: 0.07,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Container(
                                width: Get.width,
                                height: Get.height * .15,
                                // decoration: ShapeDecoration(
                                //   shape: RoundedRectangleBorder(
                                //     side: BorderSide(width: 1, color: Color(0xFFC7C7C7)),
                                //     borderRadius: BorderRadius.circular(15),
                                //
                                //   ),
                                // ),
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: orderController
                                      .instructionController.value,
                                  maxLines: 7,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          borderSide: BorderSide(
                                              color: ColorConstants.appColor)),
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF7C7C7C)),
                                      contentPadding: EdgeInsets.all(18),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          borderSide: BorderSide(
                                              color: Color(0xffBABABA))),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          borderSide: BorderSide(
                                              color: Color(0xffBABABA))),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xffBABABA)),
                                      ),
                                      hintText: 'Enter Instructions',
                                      filled: true,
                                      fillColor: Colors.white),
                                )),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),

                            MyButton(
                              title: 'Go to Checkout',
                              bgColor: ColorConstants.appColor,
                              width: Get.width,
                              onTap: () {
                                if (shedeuledeleverydateController
                                        .sheduleDelever.value.message !=
                                    "not_available") {
                                  Get.to(ChosePaymentMethod());
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: BorderSide.none),
                                        title: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Delivery is not available in your Area",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // GestureDetector(
                                            //   child: const Icon(
                                            //     Icons.camera_alt_outlined,
                                            //     color: Colors.white,
                                            //   ),
                                            //   onTap: () {
                                            //     _pickImage(ImageSource.camera);
                                            //   },
                                            // ),
                                            Center(
                                              child: MyButton(
                                                bgColor:
                                                    ColorConstants.appColor,
                                                width: Get.width * .27,
                                                height: Get.height * .05,
                                                title: "Ok",
                                                onTap: () {
                                                  Get.back();
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                                // checkDeleveryController.CheckDelevery(context);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
            }
          })),
    );
  }
}
