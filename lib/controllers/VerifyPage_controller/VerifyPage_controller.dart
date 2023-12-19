import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/repository/VerifyPass_Repository/VerifyPage_Repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/create_new_password.dart';

class VerifyPageViewModal extends GetxController {
  final otpController = TextEditingController().obs;
  final emailcontroller = TextEditingController().obs;
  final _api = VerifyPageRepository();
  RxBool resendVisible = false.obs;

  void VerifyHitApi() {
    Map data = {
      'email': emailcontroller.value.text,
      'otp': otpController.value.text,
    };

    resendVisible.value = true;

    _api.VerifyApi(data).then((value) {
      resendVisible.value = false;
      Utils.SnackBar('Otp ', value['message']);
      Get.to(() => CreatePassword());
    }).onError((error, stackTrace) {
      resendVisible.value = false;
      Utils.SnackBar('Error', error.toString());
    });
  }
}
