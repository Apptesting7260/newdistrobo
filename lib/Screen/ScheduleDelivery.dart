import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/TextFilled.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

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
  String? selectDate;
  String? selectTime;
  var dateItems = [
    'Monday, December 4',
    'Monday, December 4',
    'Monday, December 4'
  ];
  var timeItems = ['10 am - 2 pm', '10 am - 2 pm', '10 am - 2 pm'];
  String? selectLocalDate;
  String? selectLocalTime;
  TextEditingController instrucstionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dropdownFocus1.addListener(_onDropdownFocusChange1);
    _dropdownFocus1.addListener(_onDropdownFocusChange1);
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

      print(_isDropdownOpen1);
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
                        'Select Delivery Time',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 20,
                          fontFamily: 'Gilroy-Bold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Container(
                        decoration: BoxDecoration(),
                        child: Focus(
                          focusNode: _dropdownFocus1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text("Select Date"),
                              items: dateItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              value: selectLocalDate,
                              onChanged: (String? value) {
                                setState(() {
                                  print(value);
                                  selectLocalDate = value;
                                  selectDate = value;
                                  print(selectDate);
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: Get.height * 0.07,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
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
                              iconStyleData: selectLocalDate == null
                                  ? IconStyleData(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      // Change to up arrow icon
                                      iconSize: 30,
                                      iconEnabledColor: Colors.black,
                                    )
                                  : IconStyleData(
                                      icon: InkWell(
                                        child: Icon(Icons.close),
                                        onTap: () {
                                          setState(() {
                                            selectLocalDate = null;
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
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      Text(
                        'Time',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Container(
                        decoration: BoxDecoration(),
                        child: Focus(
                          focusNode: _dropdownFocus2,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text("Select Time"),
                              items: timeItems.map((String items) {
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
                                  selectTime = value;
                                  print(selectTime);
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: Get.height * 0.07,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: _isDropdownOpen2 == false
                                        ? Colors.grey
                                        : ColorConstants.appColor,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              iconStyleData: selectLocalTime == null
                                  ? IconStyleData(
                                      icon: Icon(Icons.keyboard_arrow_down),
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
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                      ),
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
                            controller: instrucstionController,
                            maxLines: 7,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide(
                                        color: ColorConstants.appColor)),
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Color(0xFF7C7C7C)),
                                contentPadding: EdgeInsets.all(18),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
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
                          Get.to(ShippingAddress());
                        },
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
