



import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:newdistrobo/Screen/MyOrder.dart';
import 'package:newdistrobo/Widgets/appColor.dart';
import 'package:newdistrobo/controllers/profileController/ProfileDetailsController.dart';
import 'package:newdistrobo/data/modals/Aboutusmodel/AboutUsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';
import '../GlobaleVarribale/Globalevarribale.dart';
import '../GlobaleVarribale/Globalevarribale.dart';
import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/MyButton.dart';
import 'package:http/http.dart' as http;

import '../data/modals/GetCartDetailsModel/GetDetailsModel.dart';
import 'CartDetailsDeleteApi/CartDetailsDeletecontroller.dart';
import 'GetAllCartConterller/GetAllCartController.dart';
import 'GetAllCartConterller/GetCartdetailsOrderController.dart';
import 'GetCartDetailsController/GetCartDetailsController.dart';
import 'ShippingAddresView/GetShippingAdressController.dart';



class OrderController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;
  GetAllCartController GetAllCartControllerin =Get.put(GetAllCartController());
  GetAllorderCartController getAllorderCartController=Get.put(GetAllorderCartController());

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
  GetShippingAdressController getShippingAdressController=Get.put(GetShippingAdressController());
  ProfileDetailsController profileDetailsController =
  Get.put(ProfileDetailsController());
  GetCartDetailsController getCartDetailsController =
  Get.put(GetCartDetailsController());
  List<Map<String, dynamic>>? abstractedData;
  var totalam;



  Future<void> createStripeToken(BuildContext context) async {
    print("totalAmount datfgfghhgfhgfghggg");
    // print( GetAllCartControllerin.getAllCartModel.value.data!.items);


    // totalam= (int.parse(getCartDetailsController.getCartDetails.value.totals!.subtotal)/100).toString();
    // Assuming getCartDetailsController.getCartDetails.value.totals!.total is a String




      print("totalamount  $totalam");


    loaddin.value=true;





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
    print(SobTotal);


    loaddin.value=true;
    print(token);
    final url = Uri.parse('https://api.stripe.com/v1/charges');

    final basicAuth = 'sk_test_51NXOOZEWfTKRF5nZrRBe9vyOiKPvHTV88ZejGwUv7GduPhQV00dAILAZJDbZ2G0yQ7QWRsO8pc4bDbfGgQEFGIq300rRR0Zz5q';

    print(basicAuth);
    final Map<String, String> data = {
      'amount':  ((double.parse(getAllorderCartController.getAllCartModel.value.data!.cartTotal.subtotal.toString()) * 100).toInt()).toString(), //'2000',
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
    abstractedData =  GetAllCartControllerin.getAllCartModel.value.data?.items !
        .map((item) => {
      "product_id": item.productId,
      "quantity": item.quantity,
    })
        .toList();
    Map data={
    "payment_method": "Credit Card (Stripe)",
    "payment_method_title": "Credit",
    "transaction_id": txId,
    // "customer_ip_address": ipAddress,
    "customer_user_agent": "",
    "set_paid": true,
    "customer_id": double.parse(user!).toInt(),
      "billing": {
        "first_name": profileDetailsController.profiledetails.value.userDetails![0].userName,
        "last_name": profileDetailsController.profiledetails.value.userDetails![0].lastName,
        "address_1": profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1,
        "address_2": "",
        "city":  profileDetailsController.profiledetails.value.userDetails![0].userAddress!.city,
        "state": profileDetailsController.profiledetails.value.userDetails![0].userAddress!.state,
        "postcode":profileDetailsController.profiledetails.value.userDetails![0].userAddress!.postcode,
        "country":profileDetailsController.profiledetails.value.userDetails![0].userAddress!.country,
        "email": profileDetailsController.profiledetails.value.userDetails![0].userEmail,
        "phone": profileDetailsController.profiledetails.value.userDetails![0].userPhonenumber
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
        "first_name": profileDetailsController.profiledetails.value.userDetails![0].userName,
        "last_name": profileDetailsController.profiledetails.value.userDetails![0].lastName,
        "address_1": getShippingAdressController.shipingAdress.value.shippingAddress!.address_1,
        "address_2": "",
        "city": getShippingAdressController.shipingAdress.value.shippingAddress!.city,
        "state":getShippingAdressController.shipingAdress.value.shippingAddress!.state,
        "postcode":getShippingAdressController.shipingAdress.value.shippingAddress!.postcode,
        "country": contryController.value.text
      },
      "meta_data": [
        {
          "key": "_wfs_service_type",
          "value": time.toString()
        },


      ],
      "line_items": getAllorderCartController.getAllCartModel.value.data?.items,
      // "coupon_lines" : getCartDetailsController.getCartDetails.value.coupons,
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
      Get.offAll(MyOrder());
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
                          Get.offAll(MyOrder());
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



  Future<void> CasHOncreateOrder(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    var items = GetAllCartControllerin.getAllCartModel.value.data?.items;

    // Map to store product_id and quantity pairs
    Map<int, int> productIdQuantityMap = {};

    // Iterate over items array and store product_id and quantity in the map
   if(items!=null){
     for (var item in items) {
     }
   }

      abstractedData =  GetAllCartControllerin.getAllCartModel.value.data?.items !
          .map((item) => {
        "product_id": item.productId,
        "quantity": item.quantity,
      })
          .toList();
   var datas=GetAllCartControllerin.getAllCartModel.value.data?.items;
   // print(getAllorderCartController.getAllCartModel.value.data?.items.productId);
    GetAllCartControllerin.getAllCartModel.value.data?.items !.forEach((element) {print(element.productId);});

    print('Order Data');
      print(abstractedData);

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
    "payment_method": "Cash On Delivery",
    "payment_method_title": "Cash On Delivery",
    "transaction_id": "",
      "status": "processing",
    // "customer_ip_address": ipAddress,
    "customer_user_agent": "",
    "set_paid": true,
    "customer_id": double.parse(user!).toInt(),
      "billing": {
        "first_name": profileDetailsController.profiledetails.value.userDetails![0].userName,
        "last_name": profileDetailsController.profiledetails.value.userDetails![0].lastName,
        "address_1": profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1,
        "address_2": "",
        "city":  profileDetailsController.profiledetails.value.userDetails![0].userAddress!.city,
        "state": profileDetailsController.profiledetails.value.userDetails![0].userAddress!.state,
        "postcode":profileDetailsController.profiledetails.value.userDetails![0].userAddress!.postcode,
        "country":profileDetailsController.profiledetails.value.userDetails![0].userAddress!.country,
        "email": profileDetailsController.profiledetails.value.userDetails![0].userEmail,
        "phone": profileDetailsController.profiledetails.value.userDetails![0].userPhonenumber
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
     "first_name": profileDetailsController.profiledetails.value.userDetails![0].userName,
      "last_name": profileDetailsController.profiledetails.value.userDetails![0].lastName,
    "address_1": getShippingAdressController.shipingAdress.value.shippingAddress!.address_1,
    "address_2": "",
    "city": getShippingAdressController.shipingAdress.value.shippingAddress!.city,
    "state":getShippingAdressController.shipingAdress.value.shippingAddress!.state,
    "postcode":getShippingAdressController.shipingAdress.value.shippingAddress!.postcode,
    "country": contryController.value.text
    },
    "meta_data": [
      {
        "key": "_wfs_service_type",
        "value": time.toString()
      },
      {"key": "_wfs_service_date", "value": date.toString()},

    ],
      "line_items": getAllorderCartController.getAllCartModel.value.data?.items,
      // "coupon_lines" : getCartDetailsController.getCartDetails.value.coupons,
    };
    final apiUrl = 'https://distrobo.com/wp-json/wc/v3/orders';

    // print(data);

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
      GetAllCartControllerin.GetAllCartModelApiHit();
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
      // print(response.body);
      var x = jsonDecode(response.body);
      // print(x);
      // print(ipAddress);
      // Utils.snackBar( 'Payment', 'Payment Successfully');
      Get.offAll(MyOrder());
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
                          Get.offAll(MyOrder());
                        },
                        height: Get.height * 0.04,
                        width: Get.width * 0.21)
                  ],
                ),
              ),
            );
          });
    }
    else {

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
    // // Loadingbutton.value = false;
    // // coupancodetrue = false;
  }



}
