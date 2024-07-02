import 'package:get/get.dart';

import '../controllers/setting_pages_controller.dart';

class SettingPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingPagesController>(
      () => SettingPagesController(),
    );
  }
}
