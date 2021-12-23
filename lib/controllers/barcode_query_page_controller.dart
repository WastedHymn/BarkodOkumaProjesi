import 'package:barkod_okuma_projesi/controllers/product_page_controller.dart';
import 'package:barkod_okuma_projesi/helper/dialog_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class BarcodeQueryPageController extends GetxController {
  var scannedBarcode = "".obs;

  void updateScannedBarcode({required String barcode}) {
    scannedBarcode.value = barcode;
  }

  void scanBarcode(String pathIm) async {
    final inputImage = InputImage.fromFilePath(pathIm);

    final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

    debugPrint("[SCAN BARCODE FUNCTION] SCANNING IMAGE...");
    DialogHelper.showLoading("Barkod Taranıyor...");
    final List<Barcode> barcodes =
        await barcodeScanner.processImage(inputImage).catchError((onError) {
      debugPrint("[SCAN BARCODE FUNCTION] " + onError);
    });
    DialogHelper.hideLoading();
    if (barcodes.isEmpty) {
      debugPrint("[SCAN BARCODE FUNCTION] BARCODE NOT FOUND.");
      return;
    } else {
      String scannedBarcode = barcodes.first.value.displayValue.toString();
      ProductPageController productPageController =
          Get.find<ProductPageController>();
      productPageController.changeBarcode(newBarcode: scannedBarcode);
      for (Barcode barcode in barcodes) {
        debugPrint("[SCAN BARCODE FUNCTION] SCANNED BARCODE: " +
            barcode.value.displayValue.toString());

        //print("[OCR] BARCODE: " + barcode.value.displayValue.toString());
      }
    }

    barcodeScanner.close();
  }
}
