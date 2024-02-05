import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/repository/Signup_repository/Signup_repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/NvigationTabButton.dart';

import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../Shareprefene.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/appColor.dart';

class SignUpViewModal extends GetxController {
  final namecontroller = TextEditingController().obs;
  final lastnamecontroller = TextEditingController().obs;
  final emailcontroller = TextEditingController().obs;
  final phonecontroller = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmpasswordController = TextEditingController().obs;
  final _api = SignUpRepository();

  RxBool loading = false.obs;

  void SignupHitApi(BuildContext context) {
    Map data = {
      'firstname': namecontroller.value.text,
      'lastname': lastnamecontroller.value.text,
      'email': emailcontroller.value.text,
      'password': passwordController.value.text,
      'confirmpassword': confirmpasswordController.value.text,
      'phone': phonecontroller.value.text,
      'business_type': selectGender,
    };

    loading.value = true;

    _api.SignUpApi(data).then((value) {
      print("done");
      loading.value = false;
      // Utils.SnackBar('SignUP', value['message']);
      SharePrefence().setStringData("token", value['token']);
      var userId=value['user_data'];
      print("userid  ${value['user_id']}");
      SharePrefence().setStringData("userId",value['user_id'].toString());
      SharePrefence().setStringData("email",emailcontroller.value.text);
      SharePrefence().setStringData("pass",passwordController.value.text);

      emailcontroller.value.clear();
      namecontroller.value.clear();
      lastnamecontroller.value.clear();
      confirmpasswordController.value.clear();
      passwordController.value.clear();
      phonecontroller.value.clear();
      Get.offAll(Tab_view(
        index: 0,
      ));
    }).onError((error, stackTrace) {
      loading.value = false;
      showOptionsDialog(context,error.toString());
      // Utils.SnackBar('Error', error.toString());
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
