import 'package:get/get.dart';

import '../controllers/welcomepages_controller.dart';

class WelcomepagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomepagesController>(
      () => WelcomepagesController(),
    );
  }
}
