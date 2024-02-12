



import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../data/modals/GetCartDetailsModel/GetDetailsModel.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';



class GetCartDetailsController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;
  final getCartDetails = GerCartDetailsModel().obs;
  final rxRequestStatus = Status.LOADING.obs;
  var checkindex = 0.obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(GerCartDetailsModel value) => getCartDetails.value = value;
  void setError(String value) => error.value = value;



  Future<void> GetCartDatailsApiHit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'quantity':'1',
      'id':CartproductId
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.GetCartDatailsApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
      print("Succes");

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
void refreshApi(){

    setRxRequestStatus(Status.LOADING);

  _api.GetCartDatailsApi().then((value){
    setRxRequestStatus(Status.COMPLETED);
    setUserList(value);
  }).onError((error, stackTrace){
    setError(error.toString());
    setRxRequestStatus(Status.ERROR);

  });
}
}
