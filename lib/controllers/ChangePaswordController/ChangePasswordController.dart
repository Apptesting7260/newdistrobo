import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/repository/VerifyPass_Repository/VerifyPage_Repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/create_new_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Shareprefene.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/appColor.dart';
import '../../repository/ApiRepo.dart';
import '../ResetPasswordController/ResetPassController.dart';
import '../profileController/ProfileDetailsController.dart';

class PassUpdateController extends GetxController {

  ProfileDetailsController profileDetailsController =
  Get.put(ProfileDetailsController());

  final _api = ApiRepo();
  RxBool resendVisible = false.obs;


  final current_password=TextEditingController().obs ;
  final new_password=TextEditingController().obs ;
  final confirm_password=TextEditingController().obs ;



  Future<void> PassUpdate (BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'user_id':user,
      'current_password':current_password.value.text,
      'new_password':new_password.value.text,
      'confirm_password':confirm_password.value.text,


    } ;

    print("otp page");

    resendVisible.value = true;

    _api.PassUpdateApi(data).then((value) async {
      resendVisible.value = false;
      SharedPreferences prefs =await  SharedPreferences.getInstance() ;
      prefs.remove("pass");
      SharePrefence().setStringData("pass",new_password.value.text);
      profileDetailsController.ProfilePageApi();

      // Utils.SnackBar('Otp ', value['message']);
      // Get.to(() => CreatePassword(email:email));
      Get.back();
      confirm_password.value.clear();
      new_password.value.clear();
      current_password.value.clear();
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
