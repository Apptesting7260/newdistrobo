



import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/modals/GetShippingAdressModel.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';



class GetShippingAdressController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final shipingAdress = GetShippingafressModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(GetShippingafressModel value) => shipingAdress.value = value;
  void setError(String value) => error.value = value;



  Future<void> ShippingAdressApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {

      'user_id':user
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.ShippingAdressApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);

      // if (value.data!.length > 2) {
      //   seekerRequestlenght = 2;
      // } else {
      //   seekerRequestlenght = 1;
      // }
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
    });
  }
//
//   Future<void> refreshApi() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var user=prefs.getString("userId");
//     Map data = {
//       'method':'home_api',
//       'user_id':user
//     };
//     print(data);
//
//     setRxRequestStatus(Status.LOADING);
//
//     _api.homePageApi(data).then((value){
//       setRxRequestStatus(Status.COMPLETED);
//       setUserList(value);
//     }).onError((error, stackTrace){
//       setError(error.toString());
//       setRxRequestStatus(Status.ERROR);
//       print(error.toString());
//
//     });
//   }
}
