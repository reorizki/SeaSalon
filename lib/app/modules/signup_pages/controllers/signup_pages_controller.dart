import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPagesController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController phoneC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    nameC.dispose();
    phoneC.dispose();
    super.onClose();
  }
}
