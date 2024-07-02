import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_pages_controller.dart';

class MainPagesView extends GetView<MainPagesController> {
  const MainPagesView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MainPagesController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<MainPagesController>(builder: (controller) {
        print("Current Index: ${controller.currentIndex}"); // Debugging
        return PageView(
          // Menggunakan PageView untuk menampilkan halaman-halaman
          controller: controller.pageController,
          children: [controller.pages[controller.currentIndex]],
        );
      }),
      bottomNavigationBar: GetBuilder<MainPagesController>(
        builder: (controller) {
          return BottomNavigationBar(
            unselectedFontSize: 0,
            selectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: (index) {
              controller.onTap(index);
              print("Tapped index: $index"); // Debugging
            },
            currentIndex: controller.currentIndex,
            selectedItemColor: Colors.black54,
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.apps_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp),
                label: 'Bar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My',
              ),
            ],
          );
        },
      ),
    );
  }
}
