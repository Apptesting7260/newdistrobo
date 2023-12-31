import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Screen/HomePage.dart';
import '../Screen/MyCart.dart';
import '../Screen/MyFaveroutList.dart';
import '../Screen/MyProfile.dart';
import '../Screen/ShopPage.dart';
import '../Widgets/botton_navigation.dart';
import '../controllers/AddToCartController/AddToCartController.dart';
import '../controllers/GetCartDetailsController/GetCartDetailsController.dart';
import '../controllers/ShopController/ShopController.dart';
import '../controllers/homePageController/HomePageController.dart';
import '../controllers/profileController/ProfileDetailsController.dart';

class Tab_view extends StatefulWidget {
  const Tab_view({Key? key, required this.index}) : super(key: key);
  final int index;


  @override
  _Tab_viewState createState() => _Tab_viewState();
}

class _Tab_viewState extends State<Tab_view> {
  ProfileDetailsController profileDetailsController =
  Get.put(ProfileDetailsController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  HomePageController homeComtroller = Get.put(HomePageController());
  GetCartDetailsController getCartDetailsController =
  Get.put(GetCartDetailsController());
  int? bottomSelectedIndex;
  PageController? pageController;
  DateTime currentBackPressTime = DateTime.now();
  bool loading = false;
  var data;
  final drawerKey = GlobalKey<ScaffoldState>();
  ShopPageController shopPageController = Get.put(ShopPageController());


  @override
  void initState() {
    // fetchApi();
    profileDetailsController.ProfilePageApi();
    homeComtroller.homePageApi();
    getCartDetailsController.getCartDetails();
    shopPageController.shopPage();

    bottomSelectedIndex = widget.index;
    pageController = PageController(initialPage: widget.index, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) => pageChanged(index),
            children: [
              HomePage(),
              ShopPage(),
              FaverouteListPage(),
              MyCart(),
              MyProfile()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottom(
        bottomSelectedIndex: bottomSelectedIndex!,
        bottomTapped: bottomTapped,
      ),
    );
  }

  void bottomTapped(int index) {
    setState(
      () {
        bottomSelectedIndex = index;
        pageController!.animateToPage(index,
            duration: const Duration(microseconds: 1), curve: Curves.ease);
      },
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  Future<bool> _onWillPop() {
    if (bottomSelectedIndex != 1) {
      setState(
        () {
          pageController!.jumpTo(0);
        },
      );
      return Future.value(false);
    } else if (bottomSelectedIndex == 1) {
      setState(
        () {
          pageController!.jumpTo(1);
        },
      );
      return Future.value(false);
    }
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(milliseconds: 500)) {
      currentBackPressTime = now;
      SystemNavigator.pop();
      return Future.value(false);
    } else {
      SystemNavigator.pop();
    }
    return Future.value(true);
  }

  goAtLikeTab() {
    pageController!.animateToPage(1,
        duration: const Duration(microseconds: 1), curve: Curves.ease);
  }
}
