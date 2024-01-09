import 'dart:convert';

import 'package:get/get.dart';

import '../../repository/ApiRepo.dart';
import '../../utils/StatusClass.dart';
import '../AddToCartController/AddToCartController.dart';


class CartQuantityUpdateController extends GetxController {
  final _api = ApiRepo();

  late final rxRequestStatus = Status.COMPLETED.obs;
  // final cartQuantityUpdateList = CartQuantityUpdateModel().obs;
  RxString error = ''.obs;
  final AddToCartController myCartController = Get.put(AddToCartController());
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  // void cartQuantityUpdateListF(CartQuantityUpdateModel _value) =>
  //     cartQuantityUpdateList.value = _value;
  void setError(String _value) => error.value = _value;
  RxBool addToCart=false.obs;


  cartQuantityUpdateApi(String id, quantity) {
    setRxRequestStatus(Status.LOADING);
    Map data = {"quantity": quantity};
    setRxRequestStatus(Status.LOADING);
    print(data);

    _api.cartQuantityUpdateApi(data,  id).then((value) {
      // Future.delayed(Duration(seconds: 2), () {
      //   setRxRequestStatus(Status.COMPLETED);
      // });
      addToCart.value=true;
      setRxRequestStatus(Status.COMPLETED);
      // cartQuantityUpdateListF(value);
      print('${addToCart.value}add to cartttttttttttttttttttt');
      print(value);
      // myCartController.myCartApi();
    }).onError((error, stackTrace) {
      setError(error.toString());
      print('errrrrrrrrrrrr');
      print(error);
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi(String id, quantity) {

    setRxRequestStatus(Status.LOADING);
    Map data = {"quantity": quantity};
    _api.cartQuantityUpdateApi(data,  id).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      // cartQuantityUpdateListF(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
