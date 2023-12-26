



import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../data/modals/SubCategoryModel/SubcategoryModel.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';



class SubCategoryCotroller extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final subCategoryPage = SubCategoryModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(SubCategoryModel value) => subCategoryPage.value = value;
  void setError(String value) => error.value = value;



  Future<void> ShopPageApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'category_id':categoryId,
      'user_id':user,


    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.SubcategoryPageApi(data).then((value) {
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

Future<void> refreshApi() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user=prefs.getString("userId");
  Map data = {
    'category_id':categoryId,
    'user_id':user,


  };
    setRxRequestStatus(Status.LOADING);

  _api.SubcategoryPageApi(data).then((value){
    setRxRequestStatus(Status.COMPLETED);
    setUserList(value);
  }).onError((error, stackTrace){
    setError(error.toString());
    setRxRequestStatus(Status.ERROR);

  });
}
}
