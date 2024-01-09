import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/repository/VerifyPass_Repository/VerifyPage_Repository.dart';
import 'package:newdistrobo/utils/utils.dart';
import 'package:newdistrobo/view/create_new_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/appColor.dart';
import '../../repository/ApiRepo.dart';
import '../ResetPasswordController/ResetPassController.dart';
import '../profileController/ProfileDetailsController.dart';

class ImageUpdateController extends GetxController {



  ProfileDetailsController profileDetailsController =
  Get.put(ProfileDetailsController());
  final _api = ApiRepo();
  RxBool resendVisible = false.obs;


  // final countryController=TextEditingController().obs ;


  Future<void>ImageUpdate (BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map <dynamic, dynamic> data= {
      'user_id':user,

    } ;

    print("otp page  $data");

    resendVisible.value = true;


    try {
      // Create a multipart request
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://distrobo.com/wp-json/custom/v1/profile_upload-api',));
      var fileStream = http.ByteStream(ImagetoUpload!.openRead());
      var length = await ImagetoUpload!.length();
      // Attach the file to the request
      var multipartFile = http.MultipartFile('profile_img', fileStream, length,
          filename: ImagetoUpload!.path.split('/').last);
      request.files.add(multipartFile);
      request.fields['user_id']=user!;


      // Send the request
      var response = await request.send();

      // Check the response status
      if (response.statusCode == 200) {
        // The image was successfully uploaded
        print('Profile picture uploaded successfully');
        print(await response.stream.bytesToString());

        profileDetailsController.ProfilePageApi();


      } else {
        // Handle the error
        print('Failed to upload profile picture. Status code: ${response.statusCode}');
        print(await response.stream.bytesToString());
      }
    } catch (error) {
      print('Error uploading profile picture: $error');
      profileDetailsController.ProfilePageApi();


      resendVisible.value = false;
      // Utils.SnackBar('Error', error.toString());
      showOptionsDialog(context, error.toString());
    }
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
