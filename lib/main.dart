import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plateforme_touristique_onmt/home/Home.dart';
import 'auth/Login.dart';

var isLogin;
void main() async {
  var user;
  if (user != null) {
    isLogin = true;
  } else {
    isLogin = false;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      routes: {
        'login': (context) => const LoginPage(title: "Login"),
        'HomePage': (context) => const HomePage(),
      },
      home:
          isLogin == true ? const HomePage() : const LoginPage(title: "Login"),
    );
  }
}
