
import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:newdistrobo/data/modals/CategeroryPageModel/CategoryPageModel.dart';
import 'package:newdistrobo/data/modals/ShopModel/ShopModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../data/modals/CategoryDetailsModel.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';

class CatagoryDetailsController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final categeaoryData = CategoryDetailasModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(CategoryDetailasModel value) => categeaoryData.value = value ;
  void setError(String value) => error.value = value;



  Future<void> CategoryPagedeatails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'category_id':categoryId,
      'user_id':user,


    };

    setRxRequestStatus(Status.LOADING);

    _api.CategoryDetailasApi(data).then((value) {
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
      'category_id':categoryId,
      'user_id':user,


    };

    setRxRequestStatus(Status.LOADING);


    _api.CategoryDetailasApi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());

    });
  }
}
