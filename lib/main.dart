import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plateforme_touristique_onmt/home/Home.dart';
import 'auth/Login.dart';

void main() async {
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
        'login': (context) => const AuthScreen(title: "Login"),
        'HomePage': (context) => const HomePage(),
      },
      home: AuthScreen(title: "Authentification Screen onmt"),
      // home: HomePage(),
    );
  }
}
