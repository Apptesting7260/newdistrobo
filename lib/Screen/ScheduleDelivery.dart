import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/TextFilled.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../controllers/GetCartDetailsController/GetCartDetailsController.dart';
import '../controllers/OrderController.dart';
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
  OrderController orderController=Get.put(OrderController());
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
  DateTime minimumDate = DateTime.now()
      .subtract(Duration(days: 1));
  String maxdate = DateTime.now()
      .subtract(Duration(days: 10)).toString();
  @override
  void initState() {
    super.initState();
    _dropdownFocus1.addListener(_onDropdownFocusChange1);
    _dropdownFocus1.addListener(_onDropdownFocusChange1);
    getCartDetailsController.GetCartDatailsApiHit();
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

                      Container(
                        decoration: BoxDecoration(),

                        child:   DateTimePicker(
                            controller: orderController.dateController.value,
                            initialTime: TimeOfDay.now(),
                            type: DateTimePickerType.dateTimeSeparate,
                            dateMask: 'dd/MM/yyyy',
                            dateHintText: "Select date",
                            timeHintText:"Select date" ,


                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.event, color: ColorConstants.appColor),
                                fillColor:ColorConstants.appColor ,
                                contentPadding: EdgeInsets.fromLTRB(10, 15, 20, 15),

                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                    BorderSide(color: Color(0xffDCDCDC), width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                    BorderSide(color: Color(0xffDCDCDC), width: 1))),
                            cursorColor: ColorConstants.appColor,

                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                            // dateLabelText: 'Date',style: TextStyle(color: Colors.black,fontSize: 15),
                            // dateHintText: 'Date',
                            onChanged: (val) {
                              // print(val);
                              // print(val);
                              //
                              // // setState(() => _valueChanged1 = val);
                              // // String dateTimeString = '2023-11-24 06:00';
                              //
                              // DateTime myDateTime = DateTime.parse(val);
                              //
                              // String formattedDate =
                              //     "${myDateTime.year}-${myDateTime.month}-${myDateTime.day}";
                              // String formattedTime =
                              //     "${myDateTime.hour}:${myDateTime.minute}";

                              // dateTwo.value.text = formattedDate.toString();
                              // time_Controller.value.text =
                              //     Taptimebutton.value = formattedTime.toString();
                            },
                            validator: (val) {
                              // setState(() => _valueToValidate1 = val ?? '');
                              // dateTwo.value.text = _valueChanged1.toString();
                              print(val);
                              return null;
                            },
                            onSaved: (val) {
                              print(val);
                              print(val);
                              // setState(() => _valueSaved1 = val ?? '');
                              // dateTwo.value.text = _valueChanged1.toString();
                              // Taptimebutton.value = val.toString();
                            }),

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
                            controller: orderController.instructionController.value,
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
                        ),

                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
