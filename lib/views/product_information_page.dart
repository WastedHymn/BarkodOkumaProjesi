import 'package:barkod_okuma_projesi/controllers/product_page_controller.dart';
import 'package:barkod_okuma_projesi/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProductInformationPage extends GetView<ProductPageController> {
  final TextStyle productInfoStyle = const TextStyle(
    fontFamily: "Open Sans",
    fontWeight: FontWeight.w300,
  );
  final TextStyle productInfoStyleBold = const TextStyle(
    fontFamily: "Open Sans",
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ürün İsmi: ",
                      style: productInfoStyleBold,
                    ),
                    Text(
                      controller.productName.value,
                      style: productInfoStyle,
                    )
                  ],
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ürün Açıklaması: ",
                      style: productInfoStyleBold,
                    ),
                    Text(
                      controller.productDescription.value,
                      style: productInfoStyle,
                    )
                  ],
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ürün Fiyatı: ",
                      style: productInfoStyleBold,
                    ),
                    Text(
                      controller.productPrice.value.toString(),
                      style: productInfoStyle,
                    )
                  ],
                ),
              ),
              Obx(
                () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ürün Barkodu: ",
                        style: productInfoStyleBold,
                      ),
                      Text(
                        controller.productBarcode.value,
                        style: productInfoStyle,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
