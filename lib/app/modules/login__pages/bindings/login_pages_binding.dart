import 'package:get/get.dart';

import '../controllers/login_pages_controller.dart';

class LoginPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPagesController>(
      () => LoginPagesController(),
    );
  }
}
