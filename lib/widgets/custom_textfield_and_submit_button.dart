import 'package:barkod_okuma_projesi/apimodule/api_service.dart';
import 'package:barkod_okuma_projesi/controllers/barcode_query_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextfieldAndSubmitButton extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final String textFieldTitle;
  final double leftMargin;
  final int buttonId;

  const CustomTextfieldAndSubmitButton({
    Key? key,
    required this.textController,
    required this.labelText,
    required this.textFieldTitle,
    required this.leftMargin,
    required this.buttonId,
  }) : super(key: key);

  void printQueryResult() async {
    switch (buttonId) {
      //SEARCH WITH BARCODE NUMBER
      case 0:
        //await ApiService.fetchProductByBarcode(textController.text);
        BarcodeQueryPageController productPageController =
            Get.find<BarcodeQueryPageController>();
        productPageController.getProductNameForQuery(textController.text);
        break;
      //SEARCH WITH PRODUCT NAME
      case 1:
        await ApiService.fetchProductByName(textController.text);
        break;
      case 2:
        await ApiService.fetchProductById(textController.text);
        break;
      default:
        debugPrint("[CUSTOM TEXTFIELD AND SUBMIT BUTTON] INVALID BUTTON ID.");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //TEXTFIELD TITLE
        Text(
          textFieldTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Open Sans",
          ),
        ),
        // TEXTFIELD CONTAINER
        Container(
          margin: EdgeInsets.fromLTRB(leftMargin, 0, leftMargin, 0),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              //  border: Border.all(color: Colors.red),
              ),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              icon: const Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
        //SUBMIT BUTTON
        OutlinedButton(
          onPressed: () {
            printQueryResult();
          },
          child: const Text("ARA"),
        )
      ],
    );
  }
}
