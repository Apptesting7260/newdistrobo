



import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/modals/profilrModel/ProfileModel.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';
import '../data/modals/ShedulledDeleveryDateModel.dart';



class ShedeuledeleverydateController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final sheduleDelever  = ShedulDeleveryDateModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(ShedulDeleveryDateModel value) => sheduleDelever.value = value;
  void setError(String value) => error.value = value;
  List<String> Deleverydate=[''].obs;
  var timeItems = ['10 am - 2 pm', '11 am - 3 pm', '5 am - 3 pm'].obs;


  Future<void> ShedeuledeleverydatePageApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {

      'user_id':user
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.CheckOrderDelevery(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
      if(value.data!.length!=0) {
        for (int i = 0; i < value.data
        !.length; i++) {
          Deleverydate.add(value.data![i]);
        }
      }
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

    _api.CheckOrderDelevery(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      for(int i=0;i<value.data
      !.length; i++){
        Deleverydate.add(value.data![i]);
      }
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());

    });
  }
}
