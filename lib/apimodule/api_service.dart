import 'dart:convert';

import 'package:barkod_okuma_projesi/controllers/product_page_controller.dart';
import 'package:barkod_okuma_projesi/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static const String url = "http://nihatdurgun.com/";
  static const String clientId = "WH1LkeEuhel1Ig3";
  static const String clientSecret = "3cFNB7Q8RXWFecEkAIfg";

  static void changeProductInfo(String body1) async {
    final decodedJson = jsonDecode(body1);

    Product newProductInfo = Product(
      availableMarket: decodedJson["availabeMarket"],
      productBarcode: '0',
      productColor: decodedJson["productColor"],
      productDescription: decodedJson["productDescription"],
      productId: decodedJson["id"],
      productMaterial: decodedJson["productMaterial"],
      productName: decodedJson["productName"],
      productPrice: double.parse(decodedJson["productPrice"]),
    );

    ProductPageController productPageController =
        Get.find<ProductPageController>();
    var client2 = http.Client();
    var response2 = await client2.get(Uri.parse(
        "http://nihatdurgun.com/comments?clientID=WH1LkeEuhel1Ig3&clientSecret=3cFNB7Q8RXWFecEkAIfg&productId=" +
            decodedJson["id"].toString()));
    debugPrint(("RESPONSE2 URL " +
        "http://nihatdurgun.com/comments?clientID=WH1LkeEuhel1Ig3&clientSecret=3cFNB7Q8RXWFecEkAIfg&productId=" +
        decodedJson["id"].toString()));
    if (response2.statusCode == 200) {
      final decodedJson2 = jsonDecode(response2.body);
      productPageController.changeProductInfo(
        newProductName: newProductInfo.getProductName,
        newProductPrice: newProductInfo.getProductPrice,
        newProductDescription: newProductInfo.getProductDescription,
        newProductBarcode: newProductInfo.getProductBarcode,
        newProductId: newProductInfo.getProductId,
        newProductColor: newProductInfo.getProductColor,
        newAvailableMarket: newProductInfo.availableMarket,
        newProductMaterial: newProductInfo.getProductMaterial,
        newProductComment: decodedJson2["comment"],
      );
    } else {
      debugPrint("[changeProductInfo] RESPONSE2 STATUS: " +
          response2.statusCode.toString());
    }
    client2.close();
  }

  static Future fetchProductByName(String productName) async {
    //Uri queryUri = Uri(path: );
    String queryUrl = url +
        "getproduct?clientID=" +
        clientId +
        "&clientSecret=" +
        clientSecret +
        "&productName=" +
        productName;
    debugPrint("[fetchProductByName] URL: " + queryUrl);
    var response = await client.get(Uri.parse(queryUrl));
    switch (response.statusCode) {
      case 200:
        {
          var jsonString = response.body;
          debugPrint(
              "[API SERVICE] PRODUCT QUERY WITH PRODUCT NAME: " + jsonString);
          changeProductInfo(jsonString);
        }
        break;
      case 404:
        debugPrint("[API SERVICE] WEB ADDRESS IS WRONG. STATUS: " +
            response.statusCode.toString() +
            " " +
            productName);
        break;
      case 503:
        {
          debugPrint("[API SERVICE] SEARCH PRODUCT AGAIN. STATUS: " +
              response.statusCode.toString());
        }
        break;
      default:
        {
          debugPrint(
              "[API SERVICE] PRODUCT QUERY WITH PRODUCT NAME STATUS CODE: " +
                  response.statusCode.toString());
        }
        break;
    }
  }

  static Future fetchProductById(String productId) async {
    //Uri queryUri = Uri(path: );
    String queryUrl = url +
        "magetComments?clientID=" +
        clientId +
        "&clientSecret=" +
        clientSecret +
        "&productId=" +
        productId;

    var response = await client.post(
      Uri.parse(queryUrl),
      headers: {"Content-Type": "application/json"},
    );
    switch (response.statusCode) {
      case 200:
        {
          var jsonString = response.body;
          debugPrint(
              "[API SERVICE] PRODUCT QUERY WITH PRODUCT ID: " + jsonString);
          changeProductInfo(jsonString);
        }
        break;
      case 404:
        debugPrint("[API SERVICE] WEB ADDRESS IS WRONG. STATUS: " +
            response.statusCode.toString());
        break;
      case 503:
        {
          debugPrint("[API SERVICE] SEARCH PRODUCT AGAIN. STATUS: " +
              response.statusCode.toString());
        }
        break;
      default:
        {
          debugPrint(
              "[API SERVICE] PRODUCT QUERY WITH PRODUCT NAME STATUS CODE: " +
                  response.statusCode.toString());
        }
        break;
    }
  }

  static Future fetchProductByBarcode(String productBarcode) async {
    //Uri queryUri = Uri(path: );
    String queryUrl = url +
        "mlgetProduct?clientID=" +
        clientId +
        "&clientSecret=" +
        clientSecret +
        "&barcodeNumber=" +
        productBarcode;
    var response = await client.post(Uri.parse(queryUrl));
    switch (response.statusCode) {
      case 200:
        {
          var jsonString = response.body;
          debugPrint(
              "[API SERVICE] PRODUCT QUERY WITH BARCODE NUMBER: " + jsonString);
          changeProductInfo(jsonString);
        }
        break;
      case 404:
        debugPrint("[API SERVICE] WEB ADDRESS IS WRONG.");
        break;
      case 503:
        {
          debugPrint("[API SERVICE] SEARCH PRODUCT AGAIN. STATUS: " +
              response.statusCode.toString());
        }
        break;
      default:
        {
          debugPrint(
              "[API SERVICE] PRODUCT QUERY WITH PRODUCT BARCODE STATUS CODE: " +
                  response.statusCode.toString());
        }
        break;
    }
  }
}
