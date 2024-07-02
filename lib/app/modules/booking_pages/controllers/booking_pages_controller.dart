import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seasalon/app/modules/booking_pages/views/booking_pages_view.dart';

class BookingPagesController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  int selectedIndex = 0;
  String selectedService = "Haircuts and Styling";

  TextEditingController controller = TextEditingController();

  @override
  void onClose() {
    nameC.dispose();
    phoneC.dispose();
    controller.dispose();
    super.onClose();
  }

  void updateSelectedService(ProductCategory newValue) {
    selectedIndex = newValue.idCategory - 1;
    selectedService = newValue.categoryName;
    update();
  }

  List imagesBookings = [
    "haircuts2.jpg",
    "manicure2.jpg",
    "facial1.jpg",
  ];
}
