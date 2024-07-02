// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:seasalon/app/modules/booking_pages/views/booking_pages_view.dart';
import 'package:seasalon/app/widgets/app_buttons.dart';
import 'package:seasalon/app/widgets/app_large_text.dart';
import 'package:seasalon/app/widgets/app_text.dart';

import '../controllers/detail_pages_controller.dart';

class DetailPagesView extends GetView<DetailPagesController> {
  final DetailPages pages;
  const DetailPagesView({
    super.key,
    required this.pages,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(DetailPagesController());
    return Scaffold(
      body: GetBuilder<DetailPagesController>(builder: (controller) {
        return SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(pages.image), fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 60,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.menu),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 330,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: pages.name,
                            color: Colors.black.withOpacity(0.8),
                            size: 25,
                          ),
                          AppText(
                            text: "Rp ${pages.price}",
                            color: Colors.blueGrey,
                            size: 15,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.blueGrey),
                          const SizedBox(
                            width: 10.0,
                          ),
                          AppText(text: "Medan, Marelan")
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < controller.gottenStars
                                    ? Colors.yellow
                                    : Colors.grey,
                              );
                            }),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          AppText(
                              text: "(4.0)",
                              color: Colors.blueGrey,
                              size: 15.0),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      AppText(text: "How many people ordered?"),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              controller.onTap(RxInt(index));
                            },
                            child: AppButtons(
                              color: controller.selectedIndex.value == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor:
                                  controller.selectedIndex.value == index
                                      ? Colors.black
                                      : Colors.grey.withOpacity(0.2),
                              size: 50,
                              borderColor: Colors.white10,
                              text: (index + 1).toString(),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      AppLargeText(
                        text: "Descriptons",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      AppText(
                        text: pages.description,
                        size: 12.0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      color: Colors.black,
                      backgroundColor: Colors.white,
                      size: 60,
                      borderColor: Colors.black,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(
                      height: 60,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          Get.to(() => BookingPagesView());
                        },
                        child: const Text("Booking Now"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
