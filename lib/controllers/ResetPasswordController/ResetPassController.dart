import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/repository/ResetPass_Repository/resetPass_Repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/VerifyPage.dart';
import 'package:newdistrobo/view/create_new_password.dart';

class ResetPasswordViewModal extends GetxController {
  final emailcontroller = TextEditingController().obs;
  RxBool resendVisible = false.obs;
  final _api = ResetPassRepository();

  void ResetPassHitApi() {
    Map data = {
      'email': emailcontroller.value.text,
    };

    resendVisible.value = true;

    _api.ResetApi(data).then((value) {
      resendVisible.value = false;
      Utils.SnackBar('Otp ', value['message']);
      Get.off(OtpVerification());
    }).onError((error, stackTrace) {
      resendVisible.value = false;
      Utils.SnackBar('Error', error.toString());
    });
  }
}
