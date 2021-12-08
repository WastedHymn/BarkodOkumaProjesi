import 'package:barkod_okuma_projesi/controllers/dashboard_controller.dart';
import 'package:barkod_okuma_projesi/controllers/product_page_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProductPageController>(() => ProductPageController());
    // TODO: implement dependencies
  }
}
