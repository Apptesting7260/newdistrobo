import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

class Utils {
  static SnackBar(String title, String message) {
    Get.snackbar(title, message,backgroundColor: ColorConstants.appColor );
  }

}
