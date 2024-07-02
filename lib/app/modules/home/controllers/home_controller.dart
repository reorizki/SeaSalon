import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var images = {
    "haircut.png": "Haircut",
    "manicure.png": "Manicure",
    "facial.png": "Facial",
  };

  List haircuts = [
    "haircuts1.jpg",
    "haircuts2.jpg",
    "haircuts3.jpg",
  ];

  List manicure = [
    "manicure1.jpg",
    "manicure2.jpg",
    "manicure3.jpg",
  ];

  List facial = [
    "facial1.jpg",
    "facial2.jpg",
    "facial3.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
