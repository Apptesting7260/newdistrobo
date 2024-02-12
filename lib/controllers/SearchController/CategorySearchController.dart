



import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/modals/GetShippingAdressModel.dart';
import '../../data/modals/SearchModel/CategorySearchmodel.dart';
import '../../data/modals/SearchModel/ProductSearchModel.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';



class CategorySearchController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final ProductSearch = CategorySearchModel().obs;
  RxString error = ''.obs;
  final searchController=TextEditingController().obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(CategorySearchModel value) => ProductSearch.value = value;
  void setError(String value) => error.value = value;



  Future<void> CategorySearchApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      "search_parametters":searchController.value.text,
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.CategorySearchApi(data).then((value) {
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
