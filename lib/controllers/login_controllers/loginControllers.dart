import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/repository/Login_Repository/login_repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/NvigationTabButton.dart';

class LoginViewModal extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final _api = LoginRepository();
  RxBool loading = false.obs;

  void loginHitApi() {
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    loading.value = true;

    _api.loginApi(data).then((value) {
      print("done");
      loading.value = false;
      Utils.SnackBar('LogIn', value['message']);
      Get.off(Tab_view(
        index: 0,
      ));
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.SnackBar('Error', error.toString());
    });
  }
}
