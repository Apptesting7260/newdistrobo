



import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:newdistrobo/data/modals/ShopModel/ShopModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';



class ShopPageController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final shoppage = ShopModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(ShopModel value) => shoppage.value = value ;
  void setError(String value) => error.value = value;



  Future<void> shopPage() async {

    setRxRequestStatus(Status.LOADING);

    _api.shopApi().then((value) {
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
  Future<void> refreshApi() async {



    setRxRequestStatus(Status.LOADING);

    _api.shopApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());

    });
  }
}
