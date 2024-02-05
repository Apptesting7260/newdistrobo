



import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:newdistrobo/Widgets/appColor.dart';
import 'package:newdistrobo/data/modals/Aboutusmodel/AboutUsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';
import '../Widgets/MyButton.dart';
import 'package:http/http.dart' as http;

import '../data/modals/GetCartDetailsModel/GetDetailsModel.dart';
import 'CartDetailsDeleteApi/CartDetailsDeletecontroller.dart';
import 'GetCartDetailsController/GetCartDetailsController.dart';



class OrderController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final abouUds = AboutUsModel().obs;
  RxString error = ''.obs;
  RxBool loaddin =false.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(AboutUsModel value) => abouUds.value = value;
  void setError(String value) => error.value = value;
  final dateController=TextEditingController().obs;
  final instructionController=TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final contryController = TextEditingController().obs;
  final pinController =TextEditingController().obs;
  RxString cardNumber="".obs;
  RxString expireDate="".obs;
  RxString cvvNumber="".obs;
  RxString holderName="".obs;
  CartDeleteController cartDeleteController=Get.put(CartDeleteController());

  GetCartDetailsController getCartDetailsController =
  Get.put(GetCartDetailsController());
  List<Map<String, dynamic>>? abstractedData;
  var totalam;



  Future<void> createStripeToken(BuildContext context) async {
    // print(totalAmount)

    List<Items>? items =  getCartDetailsController.getCartDetails.value!.items;
    // totalam= (int.parse(getCartDetailsController.getCartDetails.value.totals!.subtotal)/100).toString();
    // Assuming getCartDetailsController.getCartDetails.value.totals!.total is a String
    String totalString = getCartDetailsController.getCartDetails.value.totals!.total;
    double totalAmount = double.parse(totalString);
     totalam = (totalAmount ).toInt();
     print("totalamount  $totalam");

    loaddin.value=true;

    abstractedData = items!
        .map((item) => {
      "product_id": item.id,
      "quantity": item.quantity?.value,
    })
        .toList();

    print(abstractedData);

    print(dateController.value.text);
    var month;
    var year;
    print(cardNumber.value);

    String input = expireDate.value;
    List<String> parts = input.split('/');

    if (parts.length == 2) {
       month = parts[0];
       year = parts[1];

      print("Month: $month");
      print("Year: 20$year"); // Assuming "66" represents the year 2066
    } else {
      print("Invalid date format");
    }
    // print(dateTwo.value.text);
    print("pppppppppppppppppppppppppppp");
    final url = Uri.parse('https://api.stripe.com/v1/tokens');

    // Replace with your actual Stripe publishable key
    final  publishableKey = 'pk_test_51NXOOZEWfTKRF5nZjDd7apps0zBcPjUgxiYNvxeKzjc2XHMfvrX1v6JpGIxVeBSzSv6A66SGV4SY2Q9YTQIo9RnQ00VeBjfHEa';
    print(base64Encode(utf8.encode('$publishableKey:')));
    final cardData = {
      'card[number]': cardNumber.value, //'4242424242424242',
      'card[exp_month]': month, //'08',
      'card[exp_year]': year, //'2024',
      'card[cvc]': cvvNumber.value,
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
        'Basic ' + base64Encode(utf8.encode('$publishableKey')),
      },
      body: cardData,
    );

    if (response.statusCode == 200) {
      // Success, handle the token creation here
      final jsonResponse = jsonDecode(response.body);
      final tokenId = jsonResponse['id'];
      print('Token created successfully with ID: $tokenId');
      createStripeCharge(tokenId,context);
    } else {
      loaddin.value=false;
      // Handle error
      print('Error creating token: ${response.body}');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                height: 165,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: Get.height * 0.001,
                    ),
                    Text(
                      "Payment Failed",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.003,
                    ),
                    Text(
                      "Please Re-try",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    MyButton(
                        title: "Ok",
                        bgColor: ColorConstants.appColor,
                        onTap: () {
                          Get.back();
                        },
                        height: Get.height * 0.04,
                        width: Get.width * 0.21)
                  ],
                ),
              ),
            );
          });
    }
  }




  Future<void> createStripeCharge(String token,BuildContext context) async {


    loaddin.value=true;
    print(token);
    final url = Uri.parse('https://api.stripe.com/v1/charges');

    final basicAuth = 'sk_test_51NXOOZEWfTKRF5nZrRBe9vyOiKPvHTV88ZejGwUv7GduPhQV00dAILAZJDbZ2G0yQ7QWRsO8pc4bDbfGgQEFGIq300rRR0Zz5q';

    print(basicAuth);
    final Map<String, String> data = {
      'amount': totalam.toString(), //'2000',
      'currency': 'usd',
      'source': token,
      'description':
      'My First Test Charge (created for API docs at https://www.stripe.com/docs/api)',
    };
    print(data);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$basicAuth')),
      },
      body: data,
    );
    if (response.statusCode == 200) {
      // Success, handle the charge creation here
      print('Charge created successfully');
      print(response.body);
      var x = jsonDecode(response.body);
      print("tx id is -----------> ${x['id']}");

      createOrder(x['id'],context);
    } else {

      loaddin.value=false;
      print('Error creating charge: ${response.body}');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                height: 165,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: Get.height * 0.001,
                    ),
                    Text(
                      "Payment Failed",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.003,
                    ),
                    Text(
                      "Please Re-try",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    MyButton(
                        title: "Ok",
                        bgColor: ColorConstants.appColor,
                        onTap: () {
                          Get.back();
                        },
                        height: Get.height * 0.04,
                        width: Get.width * 0.21)
                  ],
                ),
              ),
            );
          });
    }
  }




  Future<void> createOrder(String txId,BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    // print("111111111111111111");
    // print("22222222222222222");
    // (coupanFromCart == " "
    //     ? print("w782dzvm")
    //     : print(coupanFromCart.toString()));
    // print(newListOfMaps.value);
    // print(
    //     "mobileeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeennnnnnnnnnnnnnnnnnuber");
    // print(mobilenum_Controller.value.text ?? '');
    //
    // print("useridddddddddddddddddddddddddddddddddddddddddddddddddd");
    // print(userid.value);
    // print("useridddddddddddddddddddddddddddddddddddddddddddddddddd");
    //
    // var totalamt = Tabbuttonlocation.value == 'delivery'
    //     ? (totalPrice.value * 100)
    //     : ((totalPrice.value - ((totalPrice.value  10) / 100))  100);
    //
    // print(userEmailsp);

    Map data={
    "payment_method": "Credit Card (Stripe)",
    "payment_method_title": "Credit",
    "transaction_id": txId,
    // "customer_ip_address": ipAddress,
    "customer_user_agent": "",
    "set_paid": true,
    "customer_id": double.parse(user!).toInt(),
      "billing": {
        "first_name": getCartDetailsController.getCartDetails.value!.customer!.billingAddress!.billingFirstName,
        "last_name": getCartDetailsController.getCartDetails.value!.customer!.billingAddress!.billingLastName,
        "address_1": getCartDetailsController.getCartDetails.value!.customer!.billingAddress!.billingAddress_1,
        "address_2": "",
        "city": getCartDetailsController.getCartDetails.value!.customer!.billingAddress!.billingCity,
        "state":getCartDetailsController.getCartDetails.value!.customer!.billingAddress!.billingState,
        "postcode":getCartDetailsController.getCartDetails.value!.customer!.billingAddress!.billingPostcode,
        "country":getCartDetailsController.getCartDetails.value!.customer!.billingAddress!.billingCountry,
        "email": getCartDetailsController.getCartDetails.value!.customer!.billingAddress!.billingEmail,
        "phone": getCartDetailsController.getCartDetails.value!.customer!.billingAddress!.billingPhone
      },

    // "billing": {
    //   "first_name": "John",
    //   "last_name": "Doe",
    //   "address_1": "969 Market",
    //   "address_2": "",
    //   "city": "San Francisco",
    //   "state": "CA",
    //   "postcode": "94103",
    //   "country": "US",
    //   "email": "john.doe@example.com",
    //   "phone": "(555) 555-5555"
    // },
    "shipping": {
    "first_name":  getCartDetailsController.getCartDetails.value!.customer!.shippingAddress!.shippingFirstName,
    "last_name": getCartDetailsController.getCartDetails.value!.customer!.shippingAddress!.shippingLastName,
    "address_1": addressController.value.text,
    "address_2": "",
    "city": cityController.value.text,
    "state":stateController.value.text,
    "postcode": pinController.value.text,
    "country": contryController.value.text
    },
    "meta_data": [
      {
        "key": "_wfs_service_type",
        "value": dateController.value.text.toString()
      },
      {"key": "_wfs_service_date", "value": instructionController.value.text.toString()},

    ],
      "line_items": abstractedData,
      "coupon_lines" : getCartDetailsController.getCartDetails.value.coupons,
    };
    final apiUrl = 'https://distrobo.com/wp-json/wc/v3/orders';

    print(data);

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
        'Basic Y2tfNWZhZDZhYmI5ZTFiZjExYTZkNDMzOGIzZjYxNDRiMWZkNzliYzk3MTpjc18xYzU5OGRmNDg5NTMyZDk2Y2RiN2Y0ZDlhODYxMWI3Mzg1MjRkYzU1',
        // 'Cookie': 'service_date=2023-08-03',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      print('Order created successfully');
      // clearCart(response);
      // newListOfMaps.value = [];
      cartDeleteController.cartDeleteApi();
      loaddin.value=false;
       dateController.value.clear();
       instructionController.value.clear();
       addressController .value.clear();
       cityController .value.clear();
       stateController .value.clear();
       contryController.value.clear();
       pinController.value.clear();
       cardNumber.value="";
       expireDate.value="";
       cvvNumber.value="";
       holderName.value="";
      // print(body);
      print(response.body);
      var x = jsonDecode(response.body);
      print(x);
      // print(ipAddress);
      // Utils.snackBar( 'Payment', 'Payment Successfully');

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                alignment: Alignment.center,
                height: 175,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    // Icon(
                    //   Icons.cancel,
                    //   color: Colors.red,
                    //   size: 30,
                    // ),
                    SizedBox(
                      height: Get.height * 0.001,
                    ),
                    Text(
                      "Order Placed SuccessFully",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.003,
                    ),
                    Text(
                      "Please Re-try",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    MyButton(
                        title: "Ok",
                        bgColor: ColorConstants.appColor,
                        onTap: () {
                          Get.back();
                        },
                        height: Get.height * 0.04,
                        width: Get.width * 0.21)
                  ],
                ),
              ),
            );
          });
    } else {

      print('Failed to create order. Status code: ${response.statusCode}');
      loaddin.value=false;
      print('Response body: ${response.body}');
      // Utils.snackBar( 'Failed', 'Re-try');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                alignment: Alignment.center,
                height: 175,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: Get.height * 0.001,
                    ),
                    Text(
                      "Payment Failed",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.003,
                    ),
                    Text(
                      "Please Re-try",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    MyButton(
                        title: "Ok",
                        bgColor: ColorConstants.appColor,
                        onTap: () {
                          Get.back();
                        },
                        height: Get.height * 0.04,
                        width: Get.width * 0.21)
                  ],
                ),
              ),
            );
          });
    }
    // Loadingbutton.value = false;
    // coupancodetrue = false;
  }



}
