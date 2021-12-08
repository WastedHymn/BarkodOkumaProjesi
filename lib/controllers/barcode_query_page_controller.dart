import 'package:get/get.dart';

class BarcodeQueryPageController extends GetxController {
  var scannedBarcode = "".obs;

  void updateScannedBarcode({required String barcode}) {
    scannedBarcode.value = barcode;
  }
}
