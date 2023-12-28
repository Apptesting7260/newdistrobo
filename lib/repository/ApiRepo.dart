import 'dart:convert';
import 'dart:io';

import '../HomePageModel/HomePageModel.dart';
import '../Network/Login_network/NetworkApiServices.dart';
import '../Response/app_exceptions.dart';
import '../Response/app_url.dart';
import 'package:http/http.dart' as http;

import '../data/modals/CategoryDetailsModel.dart';
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
  HomePageModel? homedata;
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
      final response = await http.post(Uri.parse(AppUrl.subCategarory), body: data);

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
}