import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_pages_controller.dart';

class EditProfilePagesView extends GetView<EditProfilePagesController> {
  const EditProfilePagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditProfilePagesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditProfilePagesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
