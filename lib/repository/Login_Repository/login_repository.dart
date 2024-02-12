import 'package:newdistrobo/Network/Login_network/NetworkApiServices.dart';
import 'package:newdistrobo/Response/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.loginApi, data);
    print(response);
    return response;
  }
}
