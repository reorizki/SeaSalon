import 'package:get/get.dart';

import '../controllers/mt_pages_controller.dart';

class MtPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MtPagesController>(
      () => MtPagesController(),
    );
  }
}
