



import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:newdistrobo/data/modals/ItemCountCartModel/ItemCountCartModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';



class ItemCountCartController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final itemCountCartModel = ItemCountCartModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setItemCount(ItemCountCartModel value) => itemCountCartModel.value = value;
  void setError(String value) => error.value = value;



  Future<void> ItemCountCartApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {

      'user_id':user
    };
  print(data);
    setRxRequestStatus(Status.LOADING);

    _api.ItemCountApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setItemCount(value);
      print("${value}===============================");

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
// //
// Future<void> refreshApi() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var user=prefs.getString("userId");
//   Map data = {
//     'method':'home_api',
//     'user_id':user
//   };
//   print(data);

//     setRxRequestStatus(Status.LOADING);

//   _api.homePageApi(data).then((value){
//     setRxRequestStatus(Status.COMPLETED);
//     setUserList(value);
//   }).onError((error, stackTrace){
//     setError(error.toString());
//     setRxRequestStatus(Status.ERROR);
//     print(error.toString());

//   });
// }
}
