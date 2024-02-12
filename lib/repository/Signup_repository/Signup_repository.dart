import 'package:newdistrobo/Network/Login_network/NetworkApiServices.dart';
import 'package:newdistrobo/Response/app_url.dart';

class SignUpRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> SignUpApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.SignupApi, data);
    print(response);
    return response;
  }
}
