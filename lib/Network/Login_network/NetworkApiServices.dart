import 'dart:convert';
import 'dart:io';

import 'package:newdistrobo/Network/Login_network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:newdistrobo/Response/app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  Future<dynamic> postApi(String url, var data) async {
    print('Api hit');
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: data);

      responseJson = returnResponse(response);
      print(responseJson);
    } on SocketException {}
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw InvalidUrlException();
    }
  }
}
