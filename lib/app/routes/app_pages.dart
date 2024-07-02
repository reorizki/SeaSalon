import 'package:get/get.dart';

import '../modules/admin_booking/bindings/admin_booking_binding.dart';
import '../modules/admin_booking/views/admin_booking_view.dart';
import '../modules/admin_login/bindings/admin_login_binding.dart';
import '../modules/admin_login/views/admin_login_view.dart';
import '../modules/bar_item_pages/bindings/bar_item_pages_binding.dart';
import '../modules/bar_item_pages/views/bar_item_pages_view.dart';
import '../modules/booking_pages/bindings/booking_pages_binding.dart';
import '../modules/booking_pages/views/booking_pages_view.dart';
import '../modules/detail_pages/bindings/detail_pages_binding.dart';
import '../modules/detail_pages/views/detail_pages_view.dart';
import '../modules/edit_profile_pages/bindings/edit_profile_pages_binding.dart';
import '../modules/edit_profile_pages/views/edit_profile_pages_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/information_pages/bindings/information_pages_binding.dart';
import '../modules/information_pages/views/information_pages_view.dart';
import '../modules/login__pages/bindings/login_pages_binding.dart';
import '../modules/login__pages/views/login_pages_view.dart';
import '../modules/main_pages/bindings/main_pages_binding.dart';
import '../modules/main_pages/views/main_pages_view.dart';
import '../modules/mt_pages/bindings/mt_pages_binding.dart';
import '../modules/mt_pages/views/mt_pages_view.dart';
import '../modules/my_pages/bindings/my_pages_binding.dart';
import '../modules/my_pages/views/my_pages_view.dart';
import '../modules/setting_pages/bindings/setting_pages_binding.dart';
import '../modules/setting_pages/views/setting_pages_view.dart';
import '../modules/signup_pages/bindings/signup_pages_binding.dart';
import '../modules/signup_pages/views/signup_pages_view.dart';
import '../modules/welcomepages/bindings/welcomepages_binding.dart';
import '../modules/welcomepages/views/welcomepages_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOMEPAGES;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOMEPAGES,
      page: () => const WelcomepagesView(),
      binding: WelcomepagesBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_LOGIN,
      page: () => const AdminLoginView(),
      binding: AdminLoginBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_BOOKING,
      page: () => const AdminBookingView(),
      binding: AdminBookingBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_PAGES,
      page: () => BookingPagesView(),
      binding: BookingPagesBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PAGES,
      page: () => DetailPagesView(pages: Get.arguments),
      binding: DetailPagesBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION_PAGES,
      page: () => InformationPagesView(),
      binding: InformationPagesBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGES,
      page: () => LoginPagesView(),
      binding: LoginPagesBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_PAGES,
      page: () => const SettingPagesView(),
      binding: SettingPagesBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_PAGES,
      page: () => SignupPagesView(),
      binding: SignupPagesBinding(),
    ),
    GetPage(
      name: _Paths.BAR_ITEM_PAGES,
      page: () => BarItemPagesView(),
      binding: BarItemPagesBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_PAGES,
      page: () => const EditProfilePagesView(),
      binding: EditProfilePagesBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGES,
      page: () => const MainPagesView(),
      binding: MainPagesBinding(),
    ),
    GetPage(
      name: _Paths.MY_PAGES,
      page: () => MyPagesView(),
      binding: MyPagesBinding(),
    ),
    GetPage(
      name: _Paths.MT_PAGES,
      page: () => const MtPagesView(),
      binding: MtPagesBinding(),
    ),
  ];
}
