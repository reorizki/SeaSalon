import 'package:get/get.dart';

import '../controllers/main_pages_controller.dart';

class MainPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPagesController>(
      () => MainPagesController(),
    );
  }
}
