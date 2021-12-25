import 'package:barkod_okuma_projesi/routes/app_pages.dart';
import 'package:barkod_okuma_projesi/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppPages.list,
      title: 'Barkod Okuma Projesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: BarcodeQueryPage(),
    );
  }
}
