import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  final _selectedIndex = 0.obs;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> get menuItems => ['Home', 'About Us', 'Blog', 'Contact Us'];

  int get selectedIndex => _selectedIndex.value;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
  }
  void openOrCloseDrawer() {

    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
