import 'package:newdistrobo/Network/Login_network/NetworkApiServices.dart';
import 'package:newdistrobo/Response/app_url.dart';

class EmailVerifyRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> EmailVerifyAPIhit(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.EmailVerifyApi, data);
    print(response);
    return response;
  }
}
