import 'package:barkod_okuma_projesi/controllers/barcode_query_page_controller.dart';
import 'package:barkod_okuma_projesi/widgets/custom_textfield_and_submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../size_config.dart';

class BarcodeQueryPage extends GetView<BarcodeQueryPageController> {
  BarcodeQueryPage({Key? key}) : super(key: key);

  final TextEditingController barcodeNumberController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productIdController = TextEditingController();

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
                  buttonId: 0,
                ),
              ),
              //GET BARCODE FROM IMAGE AND QUERY PRODUCT WITH SCANNED BARCODE
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
                    //CAMERA BUTTON
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
                            if (pathIm.isNotEmpty) {
                              //scanBarcode(pathIm);
                              controller.scanBarcode(pathIm);
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
