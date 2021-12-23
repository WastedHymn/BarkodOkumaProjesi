import 'package:barkod_okuma_projesi/controllers/barcode_query_page_controller.dart';
import 'package:barkod_okuma_projesi/controllers/product_page_controller.dart';
import 'package:barkod_okuma_projesi/widgets/custom_textfield_and_submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import '../size_config.dart';

class BarcodeQueryPage extends GetView<BarcodeQueryPageController> {
  BarcodeQueryPage({Key? key}) : super(key: key);

  final TextEditingController barcodeNumberController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();

  final BoxDecoration boxDecor = const BoxDecoration(
    border: Border(
      top: BorderSide(
        color: Colors.grey,
      ),
      bottom: BorderSide(
        color: Colors.grey,
      ),
    ),
  );

  void scanBarcode(String pathIm) async {
    final inputImage = InputImage.fromFilePath(pathIm);

    final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

    debugPrint("[SCAN BARCODE FUNCTION] SCANNING IMAGE...");
    final List<Barcode> barcodes =
        await barcodeScanner.processImage(inputImage).catchError((onError) {
      debugPrint("[SCAN BARCODE FUNCTION] " + onError);
    });

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

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Barkod ve Ürün Bilgisi Sorgulama"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              /*const Spacer(
                flex: 1,
              ),*/
              //PRODUCT QUERY WITH BARCODE NUMBER
              Container(
                decoration: boxDecor,
                child: CustomTextfieldAndSubmitButton(
                  labelText: "Barkod Numarası",
                  textController: barcodeNumberController,
                  textFieldTitle: "BARKOD NUMARASI İLE ÜRÜN SORGULAMA",
                  leftMargin: SizeConfig.safeBlockHorizontal * 20,
                ),
              ),
              /*const Spacer(
                flex: 1,
              ),*/
              //BARCODE QUERY WITH PRODUCT NAME
              Container(
                decoration: boxDecor,
                child: CustomTextfieldAndSubmitButton(
                  labelText: "Ürün İsmi",
                  textController: productNameController,
                  textFieldTitle: "ÜRÜN İSMI İLE BARKOD SORGULAMA",
                  leftMargin: SizeConfig.safeBlockHorizontal * 20,
                ),
              ),
              Container(
                decoration: boxDecor,
                width: SizeConfig.safeBlockHorizontal * 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //TEXTFIELD TITLE
                    const Text(
                      "BARKOD TARAMA İLE ÜRÜN SORGULAMA",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Open Sans",
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0, SizeConfig.safeBlockVertical * 2, 0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          ImagePicker()
                              .pickImage(
                            source: ImageSource.camera,
                            preferredCameraDevice: CameraDevice.rear,
                          )
                              .then((image) async {
                            String pathIm = image!.path;
                            if (!pathIm.isEmpty) {
                              scanBarcode(pathIm);
                            } else {
                              debugPrint(
                                  "[IMAGE PICKER WIDGET] IMAGE PATH IS EMPTY.");
                            }
                          });
                        },
                        child: const Icon(CupertinoIcons.camera_fill),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ),
    );
  }
}


/*
                              File imageFile = File(image.path);
                              Directory appDocDir =
                                  await getApplicationDocumentsDirectory();
                              String appDocPath = appDocDir.path;

                              final newFile = await imageFile
                                  .copy(appDocPath + "/newFile.png");
                              imageFile.delete();
                              print("[OCR] PATH: " + newFile.path);
                              String ocrText =
                                  await FlutterTesseractOcr.extractText(
                                newFile.path,
                                language: 'eng',
                              ).then((value) {
                                print("[OCR] OCR TEXT: " + value.toString());
                                return "0";
                              }).onError((error, stackTrace) {
                                print("[OCR] ERROR: " + error.toString());
                                print("[OCR] STACKTRACE: " +
                                    stackTrace.toString());
                                return "-1";
                              });
                              */

                                 /*
                          scanBarcodeNormal().then((value) {
                            printInfo(
                                info: "BARCODE QUERY PAGE SCANNED BARCODE: " +
                                    controller.scannedBarcode.value);
                            if (controller.scannedBarcode.value.isNotEmpty) {
                              ProductPageController productPageController =
                                  Get.find<ProductPageController>();
                              productPageController.changeBarcode(
                                  newBarcode: controller.scannedBarcode.value);
                            }
                          });
                          */
                          
  /*
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes = "";
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#00ff00', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    if (barcodeScanRes.isNotEmpty) {
      controller.updateScannedBarcode(barcode: barcodeScanRes);
    }
  }
*/