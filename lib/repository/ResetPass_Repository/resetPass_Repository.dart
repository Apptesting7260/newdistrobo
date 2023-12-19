import 'package:newdistrobo/Network/Login_network/NetworkApiServices.dart';
import 'package:newdistrobo/Response/app_url.dart';

class ResetPassRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> ResetApi(var data) async {
    // print("apihit");
    dynamic response = _apiService.postApi(AppUrl.ResetPassApi, data);
    print(response);
    return response;
  }
}
