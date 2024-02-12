import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/repository/ResetPass_Repository/resetPass_Repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/LogigScreen.dart';
import 'package:newdistrobo/view/VerifyPage.dart';
import 'package:newdistrobo/view/create_new_password.dart';

import '../ResetPasswordController/ResetPassController.dart';

class CreatePasswordController extends GetxController {
  final passWord = TextEditingController().obs;
  final con_passWord = TextEditingController().obs;
  final ResetPassVM = Get.put(ResetPasswordViewModal());
  RxBool resendVisible = false.obs;
  final _api = ResetPassRepository();

  void CreatePassHitApi(String email) {
    Map data = {
      'email':email,
      'password':passWord.value.text,
      'confirm_password':con_passWord.value.text,
    };

    resendVisible.value = true;

    _api.ResetApi(data).then((value) {
      resendVisible.value = false;
      // Utils.SnackBar('Create Password ', value['message']);

      Get.to(LoginScreen());
    }).onError((error, stackTrace) {
      resendVisible.value = false;
      // Utils.SnackBar('Error', error.toString());
    });
  }
}
