import 'dart:convert';

import 'package:get/get.dart';

import '../../repository/ApiRepo.dart';
import '../../utils/StatusClass.dart';
import '../AddToCartController/AddToCartController.dart';
import '../GetCartDetailsController/GetCartDetailsController.dart';


class CartDeleteController extends GetxController {
  final _api = ApiRepo();
  GetCartDetailsController getCartDetailsController =
  Get.put(GetCartDetailsController());
  late final rxRequestStatus = Status.COMPLETED.obs;
  // final cartQuantityUpdateList = CartQuantityUpdateModel().obs;
  RxString error = ''.obs;
  final AddToCartController myCartController = Get.put(AddToCartController());
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  // void cartQuantityUpdateListF(CartQuantityUpdateModel _value) =>
  //     cartQuantityUpdateList.value = _value;
  void setError(String _value) => error.value = _value;
  RxBool addToCart=false.obs;


  cartDeleteApi() {
    setRxRequestStatus(Status.LOADING);

    setRxRequestStatus(Status.LOADING);




    _api.CartDetailsDelete().then((value) {

      addToCart.value=true;
      setRxRequestStatus(Status.COMPLETED);
      // cartQuantityUpdateListF(value);

      print(value);
      getCartDetailsController.GetCartDatailsApiHit();
      Get.back();
      // myCartController.myCartApi();
    }).onError((error, stackTrace) {
      setError(error.toString());
      print('errrrrrrrrrrrr');
      print(error);
      setRxRequestStatus(Status.ERROR);
    });
  }


}
