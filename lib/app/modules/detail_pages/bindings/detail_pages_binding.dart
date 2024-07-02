import 'package:get/get.dart';

import '../controllers/detail_pages_controller.dart';

class DetailPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPagesController>(
      () => DetailPagesController(),
    );
  }
}
