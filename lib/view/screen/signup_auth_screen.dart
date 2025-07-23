// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controller/auth_controller/login_auth/login_screen_controller.dart';
// import '../widgets/button_widget.dart';
// import '../widgets/custom_authheader.dart';
// import '../widgets/textformfield_widgets.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final AuthController authController = Get.find<AuthController>();
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const CustomAuthHeader(title: 'Create account'),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),
//                     RichText(
//                       text: TextSpan(
//                         text: 'Already have an account? ',
//                         style: const TextStyle(color: Colors.black54, fontSize: 16),
//                         children: [
//                           TextSpan(
//                             text: 'Sign in',
//                             style: const TextStyle(
//                               color: Colors.purple,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 Get.back(); // Go back to login screen
//                               },
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     CustomTextFormField(
//                       controller: nameController,
//                       hintText: 'Name',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your name';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     CustomTextFormField(
//                       controller: emailController,
//                       hintText: 'Email',
//                       textInputType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         if (!GetUtils.isEmail(value)) {
//                           return 'Please enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     CustomTextFormField(
//                       controller: passwordController,
//                       hintText: 'Password',
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a password';
//                         }
//                         if (value.length < 6) {
//                           return 'Password must be at least 6 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 40),
//                     CustomButton(
//                       text: 'Sign Up',
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           authController.signUp(
//                             nameController.text,
//                             passwordController.text,
//                             emailController.text,
//                           );
//                           // Optionally navigate away after signup
//                           Get.to(() => const SignUpScreen(), preventDuplicates: false);
//                         }
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller/login_auth/login_screen_controller.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_authheader.dart';
import '../widgets/textformfield_widgets.dart';
import 'homescreen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAuthHeader(title: 'Create Account ',),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(color: Colors.black54, fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'login',
                            style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.back(); // Navigate back to login
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
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authController.signUp(
                            nameController.text,
                            passwordController.text,
                            emailController.text,
                          );
                          print("SignUp function called");
                          Get.offAll(() => HomeScreen());

                        }
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
