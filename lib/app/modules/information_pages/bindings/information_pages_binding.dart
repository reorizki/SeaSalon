import 'package:get/get.dart';

import '../controllers/information_pages_controller.dart';

class InformationPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationPagesController>(
      () => InformationPagesController(),
    );
  }
}
