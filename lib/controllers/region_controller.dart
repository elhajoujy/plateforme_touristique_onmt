import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plateforme_touristique_onmt/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class RegionController extends GetxController {
  Future<void> getListRegion() async {
    var headers = {
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*",
      'Accept': '*/*'
    };
    try {
      var url = Uri.http(ApiEndPoints.baseUrl, ApiEndPoints.getAllregions);
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        //Todo :
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('Stack Trace: $stackTrace');
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
