import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:newdistrobo/repository/Signup_repository/Signup_repository.dart';
import 'package:newdistrobo/repository/VerifyEmail/EmailVerify.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/NvigationTabButton.dart';

import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../Shareprefene.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/appColor.dart';

class EmailVerifycontroller extends GetxController {

  final _api = EmailVerifyRepository();

  RxBool loading = false.obs;
RxString emailtoverify="".obs;
RxString otpvalue="".obs;
 final emailComtroller=TextEditingController().obs;
  void EmailVerifyhitApi(BuildContext context) {
    Map data = {
   
      'email': emailtoverify.value,
  
    };
    print(data);

    loading.value = true;

    _api.EmailVerifyAPIhit(data).then((value) {
      print("done");
      loading.value = false;
     otpvalue.value=value['otp'].toString();
     print( "${otpvalue.value}=========================otp");
      
    }).onError((error, stackTrace) {
      loading.value = false;
      print("some thing went worng");
      // showOptionsDialog(context,error.toString());
      // Utils.SnackBar('Error', error.toString());
    });
  }
  
 
  
}
