import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plateforme_touristique_onmt/controllers/login_controller.dart';
import 'package:plateforme_touristique_onmt/controllers/registeration_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.title});
  final String? title;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var myemail = '';
  var mypassword = '';
  login() async {}
  LoginController loginController = Get.put(LoginController());
  RegisterationController registerationController =
      Get.put(RegisterationController());
  var isLogin = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/onmt-logo.webp',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: !isLogin.value ? Colors.white : Colors.amber,
                      onPressed: () {
                        isLogin.value = false;
                      },
                      child: Text('Register'),
                    ),
                    MaterialButton(
                      color: isLogin.value ? Colors.white : Colors.amber,
                      onPressed: () {
                        isLogin.value = true;
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                isLogin.value ? loginWidget() : registerWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(registerationController.nameController, 'name'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerationController.emailController, 'email address'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerationController.passwordController, 'password'),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => registerationController.registerWithEmail(),
          title: 'Register',
        )
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.emailController, 'email address'),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.passwordController, 'password'),
        const SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => loginController.loginWithEmail(),
          title: 'Login',
        )
      ],
    );
  }
}

class Controller extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;
}

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  InputTextFieldWidget(this.textEditingController, this.hintText);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white54,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.only(bottom: 15),
            focusColor: Colors.white60),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const SubmitButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide.none)),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.pinkAccent,
              )),
          onPressed: onPressed,
          child: Text(title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}
