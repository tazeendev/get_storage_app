// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class AuthController extends GetxController {
//   final box = GetStorage();
//

//   static const String keyUsername = 'username';
//   static const String keyEmail = 'userEmail';
//   static const String keyPassword = 'userPassword';
//   void saveUser(String name, String userEmail, String userPassword) {
//     box.write(keyUsername, name);
//     box.write(keyEmail, userEmail);
//     box.write(keyPassword, userPassword);
//
//     username.value = name;
//     email.value = userEmail;
//     password.value = userPassword;
//   }
//
//   void loadData() {
//     username.value = box.read(keyUsername) ?? "";
//     email.value = box.read(keyEmail) ?? "";
//     password.value = box.read(keyPassword) ?? "";
//   }
//
//   void logOut() {
//     box.erase();
//     username.value = "";
//     email.value = "";
//     password.value = "";
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  // Keys for storage
  static const String keyUsername = 'username';
  static const String keyPassword = 'password';
  static const String keyLoggedIn = 'isLoggedIn';
  static const String keyUserList = 'userlist';
  static const String keyEmail = 'email';

  // void signUp(String username, String password, String email) {
  //   box.write(keyUsername, username);
  //   box.write(keyEmail, email);
  //   box.write(keyPassword, password);
  //
  //   // Save username in user list for suggestions
  //   List<String> users = box.read(keyUserList) ?? [];
  //   if (!users.contains(username)) {
  //     users.add(username);
  //     box.write(keyUserList, users);
  //   }
  //   Get.snackbar("Success", "Account created successfully!");
  // }
  void signUp(String name, String pass, String mail) {
    List<String> users = (box.read('users') ?? []).cast<String>();

    // Add the new user
    users.add(name);

    // Save updated list
    box.write('users', users);

    // Save other details
    box.write('username', name);
    box.write('password', pass);
    box.write('email', mail);
    box.write('isLoggedIn', true);

    username.value = name;
    password.value = pass;
    email.value = mail;

    Get.snackbar("Success", "Account created successfully!");
  }

  void login(String username, String password, String email) {
    String? savedUsername = box.read(keyUsername);
    String? savedPassword = box.read(keyPassword);
    String? savedEmail = box.read(keyEmail);

    if (username == savedUsername && password == savedPassword && email == savedEmail) {
      box.write(keyLoggedIn, true);
      Get.snackbar('Welcome', 'Login successfully');
    } else {
      Get.snackbar('Error', 'Invalid credentials');
    }
  }
  void updatePassword(String newPassword) {
    if (box.hasData(keyPassword)) {
      box.write(keyPassword, newPassword);
      Get.snackbar('Update Password', 'Password changed successfully');
    }
  }
  void logout() {
    box.write(keyLoggedIn, false);
    Get.snackbar('Logout', 'You have been logged out');
  }
  }

