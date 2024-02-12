import 'package:newdistrobo/Network/Login_network/NetworkApiServices.dart';
import 'package:newdistrobo/Response/app_url.dart';

class VerifyPageRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> VerifyApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.VerifyPageApi, data);
    print(response);
    return response;
  }
}
