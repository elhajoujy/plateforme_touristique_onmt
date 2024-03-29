import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plateforme_touristique_onmt/models/region.dart';
import 'package:plateforme_touristique_onmt/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class RegionController extends GetxController {
  Future<RegionPage?> getListRegion() async {
    var headers = {'Content-Type': 'application/json', 'Accept': '*/*'};
    try {
      var url =
          Uri.http(ApiEndPoints.baseRegionUrl, ApiEndPoints.getAllregions);
      // Uri.parse("http:locahost:8097/api/v1/regions");
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return RegionPageFromJson(
            const Utf8Decoder().convert(response.bodyBytes));
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        return null;
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
