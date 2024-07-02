import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seasalon/app/modules/bar_item_pages/views/bar_item_pages_view.dart';
import 'package:seasalon/app/modules/home/views/home_view.dart';
import 'package:seasalon/app/modules/my_pages/views/my_pages_view.dart';

class MainPagesController extends GetxController {
  List pages = [
    const HomeView(),
    BarItemPagesView(),
    MyPagesView(),
  ];

  late PageController pageController =
      PageController(initialPage: 0); // Inisialisasi langsung
  int currentIndex = 0;

  void onTap(int pages) {
    currentIndex = pages;
    pageController.jumpToPage(pages);
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
