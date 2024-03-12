import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plateforme_touristique_onmt/home/Home.dart';
import 'package:plateforme_touristique_onmt/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterationController extends GetxController {
  TextEditingController firsntmae = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.registerEmail);
      Map body = {
        'firstname': firsntmae.text.trim(),
        'latname': lastname.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text,
        "regionId": "1"
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token);
          firsntmae.clear();
          lastname.clear();
          emailController.clear();
          passwordController.clear();
          Get.off(HomePage());
        } else {
          throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
