



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:newdistrobo/controllers/profileController/ProfileDetailsController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';
import '../Shareprefene.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/appColor.dart';



class EmailUpdateController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final homepage = HomePageModel().obs;
  RxString error = ''.obs;
  final emailComtroller=TextEditingController().obs;
  final otpController=TextEditingController().obs;
  RxBool sendOtp=false.obs;
  RxBool OtpSendsucces=false.obs;

  ProfileDetailsController profileDetailsController =
  Get.put(ProfileDetailsController());
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(HomePageModel value) => homepage.value = value;
  void setError(String value) => error.value = value;


  // final countryController=TextEditingController().obs ;
  void setControllerData(){
    // HouseNumberController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1;
    emailComtroller.value.text=profileDetailsController.profiledetails.value.userDetails![0].userEmail;
    // streetController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1;
    // areaController.value.text=profileDetailsController.profiledetails.value.userDetails![0].userAddress!.address_1;


  }


  Future<void> EmailSendOtp(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'email':emailComtroller.value.text,
      'user_id':user
    };
    sendOtp.value=true;
    print(data);
    setRxRequestStatus(Status.LOADING);


    _api.EmailSendOtp(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      // setUserList(value);
      print(value);
      sendOtp.value=false;
      OtpSendsucces.value=true;

    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      showOptionsDialog(context,error.toString());
      sendOtp.value=false;

    });
  }
  Future<void> VerifyOtp(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sendOtp.value=true;
    var user=prefs.getString("userId");
    Map data = {
      'email':emailComtroller.value.text,
      'user_id':user,
      'otp':otpController.value.text
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.otpVerify(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      // setUserList(value);


      print(value);
      UpdateEmail( context);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      showOptionsDialog(context,error.toString());

    });
  }

  Future<void> UpdateEmail(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");

    Map data = {
      'email':emailComtroller.value.text,
      'user_id':user,

    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.emailUpdate(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      profileDetailsController.ProfilePageApi();
      sendOtp.value=false;
      print(value);
      SharedPreferences prefs =await  SharedPreferences.getInstance() ;
      prefs.remove("email");

      SharePrefence().setStringData("email",emailComtroller.value.text);

      Get.back();

    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      showOptionsDialog(context,error.toString());
      sendOtp.value=false;
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
