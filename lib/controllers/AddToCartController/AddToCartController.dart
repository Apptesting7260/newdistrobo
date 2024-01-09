



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:newdistrobo/Widgets/appColor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';
import '../CatagarryDetailsController/CategoryDetailsController.dart';
import '../homePageController/HomePageController.dart';

class AddToCartController extends GetxController {
  final _api = ApiRepo();
  HomePageController homeComtroller = Get.put(HomePageController());
  CatagoryDetailsController catagoryDetailsController = Get.put(
      CatagoryDetailsController());

  Future<void> HomeAddToCartApiHit(int category_index, int c_index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'quantity':'1',
      'id':CartproductId
    };
    print(data);
    _api.AddToCartApi(data).then((value) {
      var key=value['items'][0]['item_key'];

      print(key);
      homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].productCartKey="true";
      homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].productKey=key;
      homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].productlocalCartQuantity.value=1;

      homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].cartLoding.value=false;
      print(value);
      print("Succes");


    }).onError((error, stackTrace) {
      homeComtroller.homepage.value.data!.categoryDetails![category_index].catPosts![c_index].cartLoding.value=false;

      print(error.toString());
      Get.defaultDialog(
        title: '',
        middleText: error.toString(),
        textConfirm: 'OK',
        backgroundColor: Colors.white,
        buttonColor: ColorConstants.appColor,
        onConfirm: () {
          // Handle the OK button press
          Get.back(); // Close the dialog
        },
      );
    });
  }

  Future<void> SubCategoryAddToCartApiHit(int category_index, int c_index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'quantity':'1',
      'id':CartproductId
    };
    print(data);
    _api.AddToCartApi(data).then((value) {
      var key=value['items'][0]['item_key'];

      print(key);
      catagoryDetailsController
          .categeaoryData.value.data![category_index]
          .productData![c_index].productCartKey="true";
      catagoryDetailsController
          .categeaoryData.value.data![category_index]
          .productData![c_index].productKey=key;
      catagoryDetailsController
          .categeaoryData.value.data![category_index]
          .productData![c_index].productlocalCartQuantity.value=1;

      catagoryDetailsController
          .categeaoryData.value.data![category_index]
          .productData![c_index].cartLoding.value=false;
      print(value);
      print("Succes");


    }).onError((error, stackTrace) {
      catagoryDetailsController
          .categeaoryData.value.data![category_index]
          .productData![c_index].cartLoding.value=false;

      print(error.toString());
      Get.defaultDialog(
        title: '',
        middleText: error.toString(),
        textConfirm: 'OK',
        backgroundColor: Colors.white,
        buttonColor: ColorConstants.appColor,
        onConfirm: () {
          // Handle the OK button press
          Get.back(); // Close the dialog
        },
      );
    });
  }

  Future<void> LastestAddToCartApiHit(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'quantity':'1',
      'id':CartproductId
    };
    print(data);
    _api.AddToCartApi(data).then((value) {
      var key=value['items'][0]['item_key'];

      print(key);
      latestProduct[index].productCartKey="true";
      latestProduct[index].productKey=key;
      latestProduct[index].productlocalCartQuantity.value=1;

      latestProduct[index].cartLoding.value=false;
      print(value);
      print("Succes");


    }).onError((error, stackTrace) {
      latestProduct[index].cartLoding.value=false;

      print(error.toString());
      Get.defaultDialog(
        title: '',
        middleText: error.toString(),
        textConfirm: 'OK',
        backgroundColor: Colors.white,
        buttonColor: ColorConstants.appColor,
        onConfirm: () {
          // Handle the OK button press
          Get.back(); // Close the dialog
        },
      );
    });
  }

}
