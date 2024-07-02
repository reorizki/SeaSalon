import 'package:get/get.dart';

import '../controllers/bar_item_pages_controller.dart';

class BarItemPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarItemPagesController>(
      () => BarItemPagesController(),
    );
  }
}
