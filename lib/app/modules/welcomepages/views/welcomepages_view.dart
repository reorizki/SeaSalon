import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seasalon/app/modules/login__pages/views/login_pages_view.dart';
import 'package:seasalon/app/widgets/app_text.dart';

import '../controllers/welcomepages_controller.dart';

class WelcomepagesView extends GetView<WelcomepagesController> {
  const WelcomepagesView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => WelcomepagesController());
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.images.length,
        itemBuilder: (_, index) {
          return Stack(
            children: [
              Blur(
                blur: 5.0,
                blurColor: Colors.grey,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      image: AssetImage("img/" + controller.images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SEA Salon",
                          style: GoogleFonts.pacifico(
                            color: Colors.white,
                            fontSize: 40.0,
                          ),
                        ),
                        AppText(text: "Beauty and Elegance Redefined"),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.2),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Get.offAll(() => LoginPagesView());
                            },
                            child: const Text("Get Started"),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(
                        3,
                        (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 3),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                              color: index == indexDots
                                  ? const Color.fromARGB(255, 71, 75, 79)
                                  : const Color.fromARGB(255, 71, 75, 79)
                                      .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
