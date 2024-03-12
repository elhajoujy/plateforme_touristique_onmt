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
              child: Obx(
            () => Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/onmt-logo.webp',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: !isLogin.value ? Colors.white : Colors.amber,
                      onPressed: () {
                        print("true");
                        isLogin.value = false;
                      },
                      child: Text('Register'),
                    ),
                    MaterialButton(
                      color: isLogin.value ? Colors.white : Colors.amber,
                      onPressed: () {
                        print("true");
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
          )),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(
            textEditingController: registerationController.firsntmae,
            hintText: 'firstname'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            textEditingController: registerationController.lastname,
            hintText: 'lastname'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            textEditingController: registerationController.emailController,
            hintText: 'email address'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
          textEditingController: registerationController.passwordController,
          hintText: 'Password',
          isObscureText: true,
          minLength: 8,
        ),
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
        InputTextFieldWidget(
            textEditingController: loginController.emailController,
            hintText: 'email address'),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
          textEditingController: loginController.passwordController,
          hintText: 'password',
          isObscureText: true,
          minLength: 8,
        ),
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

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool isObscureText;
  final int? minLength;
  final int? maxLength;

  InputTextFieldWidget({
    required this.textEditingController,
    required this.hintText,
    this.isObscureText = false,
    this.minLength = 8,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Increased height to accommodate error message
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<InputTextFieldController>(
            init: InputTextFieldController(),
            builder: (controller) {
              return TextField(
                controller: textEditingController,
                obscureText: isObscureText,
                maxLength: maxLength,
                onChanged: (value) => controller.validate(value, minLength),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  fillColor: Colors.white54,
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.only(bottom: 15),
                  focusColor: Colors.white60,
                  counterText: '', // Hide the default character counter
                  errorText: controller.errorText.value,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class InputTextFieldController extends GetxController {
  RxString errorText = RxString('');

  void validate(String value, int? minLength) {
    if (minLength != null && value.length < minLength) {
      errorText.value = 'Minimum length requirement not met';
    } else {
      errorText.value = '';
    }
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
