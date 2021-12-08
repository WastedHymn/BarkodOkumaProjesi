import 'package:barkod_okuma_projesi/controllers/barcode_query_page_controller.dart';
import 'package:barkod_okuma_projesi/controllers/product_page_controller.dart';
import 'package:barkod_okuma_projesi/widgets/custom_textfield_and_submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

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
          title: Text("Barkod ve Ürün Bilgisi Sorgulama"),
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
