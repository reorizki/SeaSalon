import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_booking_controller.dart';

class AdminBookingView extends GetView<AdminBookingController> {
  const AdminBookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminBookingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminBookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
