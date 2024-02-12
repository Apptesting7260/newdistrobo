// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:newdistrobo/repository/ResetPass_Repository/resetPass_Repository.dart';
// import 'package:newdistrobo/utils/utils.dart';
// import 'package:newdistrobo/view/LogigScreen.dart';
// import 'package:newdistrobo/view/VerifyPage.dart';
// import 'package:newdistrobo/view/create_new_password.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../Widgets/MyButton.dart';
// import '../../Widgets/appColor.dart';
// import '../../repository/ApiRepo.dart';
// import '../ResetPasswordController/ResetPassController.dart';
//
// class CheckDeleveryController extends GetxController {
//
//   RxBool resendVisible = false.obs;
//   final _api = ApiRepo();
//
//   Future<void> CheckDelevery(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var user=prefs.getString("userId");
//     Map data = {
//       'user_id':user,
//     };
//
//     resendVisible.value = true;
//
//     _api.CheckOrderDelevery(data).then((value) {
//       resendVisible.value = false;
//       // Utils.SnackBar('Create Password ', value['message']);
//
//
//       // Retrieve the value associated with the key "delivery"
//       String deliveryMessage = value['delivery'];
//       showOptionsDialog(context,deliveryMessage);
//       print("object");
//
//
//     }).onError((error, stackTrace) {
//       resendVisible.value = false;
//       showOptionsDialog(context,error.toString());
//       print(error.toString());
//       // Utils.SnackBar('Error', error.toString());
//     });
//   }
//
//   Future<void> showOptionsDialog(BuildContext context, String? error) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15) ,side: BorderSide.none ),
//           title: Center(
//             child: Column(
//               children: [
//
//
//                 Text(
//                   error.toString(),
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12,color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // GestureDetector(
//               //   child: const Icon(
//               //     Icons.camera_alt_outlined,
//               //     color: Colors.white,
//               //   ),
//               //   onTap: () {
//               //     _pickImage(ImageSource.camera);
//               //   },
//               // ),
//               Center(
//                 child: MyButton(
//                   bgColor: ColorConstants.appColor,
//                   width: Get.width*.27,
//                   height: Get.height*.05,
//                   title: "Ok", onTap: () {
//                   Get.back();
//                 },),
//               )
//             ],
//           ),
//         );
//       },
//     );}
// }
