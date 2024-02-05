



import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';
import '../CatagarryDetailsController/CategoryDetailsController.dart';
import '../CategoryPageController/CategoryPageController.dart';
import '../SingleProductControlller/SingleProductController.dart';
import '../SubCategortController/SubCategoryControoler.dart';
import '../homePageController/HomePageController.dart';
import 'ViewWhishLishController.dart';



class WhishlistAddController extends GetxController {
  final _api = ApiRepo();
  //int? seekerRequestlenght;
  GetSingleProductController getSingleProductController =
  Get.put(GetSingleProductController());
  final rxRequestStatus = Status.LOADING.obs;
  final homepage = HomePageModel().obs;
  RxString error = ''.obs;
  HomePageController homeComtroller = Get.put(HomePageController());
  CatagoryDetailsController catagoryDetailsController = Get.put(
      CatagoryDetailsController());
  SubCategoryPageController subCategoryPageController=Get.put(SubCategoryPageController());
  SubCategoryCotroller ProsubCategoryCotroller = Get.put(SubCategoryCotroller());

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(HomePageModel value) => homepage.value = value;
  void setError(String value) => error.value = value;



  Future<void> WhishLisAddPageApi(name, product,  categoryDetails,) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'product_id':productId,
      'user_id':user
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.addWishlist(data).then((value) {

      setRxRequestStatus(Status.COMPLETED);
     if(name==homeComtroller.homepage.value.data!.categoryDetails![categoryDetails].name){
       homeComtroller.homepage.value.data!.categoryDetails![categoryDetails].catPosts![product].productWishlist=homeComtroller.homepage.value.data!.categoryDetails![categoryDetails].catPosts![product].productWishlist==false?true:false;
       homeComtroller.homepage.value.data!.categoryDetails![categoryDetails].catPosts![product].isLoding.value=false;
     }

      print(value);


    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      homeComtroller.homepage.value.data!.categoryDetails![categoryDetails].catPosts![product].isLoding.value=false;

    });
  }

  Future<void> CategoryWhishLisAddPageApi( product,  categoryDetails,) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'product_id':productId,
      'user_id':user
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.addWishlist(data).then((value) {

      setRxRequestStatus(Status.COMPLETED);

      catagoryDetailsController.categeaoryData.value.data![categoryDetails].productData![product].productWishlist=catagoryDetailsController.categeaoryData.value.data![categoryDetails].productData![product].productWishlist==false?true:false;
      catagoryDetailsController.categeaoryData.value.data![categoryDetails].productData![product].isLoding.value=false;

      print(value);


    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      catagoryDetailsController.categeaoryData.value.data![categoryDetails].productData![product].isLoding.value=false;

    });
  }
  Future<void> SubCategoryWhishLisAddPageApi( categoryDetails,) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'product_id':productId,
      'user_id':user
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.addWishlist(data).then((value) {

      setRxRequestStatus(Status.COMPLETED);

      ProductCategoryLists![categoryDetails].productWishlist=ProductCategoryLists![categoryDetails].productWishlist==false?true:false;
      ProductCategoryLists![categoryDetails].isLoding.value=false;

      print(value);


    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      ProductCategoryLists![categoryDetails].isLoding.value=false;
    });
  }
  Future<void> ProSubCategoryWhishLisAddPageApi(product, index,) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'product_id':productId,
      'user_id':user
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.addWishlist(data).then((value) {

      setRxRequestStatus(Status.COMPLETED);
      print(ProsubCategoryCotroller.subCategoryPage.value.data![index].catPosts![product].productWishlist);
      ProsubCategoryCotroller.subCategoryPage.value.data![index].catPosts![product].productWishlist=ProsubCategoryCotroller.subCategoryPage.value.data![index].catPosts![product].productWishlist=="false"?"true":"false";
      ProsubCategoryCotroller.subCategoryPage.value.data![index].catPosts![product].isLoding.value=false;
   print(ProsubCategoryCotroller.subCategoryPage.value.data![index].catPosts![product].productWishlist);
      print(value);


    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      ProsubCategoryCotroller.subCategoryPage.value.data![index].catPosts![product].isLoding.value=false;
    });
  }
  Future<void> latestProductWhishLisAddPageApi( categoryDetails,) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'product_id':productId,
      'user_id':user
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.addWishlist(data).then((value) {

      setRxRequestStatus(Status.COMPLETED);

      latestProduct![categoryDetails].productWishlist=latestProduct![categoryDetails].productWishlist==false?true:false;
      latestProduct![categoryDetails].isLoding.value=false;

      print(value);


    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      latestProduct![categoryDetails].isLoding.value=false;
    });
  }
  Future<void> SingleWhishLisAddPageApi( ) async {
    ViewWhishListcontroller viewWhishListcontroller =
    Get.put(ViewWhishListcontroller());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'product_id':productId,
      'user_id':user
    };
    print(data);
    setRxRequestStatus(Status.LOADING);

    _api.addWishlist(data).then((value) {

      setRxRequestStatus(Status.COMPLETED);

      getSingleProductController.getSinglePageData.value
          .singleProduct!.productWishlist= getSingleProductController.getSinglePageData.value
          .singleProduct!.productWishlist==false?true:false;
      getSingleProductController.getSinglePageData.value
          .singleProduct!.isLoding.value=false;
            viewWhishListcontroller.ViewWhislistApiHit();

      print(value);


    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      getSingleProductController.getSinglePageData.value
          .singleProduct!.isLoding.value=false;
    });
  }
}
