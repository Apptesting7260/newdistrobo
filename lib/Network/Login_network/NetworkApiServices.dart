import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:newdistrobo/Network/Login_network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:newdistrobo/Response/app_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiServices extends BaseApiServices {

  Future<dynamic> postApi(String url, var data) async {
    // print('Api hit');

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);

      print(responseJson);
    }


    on SocketException {
      throw BadRequestException('No internet');

    }

    return responseJson;
  }
  Future<dynamic> getApi(String url) async {
    var apiresponsehit;
    if (kDebugMode) {
      print(url);
    }





    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
          const Duration(seconds: 10));
      responseJson = returnResponse(response);
      apiresponsehit = jsonDecode(response.body);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    print(responseJson);
    return responseJson;
  }
  Future<dynamic> postApi2(String url, var data) async {
    SharedPreferences prefs =await  SharedPreferences.getInstance() ;
    var pass=prefs.getString("pass");
    var email=prefs.getString("email");


    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ' + base64Encode(utf8.encode('${email}:${pass}')),
    };
    // print('Api hit');

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(data))
          .timeout(Duration(seconds: 10));
      // final response = await http.post(Uri.parse(url),headers:headers, body: jsonEncode(data) );

      responseJson = returnResponse(response);

      print(responseJson);
    } on SocketException {
      throw BadRequestException('No internet');

    }
    return responseJson;
  }

  Future<dynamic> postApi3(String url,) async {
    SharedPreferences prefs =await  SharedPreferences.getInstance() ;
    var pass=prefs.getString("pass");
    var email=prefs.getString("email");


    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ' + base64Encode(utf8.encode('${email}:${pass}')),
    };
    // print('Api hit');

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), headers: headers).timeout(Duration(seconds: 10));
      // final response = await http.post(Uri.parse(url),headers:headers, body: jsonEncode(data) );

      responseJson = returnResponse(response);

      print(responseJson);
    } on SocketException {
      throw BadRequestException('No internet');

    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        print(responseJson);
        return responseJson;

      case 400:
        dynamic badresponse = jsonDecode(response.body);

        dynamic badresponseextrac = badresponse['message'];
        throw BadRequestException(badresponseextrac.toString());
      case 404:
        dynamic badresponse = jsonDecode(response.body);

        dynamic badresponseextrac = badresponse['message'];
        throw BadRequestException("Network Error!");
    }
  }
}
