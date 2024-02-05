import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  Future<void> setControllerData(BuildContext context) async {

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));

    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));

      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));

    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      await placemarkFromCoordinates(
          position!.latitude, position!.longitude)
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        streetController.value.text=place.subLocality!;
        cityController.value.text=place.locality!;
        HouseNumberController.value.text=place.street!;
        areaController.value.text=place.thoroughfare!;
        postcodeController.value.text=place.postalCode!;
        stateController.value.text=place.administrativeArea!;
        countryController.value.text=place.country!;


      }).catchError((e) {
        debugPrint(e);
      });
    }).catchError((e) {
      debugPrint(e);
    });


    // HouseNumberController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1;


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
