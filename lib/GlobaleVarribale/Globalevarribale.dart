import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:newdistrobo/data/modals/ProductCategaoryDetails/ProductCategoryModel.dart';


String? selectGender;
String? productId;
String? categoryId;
String? categoryName;
RxBool callHomePagination = true.obs;
RxList<ProductSubCategory> ProductCategoryLists = <ProductSubCategory>[].obs;
RxInt page = 1.obs;
RxBool noDataHome = false.obs;
RxInt currentPage=0.obs;

