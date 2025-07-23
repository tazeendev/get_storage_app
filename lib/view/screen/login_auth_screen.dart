import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage_app/view/screen/signup_auth_screen.dart';

import '../../controller/auth_controller/login_auth/login_screen_controller.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_authheader.dart';
import '../widgets/social_button_widget.dart';
import '../widgets/textformfield_widgets.dart';
import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthController authController=Get.put(AuthController());
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAuthHeader(title: 'Login'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(color: Colors.black54, fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(()=>SignUpScreen());
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Please enter your name';
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Please enter your email';
                        if (!GetUtils.isEmail(value)) return 'Please enter a valid email';
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Please enter your password';
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                         // Get.snackbar("Forgot Password", "Functionality not implemented yet.");
                        },
                        child: const Text(
                          'Forgot?',
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authController.login(
                            nameController.text,
                            passwordController.text,
                            emailController.text,
                          );
                          Get.offAll(() => HomeScreen());
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                    const SocialButtons(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}