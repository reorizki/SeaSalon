import 'package:get/get.dart';

class WelcomepagesController extends GetxController {
  List images = [
    'welcome1.jpg',
    'welcome2.jpg',
    'haircuts2.jpg',
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
