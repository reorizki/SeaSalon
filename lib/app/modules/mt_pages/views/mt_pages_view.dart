import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mt_pages_controller.dart';

class MtPagesView extends GetView<MtPagesController> {
  const MtPagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MtPagesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MtPagesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
