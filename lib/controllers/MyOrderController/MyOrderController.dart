



import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/modals/MyOrderModel.dart';
import '../../data/modals/profilrModel/ProfileModel.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';



class MyOrderController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final sheduleDelever  = MyOrderModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(MyOrderModel value) => sheduleDelever.value = value;
  void setError(String value) => error.value = value;
  List<String> Deleverydate=[''].obs;



  Future<void> MyOrderAPi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {

      'user_id':user
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.MyOrderApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);


      // else{
      //   Deleverydate.add("Delivery is not available your Area");
      // }

    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
    });
  }
//
  Future<void> refreshApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'method':'user_profile',
      'user_id':user
    };
    print(data);

    setRxRequestStatus(Status.LOADING);

    _api.MyOrderApi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());

    });
  }
}
