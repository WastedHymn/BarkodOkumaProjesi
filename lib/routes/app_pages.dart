import 'package:barkod_okuma_projesi/controllers/dashboard_binding.dart';
import 'package:barkod_okuma_projesi/routes/app_routes.dart';
import 'package:barkod_okuma_projesi/views/dashboard_page.dart';
import 'package:get/get.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    )
  ];
}
