import 'package:barkod_okuma_projesi/controllers/barcode_query_page_controller.dart';
import 'package:barkod_okuma_projesi/controllers/dashboard_controller.dart';
import 'package:barkod_okuma_projesi/controllers/product_page_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProductPageController>(() => ProductPageController());
    Get.lazyPut<BarcodeQueryPageController>(() => BarcodeQueryPageController());
  }
}
