import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/repository/ResetPass_Repository/resetPass_Repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/VerifyPage.dart';
import 'package:newdistrobo/view/create_new_password.dart';

import '../../Widgets/MyButton.dart';
import '../../Widgets/appColor.dart';

class ResetPasswordViewModal extends GetxController {
  final emailcontroller = TextEditingController().obs;
  RxBool resendVisible = false.obs;
  final _api = ResetPassRepository();

  void ResetPassHitApi(BuildContext context, email) {
    Map data = {
      'email': emailcontroller.value.text==""?email:emailcontroller.value.text,
    };

    resendVisible.value = true;

    _api.SendOtp(data).then((value) {
      resendVisible.value = false;
      Utils.SnackBar('Otp ', "Otp Sent");
      print( emailcontroller.value.text);
      Get.off(OtpVerification(email:emailcontroller.value.text));
    }).onError((error, stackTrace) {
      resendVisible.value = false;
      // Utils.SnackBar('Error', error.toString());
      showOptionsDialog(context,error.toString());
    });
  }
  Future<void> showOptionsDialog(BuildContext context, String? error) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15) ,side: BorderSide.none ),
          title: Center(
            child: Column(
              children: [


                Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12,color: Colors.black),
                ),
              ],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GestureDetector(
              //   child: const Icon(
              //     Icons.camera_alt_outlined,
              //     color: Colors.white,
              //   ),
              //   onTap: () {
              //     _pickImage(ImageSource.camera);
              //   },
              // ),
              Center(
                child: MyButton(
                  bgColor: ColorConstants.appColor,
                  width: Get.width*.27,
                  height: Get.height*.05,
                  title: "Ok", onTap: () {
                  Get.back();
                },),
              )
            ],
          ),
        );
      },
    );}
}
