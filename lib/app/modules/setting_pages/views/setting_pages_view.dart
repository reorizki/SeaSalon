import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_pages_controller.dart';

class SettingPagesView extends GetView<SettingPagesController> {
  const SettingPagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingPagesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SettingPagesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
