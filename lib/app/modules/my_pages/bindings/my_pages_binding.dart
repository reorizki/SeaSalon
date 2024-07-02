import 'package:get/get.dart';

import '../controllers/my_pages_controller.dart';

class MyPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPagesController>(
      () => MyPagesController(),
    );
  }
}
