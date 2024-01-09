import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:newdistrobo/data/modals/ProductCategaoryDetails/ProductCategoryModel.dart';

import '../data/modals/NewArrivalsModel/NewArrivallsModel.dart';


String? selectGender;
String? productId;
String? CartproductId;
String? categoryId;
String? categoryName;
RxBool callHomePagination = true.obs;
RxList<ProductSubCategory> ProductCategoryLists = <ProductSubCategory>[].obs;
RxInt page = 1.obs;
RxBool noDataHome = false.obs;
RxInt currentPage=0.obs;

RxList<LatestProducts> latestProduct = <LatestProducts>[].obs;
RxInt new_arri_page = 1.obs;
RxBool noDataArival = false.obs;
RxInt new_currentPage=0.obs;
RxBool callArrivalPagination = true.obs;
RxInt newcurrentPage=0.obs;

File? ImagetoUpload;
File ?imgFile;
String? currentAddress;



