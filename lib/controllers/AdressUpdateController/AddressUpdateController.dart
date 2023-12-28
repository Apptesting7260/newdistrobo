import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/repository/VerifyPass_Repository/VerifyPage_Repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/create_new_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/MyButton.dart';
import '../../Widgets/appColor.dart';
import '../../repository/ApiRepo.dart';
import '../ResetPasswordController/ResetPassController.dart';
import '../profileController/ProfileDetailsController.dart';

class AdressUpdateController extends GetxController {

  ProfileDetailsController profileDetailsController =
  Get.put(ProfileDetailsController());

  final _api = ApiRepo();
  RxBool resendVisible = false.obs;

  final HouseNumberController=TextEditingController().obs ;
  final cityController=TextEditingController().obs ;
  final streetController=TextEditingController().obs ;
  final areaController=TextEditingController().obs ;
  final countryController=TextEditingController().obs ;
  final postcodeController=TextEditingController().obs ;
  final stateController=TextEditingController().obs ;
  // final countryController=TextEditingController().obs ;
  void setControllerData(){
    // HouseNumberController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1;
    cityController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.city;
    // streetController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1;
    // areaController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1;
    postcodeController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.postcode;
    stateController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.state;
    countryController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.country;

  }

  Future<void> AdresssUpdateHitApi(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'user_id':user,
  'house_number':HouseNumberController.value.text,
  'street':streetController.value.text,
  'area':areaController.value.text,
  'country':countryController.value.text,
  'postcode':postcodeController.value.text,
  'state':stateController.value.text,
  'city':cityController.value.text,

    } ;

    print("otp page");

    resendVisible.value = true;

    _api.AdressUpdateApi(data).then((value) {
      resendVisible.value = false;
      profileDetailsController.ProfilePageApi();
      // Utils.SnackBar('Otp ', value['message']);
      // Get.to(() => CreatePassword(email:email));
      Get.back();
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
