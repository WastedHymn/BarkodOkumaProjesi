import 'package:barkod_okuma_projesi/controllers/dashboard_controller.dart';
import 'package:barkod_okuma_projesi/views/barcode_query_page.dart';
import 'package:barkod_okuma_projesi/views/product_information_page.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              BarcodeQueryPage(),
              ProductInformationPage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.tabIndex,
          items: [
            bottomNavigationBarItem(
                tabIcon: Icons.search, tabName: "Sorgu Sayfası"),
            bottomNavigationBarItem(
                tabIcon: Icons.shopping_basket, tabName: "Ürün Bilgisi"),
          ],
        ),
      );
    });
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required IconData tabIcon,
    required String tabName,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcon,
      ),
      label: tabName,
    );
  }
}
