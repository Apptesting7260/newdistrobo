import 'package:flutter/material.dart';

import 'appColor.dart';

class Bottom extends StatefulWidget {
  final int bottomSelectedIndex;
  final Function bottomTapped;

  const Bottom(
      {Key? key, required this.bottomSelectedIndex, required this.bottomTapped})
      : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  List<BottomNavigationBarItem> buildBottomNavBarItems = [
    const BottomNavigationBarItem(
        label: "Home",

        icon: ImageIcon(AssetImage("assets/aapIcon/Home.png")),
        activeIcon: ImageIcon(AssetImage(
          "assets/aapIcon/colorhome.png",
        ))),
    const BottomNavigationBarItem(
        label: "Shop",
        icon: ImageIcon(AssetImage("assets/aapIcon/Category.png")),
        activeIcon: ImageIcon(AssetImage(
          "assets/aapIcon/CategorycolorIcon.png",
        ))),
    const BottomNavigationBarItem(
        label: "My List",
        icon: ImageIcon(AssetImage("assets/aapIcon/Heart.png")),
        activeIcon: ImageIcon(AssetImage(
          "assets/aapIcon/colorheart.png",
        ))),
    const BottomNavigationBarItem(
        label: "Cart",
        icon: ImageIcon(AssetImage("assets/aapIcon/cart.png")),
        activeIcon: ImageIcon(AssetImage(
          "assets/aapIcon/ColorCart.png",
        ))),
    const BottomNavigationBarItem(
        label: "Profile",
        icon: ImageIcon(AssetImage("assets/aapIcon/profile1icon.png")),
        activeIcon: ImageIcon(AssetImage(
          "assets/aapIcon/profilrimagecolor.png",
        ))),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: buildBottomNavBarItems,
      selectedItemColor:  ColorConstants.appColor,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(
        color: ColorConstants.appColor,
      ),
      unselectedIconTheme: const IconThemeData(
        color: const Color(0xffADADAD),
      ),
      elevation: 8,
      backgroundColor: Colors.white,
      currentIndex: widget.bottomSelectedIndex,
      onTap: (index) => widget.bottomTapped(index),
      selectedFontSize: 12,
      unselectedFontSize: 10,

      selectedLabelStyle: const TextStyle(color: ColorConstants.appColor), // Selected label color
      unselectedLabelStyle: const TextStyle(color: const Color(0xffADADAD)), // Unselected label color
    );
  }
}
