import 'package:barkod_okuma_projesi/controllers/product_page_controller.dart';
import 'package:barkod_okuma_projesi/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProductInformationPage extends GetView<ProductPageController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => CustomText(
                    str: "Ürün İsmi: ",
                    variableString: controller.productName.value,
                  ),
                ),
                Obx(
                  () => CustomText(
                    str: "Ürün Açıklaması: ",
                    variableString: controller.productDescription.value,
                  ),
                ),
                Obx(
                  () => CustomText(
                    str: "Ürün Fiyatı: ",
                    variableString: controller.productPrice.value.toString(),
                  ),
                ),
                Obx(
                  () => CustomText(
                    str: "Ürün Barkodu: ",
                    variableString: controller.productBarcode.value.toString(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
