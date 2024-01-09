import 'dart:convert';
import 'dart:io';

import 'package:newdistrobo/data/modals/Aboutusmodel/AboutUsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../HomePageModel/HomePageModel.dart';
import '../Network/Login_network/NetworkApiServices.dart';
import '../Response/app_exceptions.dart';
import '../Response/app_url.dart';
import 'package:http/http.dart' as http;

import '../data/modals/CategoryDetailsModel.dart';
import '../data/modals/GetCartDetailsModel/GetDetailsModel.dart';
import '../data/modals/NewArrivalsModel/NewArrivallsModel.dart';
import '../data/modals/ProductCategaoryDetails/ProductCategoryModel.dart';
import '../data/modals/ShopModel/ShopModel.dart';
import '../data/modals/SubCategoryModel/SubcategoryModel.dart';
import '../data/modals/profilrModel/ProfileModel.dart';


class ApiRepo{
  final _apiService = NetworkApiServices();


  //**************************************create password****************************************
  Future<dynamic> createPass(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.createPass, data);
    print(response);
    return response;
  }

  //**************************************create password****************************************
  // Future<HomePageModel> homePageApi(var data) async {
  //   // print("apihit");
  //
  //   try {
  //     final response = await http.post(Uri.parse(AppUrl.homeApi), body: data);
  //
  //     if (response.statusCode == 200) {
  //       // Parse the JSON response
  //       var jsonData = json.decode(response.body);
  //       print(jsonData);
  //
  //       // Check if jsonData is a Map and not null
  //       if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
  //         // Return the parsed model
  //         return HomePageModel.fromJson(jsonData);
  //       } else {
  //         // If jsonData is not in the expected format, throw an exception
  //         throw Exception('Invalid response format');
  //       }
  //     } else {
  //       // If the response status code is not 200, throw an exception
  //       throw Exception('Failed to load data. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Handle exceptions during the API call
  //     print('Error during API call: $e');
  //     throw Exception('Failed to load data: $e');
  //   }
  //
  // }

  Future<HomePageModel> homePageApi(var data) async {
    // print("apihit");

    try {
      final response = await http.post(Uri.parse(AppUrl.homeApi), body: data);

      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonData = json.decode(response.body);
        print(jsonData);

        // Check if jsonData is a Map and not null
        if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
          // Return the parsed model
          return HomePageModel.fromJson(jsonData);
        } else {
          // If jsonData is not in the expected format, throw an exception
          throw Exception('Invalid response format');
        }
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    }on SocketException {
      throw InternetException('');
    }

    catch (e) {
      // Handle exceptions during the API call
      print('Error during API call: $e');
      throw Exception('Failed to load data: $e');
    }

  }





  //**************************************addWishlist ****************************************
  Future<dynamic> addWishlist(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.addwhishlist, data);
    print(response);
    return response;
  }

  //**************************************ShopApiRepo ****************************************
  Future<ShopModel> shopApi() async {
    // print("apihit");

    try {
      final response = await http.get(Uri.parse(AppUrl.shopApi));

      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonData = json.decode(response.body);
        print(jsonData);

        // Check if jsonData is a Map and not null
        if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
          // Return the parsed model
          return ShopModel.fromJson(jsonData);
        } else {
          // If jsonData is not in the expected format, throw an exception
          throw Exception('Invalid response format');
        }
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    }on SocketException {
      throw InternetException('');
    }

    catch (e) {
      // Handle exceptions during the API call
      print('Error during API call: $e');
      throw Exception('Failed to load data: $e');
    }
  }


  //**************************************Shop  sub categorry ApiRepo ****************************************
  Future<SubCategoryModel> SubcategoryPageApi(var data) async {
    // print("apihit");

    try {
      final response = await http.post(Uri.parse(AppUrl.subproCategarory), body: data);

      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonData = json.decode(response.body);
        print(jsonData);

        // Check if jsonData is a Map and not null
        if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
          // Return the parsed model
          return SubCategoryModel.fromJson(jsonData);
        } else {
          // If jsonData is not in the expected format, throw an exception
          throw Exception('Invalid response format');
        }
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    }on SocketException {
      throw InternetException('');
    }

    catch (e) {
      // Handle exceptions during the API call
      print('Error during API call: $e');
      throw Exception('Failed to load data: $e');
    }

  }

  Future<CategoryDetailasModel> CategoryDetailasApi(var data) async {
    // print("apihit");

    try {
      final response = await http.post(Uri.parse(AppUrl.subCategarory), body: data);

      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonData = json.decode(response.body);
        print(jsonData);

        // Check if jsonData is a Map and not null
        if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
          // Return the parsed model
          return CategoryDetailasModel.fromJson(jsonData);
        } else {
          // If jsonData is not in the expected format, throw an exception
          throw Exception('Invalid response format');
        }
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    }on SocketException {
      throw InternetException('');
    }

    catch (e) {
      // Handle exceptions during the API call
      print('Error during API call: $e');
      throw Exception('Failed to load data: $e');
    }

  }


  //**************************************product categary deatils  ****************************************
  Future<ProductCategoryDetailasModel> productCategoryDetails(var data) async {
    // print("apihit");


    try {
      final response = await http.post(Uri.parse(AppUrl.pagenationApi),body: data);

      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonData = json.decode(response.body);
        print(jsonData);

        // Check if jsonData is a Map and not null
        if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
          // Return the parsed model
          return ProductCategoryDetailasModel.fromJson(jsonData);
        } else {
          // If jsonData is not in the expected format, throw an exception
          throw Exception('Invalid response format');
        }
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    }on SocketException {
      throw InternetException('');
    }

    catch (e) {
      // Handle exceptions during the API call
      print('Error during API call: $e');
      throw Exception('Failed to load data: $e');
    }
  }

  //**************************************ProfileDetailasApi  deatils  ****************************************

  Future<ProfileModel> ProfileDetailasApi(var data) async {
    // print("apihit");

    try {
      final response = await http.post(Uri.parse(AppUrl.profileDetailsApi), body: data);

      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonData = json.decode(response.body);
        print(jsonData);

        // Check if jsonData is a Map and not null
        if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
          // Return the parsed model
          return ProfileModel.fromJson(jsonData);
        } else {
          // If jsonData is not in the expected format, throw an exception
          throw Exception('Invalid response format');
        }
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    }on SocketException {
      throw InternetException('');
    }

    catch (e) {
      // Handle exceptions during the API call
      print('Error during API call: $e');
      throw Exception('Failed to load data: $e');
    }

  }

//**************************************product categary deatils  ****************************************
  Future<dynamic> AdressUpdateApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.addressUpdate, data);
    print(response);
    return response;
  }
  //**************************************product categary deatils  ****************************************
  // **************************************product categary deatils  ****************************************
  Future<dynamic>NameUpdateApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.nameUpdate, data);
    print(response);
    return response;
  }
  //**************************************product categary deatils  ****************************************
  // **************************************product categary deatils  ****************************************//**************************************product categary deatils  ****************************************
  Future<dynamic>NumberUpdateApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.phoneUpdate, data);
    print(response);
    return response;
  }
  //**************************************product categary deatils  ****************************************
  Future<dynamic> EmailSendOtp(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.emailSendOtp, data);
    print(response);
    return response;
  }  //**************************************product categary deatils  ****************************************
  Future<dynamic> otpVerify(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.otpVerify, data);
    print(response);
    return response;
  }  //**************************************product categary deatils  ****************************************
  Future<dynamic> emailUpdate(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.emailUpdate, data);
    print(response);
    return response;
  }
  // **************************************product categary deatils  ****************************************
  Future<dynamic>PassUpdateApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.changePass, data);
    print(response);
    return response;
  }
//**************************************product categary deatils  ****************************************




  //**************************************product categary deatils  ****************************************
  Future<NewArivallProductModel> NewArrivalDetails(var data) async {
    // print("apihit");


    try {
      final response = await http.post(Uri.parse(AppUrl.newArrival),body: data);

      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonData = json.decode(response.body);
        print(jsonData);

        // Check if jsonData is a Map and not null
        if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
          // Return the parsed model
          return NewArivallProductModel.fromJson(jsonData);
        } else {
          // If jsonData is not in the expected format, throw an exception
          throw Exception('Invalid response format');
        }
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    }on SocketException {
      throw InternetException('');
    }

    catch (e) {
      // Handle exceptions during the API call
      print('Error during API call: $e');
      throw Exception('Failed to load data: $e');
    }
  }

//**************************************ProfileDetailasApi  deatils  ****************************************


  // **************************************product categary deatils  ****************************************
  Future<dynamic>AddToCartApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi2(AppUrl.addToCartApi, data);
    print(response);
    return response;
  }
//**************************************product categary deatils  ****************************************  // **************************************product categary deatils  ****************************************
  Future<GerCartDetailsModel>GetCartDatailsApi() async {
    SharedPreferences prefs =await  SharedPreferences.getInstance() ;
    var pass=prefs.getString("pass");
    var email=prefs.getString("email");


    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ' + base64Encode(utf8.encode('${email}:${pass}')),
    };
    // print("apihit");

    try {
      final response = await http.get(Uri.parse("https://distrobo.com/wp-json/cocart/v2/cart"), headers: headers);
      if (response.statusCode == 301) {
        // If there's a redirect, extract the new location from headers
        var newLocation = response.headers['location'];
        if (newLocation != null) {
          // Perform another request to the new location
         var response = await http.get(Uri.parse(newLocation));
         print(response.headers);
        }
      }
      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonData = json.decode(response.body);
        print("addd to cart detaiols");
        print(jsonData);
        print("addd to cart detaiols");

        // Check if jsonData is a Map and not null
        if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
          // Return the parsed model
          return GerCartDetailsModel.fromJson(jsonData);
        } else {
          // If jsonData is not in the expected format, throw an exception
          throw Exception('Invalid response format');
        }
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    }on SocketException {
      throw InternetException('');
    }

    catch (e) {
      // Handle exceptions during the API call
      print('Error during API call: $e');
      throw Exception('Failed to load data: $e');
    }
    // dynamic response = _apiService.postApi3(AppUrl.getCartDetails);
    // print(response);
    // return GerCartDetailsModel.fromJson(response);
  }
//**************************************product categary deatils  ****************************************//**************************************product categary deatils  ****************************************  // **************************************product categary deatils  ****************************************
//   Future<dynamic>GetCartDatailsApi(var data) async {
//     // print("apihit");
//     dynamic response = _apiService.postApi2(AppUrl.getCartDetails, data);
//     print(response);
//     return response;
//   }
//**************************************product categary deatils  ****************************************


  Future<AboutUsModel> AboutUsApi() async {
    // print("apihit");

    try {
      final response = await http.get(Uri.parse(AppUrl.aboutUsApi));

      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonData = json.decode(response.body);
        print(jsonData);

        // Check if jsonData is a Map and not null
        if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
          // Return the parsed model
          return AboutUsModel.fromJson(jsonData);
        } else {
          // If jsonData is not in the expected format, throw an exception
          throw Exception('Invalid response format');
        }
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    }on SocketException {
      throw InternetException('');
    }

    catch (e) {
      // Handle exceptions during the API call
      print('Error during API call: $e');
      throw Exception('Failed to load data: $e');
    }

  }


  Future<dynamic> cartQuantityUpdateApi(var data,String productId) async {
    dynamic response = await _apiService.postApi2( "${AppUrl.cartQuantityUpdateApi}${productId}",data);
    return response;
  }

  Future<dynamic> SendMesangeApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.sendMessengeApi, data);
    print(response);
    return response;
  }
  // **************************************product categary deatils  ****************************************
  Future<dynamic>ImageUpdateApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.ImageUpdate, data);
    print(response);
    return response;

  }
//**************************************product categary deatils  ****************************************

}