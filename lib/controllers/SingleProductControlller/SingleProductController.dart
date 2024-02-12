



import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../data/modals/GetCartDetailsModel/GetDetailsModel.dart';
import '../../data/modals/SinglePageModel/SinglePageModel.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';



class GetSingleProductController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;
  final getSinglePageData = SingleProductPageModel().obs;
  final rxRequestStatus = Status.LOADING.obs;
  var checkindex = 0.obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(SingleProductPageModel value) => getSinglePageData.value = value;
  void setError(String value) => error.value = value;
  String? categoriesText ;


  Future<void> GetSingleProductApiHit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'user_id':user,
      'product_id':productId,
      'method':'single_product'
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.SingleProductApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
      print("Succes");
     value.singleProduct!
          .productCategories!.forEach((element) {
       categoriesText =element.category;

     });


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
  Future<void> refreshApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'user_id':user,
      'product_id':productId,
      'method':'single_product'
    };

    setRxRequestStatus(Status.LOADING);

    _api.SingleProductApi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      value.singleProduct!
          .productCategories!.forEach((element) {

            var data =element.category;
        categoriesText =data;

      });
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}
