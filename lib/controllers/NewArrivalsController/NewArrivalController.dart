



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/HomePageModel/HomePageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../GlobaleVarribale/Globalevarribale.dart';
import '../../data/modals/NewArrivalsModel/NewArrivallsModel.dart';
import '../../data/modals/ProductCategaoryDetails/ProductCategoryModel.dart';
import '../../repository/ApiRepo.dart';
import '../../repository/Signup_repository/Signup_repository.dart';
import '../../utils/StatusClass.dart';



class NewArrivalController extends GetxController {
  String? status;
  final _api = ApiRepo();
  //int? seekerRequestlenght;



  final rxRequestStatus = Status.COMPLETED.obs;
  final categoryDetails = NewArivallProductModel().obs;
  RxString error = ''.obs;
  RxBool isLoading=false.obs;
  RxString page_no = '1'.obs;
  // RxInt newcurrentPage=0.obs;


  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(NewArivallProductModel value) => categoryDetails.value = value;
  void setError(String value) => error.value = value;



  Future<void> NewArrivalPageApi(bool pagination) async {
    if(pagination == false){

      ProductCategoryLists.clear();
    }
    print("api calll ===============================================");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      // 'category_id':categoryId,
      'user_id':user,
      'page' : page_no.value,
      'per_page':"10"

    };
    if(pagination == false){
      isLoading.value = true;
      // setRxRequestStatus(Status.LOADING);
    }
    print(data);
    if(newcurrentPage.value==0){
      setRxRequestStatus(Status.LOADING);
    }
    else{
      isLoading.value = true;
    }

    _api.NewArrivalDetails(data).then((value) {


      if(newcurrentPage.value==0){
        setRxRequestStatus(Status.COMPLETED);
      }
      else{
        isLoading.value = false;
      }
      newcurrentPage.value=value.currentPage;

      if(value == "failed"){
        noDataArival.value = true;
        print(callArrivalPagination.value);
        callArrivalPagination.value = false;

        print(callArrivalPagination.value);
      }
      setUserList(value);
      print(value);
      isLoading.value = false;



    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      setRxRequestStatus(Status.COMPLETED);

    });
  }

  Future<void> refreshApi(bool pagination) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user=prefs.getString("userId");
    Map data = {
      'category_id':categoryId.toString(),
      'user_id':user,
      'page' : page_no.value,
      'per_page':"10"

    };
    if(newcurrentPage.value==0){
      setRxRequestStatus(Status.LOADING);
    }
    else{
      isLoading.value = true;
    }


    _api.NewArrivalDetails(data).then((value){

      setUserList(value);
      // isLoading.value = false;

      if(newcurrentPage.value==0){
        setRxRequestStatus(Status.COMPLETED);
      }
      else{
        isLoading.value = false;
      }
      newcurrentPage.value=value.currentPage;

    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // isLoading.value = false;
      isLoading.value = false;
      setRxRequestStatus(Status.COMPLETED);

    });
  }
}
