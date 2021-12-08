import 'package:barkod_okuma_projesi/widgets/custom_textfield_and_submit_button.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class BarcodeQueryPage extends StatelessWidget {
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
              const Spacer(
                flex: 1,
              ),
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
              const Spacer(
                flex: 1,
              ),
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
              const Spacer(
                flex: 3,
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
Column(
                  children: [
                    Text(
                      "BARKOD NUMARASI İLE ÜRÜN SORGULAMA",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Open Sans",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          SizeConfig.safeBlockHorizontal * 25, 0, 0, 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          //  border: Border.all(color: Colors.red),
                          ),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Barkod Numarası",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          icon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),


Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  children: [
                    Text(
                      "ÜRÜN İSMI İLE BARKOD SORGULAMA",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Open Sans",
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        labelText: "Ürün İsmi",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),                
 */