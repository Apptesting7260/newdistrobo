import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/appColor.dart';
import 'package:newdistrobo/repository/Login_Repository/login_repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/NvigationTabButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Shareprefene.dart';
import '../../Widgets/MyButton.dart';

class LoginViewModal extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final _api = LoginRepository();
  RxBool loading = false.obs;


  void loginHitApi(BuildContext context) {
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    loading.value = true;

    _api.loginApi(data).then((value) {
      print("done");
      loading.value = false;
      // Utils.SnackBar('LogIn', value['message']);
      SharePrefence().setStringData("token", value['Token_id']);
      var userId=value['user_data'];
      print("userid  ${userId['ID']}");
      SharePrefence().setStringData("userId", userId['ID'].toString());

      Get.offAll(Tab_view(
        index: 0,
      ));
    }).onError((error, stackTrace) {
      loading.value = false;
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
