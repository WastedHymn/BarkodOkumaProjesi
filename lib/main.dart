import 'package:barkod_okuma_projesi/routes/app_pages.dart';
import 'package:barkod_okuma_projesi/routes/app_routes.dart';
//import 'package:barkod_okuma_projesi/views/barcode_query_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());

  //getPermission();
}

/*
void getPermission() async {
  var status = await Permission.storage.request();
  if (status.isDenied) {
    SystemNavigator.pop();
  }
}
*/
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: BarcodeQueryPage(),
    );
  }
}
