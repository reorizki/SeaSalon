import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPagesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int gottenStars = 4;
  RxInt selectedIndex = 0.obs; // Ubah selectedIndex menjadi RxInt

  late TabController tabController;

  void onTap(RxInt index) {
    selectedIndex = index; // Update nilai selectedIndex

    tabController.animateTo(index.value);
    update(); // Animasi perpindahan tab
  }

  //TODO: Implement DetailPagesController
  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  final count = 0.obs;

  void increment() => count.value++;
}

class DetailPages {
  String name;
  String image;
  String description;
  int price;
  DetailPages({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}

var detailPagesList = [
  DetailPages(
    name: "Haircut & styling",
    image: "img/haircuts1.jpg",
    description:
        "Transform your look at SEA Salon with our expert haircuts and styling services. Enjoy professional care using top-quality products in a friendly, comfortable setting. Visit us at Medan, Marelan.",
    price: 250000,
  ),
  DetailPages(
    name: "Manicure & Pedicure",
    image: "img/manicure1.jpg",
    description:
        "Transform your look at SEA Salon with our expert Manicure and Pedicure services. Enjoy professional care using top-quality products in a friendly, comfortable setting. Visit us at Medan, Marelan.",
    price: 300000,
  ),
  DetailPages(
    name: "Facial Treatments",
    image: "img/facial3.jpg",
    description:
        "Transform your look at SEA Salon with our expert Facial Treatments services. Enjoy professional care using top-quality products in a friendly, comfortable setting. Visit us at Medan, Marelan.",
    price: 1200000,
  ),
];
