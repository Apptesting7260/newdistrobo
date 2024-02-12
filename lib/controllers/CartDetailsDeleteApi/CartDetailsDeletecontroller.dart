import 'dart:convert';

import 'package:get/get.dart';

import '../../Screen/MyCart.dart';
import '../../repository/ApiRepo.dart';
import '../../utils/StatusClass.dart';
import '../AddToCartController/AddToCartController.dart';
import '../GetAllCartConterller/GetAllCartController.dart';
import '../GetCartDetailsController/GetCartDetailsController.dart';
import '../ItemCountCartController/ItemCountCartController.dart';


class CartDeleteController extends GetxController {
  final _api = ApiRepo();
  GetAllCartController GetAllCartControllerin=GetAllCartController();
  late final rxRequestStatus = Status.COMPLETED.obs;
  ItemCountCartController ItemCountCartControllerin = ItemCountCartController();

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
      GetAllCartControllerin.GetAllCartModelApiHit();
      ItemCountCartControllerin.ItemCountCartApi();
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
