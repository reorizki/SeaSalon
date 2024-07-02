import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:seasalon/app/modules/detail_pages/controllers/detail_pages_controller.dart';
import 'package:seasalon/app/modules/detail_pages/views/detail_pages_view.dart';
import 'package:seasalon/app/widgets/app_large_text.dart';
import 'package:seasalon/app/widgets/app_text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60.0, left: 20.0),
              child: Row(
                children: [
                  const Icon(Icons.menu, size: 30, color: Colors.black54),
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            //Discover
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: AppLargeText(text: "Services"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            //TabBar
            Container(
              padding: EdgeInsets.zero,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  controller: controller.tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(color: Colors.black, radius: 4),
                  tabs: const [
                    Tab(
                      text: "Haircuts and Styling",
                    ),
                    Tab(
                      text: "Manicure and Pedicure",
                    ),
                    Tab(
                      text: "Facial Treatments",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 10.0),
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  SizedBox(
                    height: 80.0,
                    child: ListView.builder(
                      itemCount: controller.haircuts.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20.0 : 10.0,
                            right: index == 9 ? 20.0 : 0.0,
                          ),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "img/" + controller.haircuts[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                    child: ListView.builder(
                      itemCount: controller.manicure.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20.0 : 10.0,
                            right: index == 9 ? 20.0 : 0.0,
                          ),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "img/" + controller.manicure[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                    child: ListView.builder(
                      itemCount: controller.facial.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20.0 : 10.0,
                            right: index == 9 ? 20.0 : 0.0,
                          ),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "img/" + controller.facial[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Booking Now",
                    size: 20,
                  ),
                  AppText(text: "See All", color: Colors.blueAccent)
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: ListView.builder(
                itemCount: detailPagesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final DetailPages detail = detailPagesList[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => DetailPagesView(
                                pages: detail,
                              ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20.0 : 10.0,
                            right: index == 9 ? 20.0 : 0.0,
                          ),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "img/${controller.images.keys.elementAt(index)}",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: AppText(
                          text: controller.images.values.elementAt(index),
                          size: 14,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLargeText(
                    text: "Contact Person",
                    size: 20,
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716044962/tje4vyigverxlotuhvpb.png",
                        ),
                      ),
                      title: const Text("Thomas"),
                      subtitle: const Text("08123456789"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.call,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716044962/tje4vyigverxlotuhvpb.png",
                        ),
                      ),
                      title: const Text("Sekar"),
                      subtitle: const Text("08164829372"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.call,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, this.radius = 3.0});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset =
        Offset(cfg.size!.width / 2 - radius / 2, cfg.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
