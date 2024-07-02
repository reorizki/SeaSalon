import 'package:get/get.dart';

import '../controllers/edit_profile_pages_controller.dart';

class EditProfilePagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfilePagesController>(
      () => EditProfilePagesController(),
    );
  }
}
