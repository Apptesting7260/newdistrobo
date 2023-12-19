import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/repository/Signup_repository/Signup_repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/NvigationTabButton.dart';

class SignUpViewModal extends GetxController {
  final namecontroller = TextEditingController().obs;
  final lastnamecontroller = TextEditingController().obs;
  final emailcontroller = TextEditingController().obs;
  final phonecontroller = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmpasswordController = TextEditingController().obs;
  final _api = SignUpRepository();

  RxBool loading = false.obs;

  void SignupHitApi() {
    Map data = {
      'firstname': namecontroller.value.text,
      'lastname': lastnamecontroller.value.text,
      'email': emailcontroller.value.text,
      'password': passwordController.value.text,
      'confirmpassword': confirmpasswordController.value.text,
      'phone': phonecontroller.value.text,
    };

    loading.value = true;

    _api.SignUpApi(data).then((value) {
      print("done");
      loading.value = false;
      Utils.SnackBar('SignUP', value['message']);
      Get.off(Tab_view(
        index: 0,
      ));
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.SnackBar('Error', error.toString());
    });
  }
}
