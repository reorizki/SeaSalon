import 'package:get/get.dart';

import '../controllers/signup_pages_controller.dart';

class SignupPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupPagesController>(
      () => SignupPagesController(),
    );
  }
}
