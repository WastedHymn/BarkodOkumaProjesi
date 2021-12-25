import 'package:barkod_okuma_projesi/controllers/product_page_controller.dart';
import 'package:barkod_okuma_projesi/size_config.dart';
//import 'package:barkod_okuma_projesi/widgets/custom_text_widget.dart';
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
  final Widget space = const Spacer(
    flex: 1,
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
              const Spacer(
                flex: 2,
              ),
              //TITLE
              const Text(
                "İNTERNETTE SORGULANAN ÜRÜN",
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w500,
                ),
              ),
              space,
              //PRODUCT ID
              Obx(
                () => Container(
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 20,
                      0,
                      SizeConfig.blockSizeHorizontal * 10,
                      0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ürün Id: ",
                        style: productInfoStyleBold,
                      ),
                      Text(
                        controller.productId.value.toString(),
                        style: productInfoStyle,
                      )
                    ],
                  ),
                ),
              ),
              //PRODUCT NAME
              Obx(
                () => Container(
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 20,
                      0,
                      SizeConfig.blockSizeHorizontal * 10,
                      0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
              ),
              //PRODUCT DESCRIPTION
              Obx(
                () => Container(
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 20,
                      0,
                      SizeConfig.blockSizeHorizontal * 20,
                      0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ürün Açıklaması: ",
                        style: productInfoStyleBold,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          controller.productDescription.value,
                          style: productInfoStyle,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              //PRODUCT PRICE
              Obx(
                () => Container(
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 20,
                      0,
                      SizeConfig.blockSizeHorizontal * 10,
                      0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
              ),
              //PRODUCT COLOR
              Obx(
                () {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                        SizeConfig.blockSizeHorizontal * 20,
                        0,
                        SizeConfig.blockSizeHorizontal * 10,
                        0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ürün Rengi: ",
                          style: productInfoStyleBold,
                        ),
                        Text(
                          controller.productColor.value,
                          style: productInfoStyle,
                        )
                      ],
                    ),
                  );
                },
              ),
              //PRODUCT MATERIAL
              Obx(
                () {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                        SizeConfig.blockSizeHorizontal * 20,
                        0,
                        SizeConfig.blockSizeHorizontal * 10,
                        0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ürün Materyali: ",
                          style: productInfoStyleBold,
                        ),
                        Text(
                          controller.productMaterial.value,
                          style: productInfoStyle,
                        )
                      ],
                    ),
                  );
                },
              ),
              //AVAILABLE MARKET
              Obx(
                () {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                        SizeConfig.blockSizeHorizontal * 20,
                        0,
                        SizeConfig.blockSizeHorizontal * 10,
                        0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ürünün Satışını Yapan Firma: ",
                          style: productInfoStyleBold,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              controller.availableMarket.value,
                              style: productInfoStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              //PRODUCT COMMENT
              Obx(
                () {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                        SizeConfig.blockSizeHorizontal * 20,
                        0,
                        SizeConfig.blockSizeHorizontal * 10,
                        0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ürün Yorumu: ",
                          style: productInfoStyleBold,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              controller.productComment.value,
                              style: productInfoStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              //SPACE ****************************************************************************
              const Spacer(
                flex: 2,
              ),
              //LOCAL QUERY TITLE
              const Text(
                "YEREL SORGULANAN ÜRÜN",
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w500,
                ),
              ),
              space,
              Obx(
                () => Container(
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 20,
                      0,
                      SizeConfig.blockSizeHorizontal * 10,
                      0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ürün Id: ",
                        style: productInfoStyleBold,
                      ),
                      Text(
                        controller.localProductId.value.toString(),
                        style: productInfoStyle,
                      )
                    ],
                  ),
                ),
              ),
              //PRODUCT NAME
              Obx(
                () => Container(
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 20,
                      0,
                      SizeConfig.blockSizeHorizontal * 10,
                      0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ürün İsmi: ",
                        style: productInfoStyleBold,
                      ),
                      Text(
                        controller.localProductName.value,
                        style: productInfoStyle,
                      )
                    ],
                  ),
                ),
              ),
              //PRODUCT DESCRIPTION
              Obx(
                () => Container(
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 20,
                      0,
                      SizeConfig.blockSizeHorizontal * 20,
                      0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ürün Açıklaması: ",
                        style: productInfoStyleBold,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          controller.localProductDescription.value,
                          style: productInfoStyle,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              //PRODUCT PRICE
              Obx(
                () => Container(
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 20,
                      0,
                      SizeConfig.blockSizeHorizontal * 10,
                      0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ürün Fiyatı: ",
                        style: productInfoStyleBold,
                      ),
                      Text(
                        controller.localProductPrice.value.toString(),
                        style: productInfoStyle,
                      )
                    ],
                  ),
                ),
              ),
              //PRODUCT COLOR
              Obx(
                () {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                        SizeConfig.blockSizeHorizontal * 20,
                        0,
                        SizeConfig.blockSizeHorizontal * 10,
                        0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ürün Rengi: ",
                          style: productInfoStyleBold,
                        ),
                        Text(
                          controller.localProductColor.value,
                          style: productInfoStyle,
                        )
                      ],
                    ),
                  );
                },
              ),
              //PRODUCT MATERIAL
              Obx(
                () {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                        SizeConfig.blockSizeHorizontal * 20,
                        0,
                        SizeConfig.blockSizeHorizontal * 10,
                        0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ürün Materyali: ",
                          style: productInfoStyleBold,
                        ),
                        Text(
                          controller.localProductMaterial.value,
                          style: productInfoStyle,
                        )
                      ],
                    ),
                  );
                },
              ),
              //AVAILABLE MARKET
              Obx(
                () {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                        SizeConfig.blockSizeHorizontal * 20,
                        0,
                        SizeConfig.blockSizeHorizontal * 10,
                        0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ürünün Satışını Yapan Firma: ",
                          style: productInfoStyleBold,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              controller.localAvailableMarket.value,
                              style: productInfoStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
