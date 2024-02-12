import 'dart:convert';

import 'package:get/get.dart';
import 'package:newdistrobo/controllers/GetAllCartConterller/GetAllCartController.dart';
import 'package:newdistrobo/data/modals/DeleteCartModel/DeleteCartModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/ApiRepo.dart';
import '../../utils/StatusClass.dart';
import '../AddToCartController/AddToCartController.dart';
import '../GetCartDetailsController/GetCartDetailsController.dart';


class CartDeleteIteamController extends GetxController {
  final _api = ApiRepo();
  GetCartDetailsController getCartDetailsController =
  Get.put(GetCartDetailsController());
    GetAllCartController GetAllCartControllerin=GetAllCartController();
  late final rxRequestStatus = Status.COMPLETED.obs;
  final cartQuantityUpdateList = DeleteCartModel().obs;
 
  RxString cartitem="".obs;
  RxString error = ''.obs;
  // final DeleteCartModel myCartController = Get.put(DeleteCartModel());
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void cartQuantityUpdateListF(DeleteCartModel _value) =>
      cartQuantityUpdateList.value = _value;
  void setError(String _value) => error.value = _value;
  RxBool addToCart=false.obs;


  cartDeleteitemApi()async {
    setRxRequestStatus(Status.LOADING);

    setRxRequestStatus(Status.LOADING);
SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
Map data={
"user_id":user,
"cart_item":cartitem.value.toString()
};

print(data);
    _api.CartDeleteItem(data).then((value) {

      addToCart.value=true;
      setRxRequestStatus(Status.COMPLETED);
      cartQuantityUpdateListF(value);

      print(value);
       GetAllCartControllerin.GetAllCartModelApiHit();
       Get.back();
 
      // myCartController.myCartApi();
    }).onError((error, stackTrace) {
      setError(error.toString());
      print('errrrrrrrrrrrr');
      print(error);
      setRxRequestStatus(Status.ERROR);
      Get.back();
    });
  }


}
