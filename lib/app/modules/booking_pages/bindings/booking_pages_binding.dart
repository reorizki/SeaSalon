import 'package:get/get.dart';

import '../controllers/booking_pages_controller.dart';

class BookingPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingPagesController>(
      () => BookingPagesController(),
    );
  }
}
