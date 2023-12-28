



import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/modals/profilrModel/ProfileModel.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';



class ProfileDetailsController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final profiledetails  = ProfileModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(ProfileModel value) => profiledetails.value = value;
  void setError(String value) => error.value = value;



  Future<void> ProfilePageApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'method':'user_profile',
      'user_id':user
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.ProfileDetailasApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);


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
      'email':user
    };
    print(data);

    setRxRequestStatus(Status.LOADING);

    _api.ProfileDetailasApi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());

    });
  }
}
