import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class AuthController extends GetxController
{
final box=GetStorage();
var username=''.obs;
var email=''.obs;
var password=''.obs;
void saveUser(String name,String userEmail,String userPassword){
  box.write('username', name);
  box.write('useremail', email);
  box.write('password', password);
  username.value=name;
  email.value=userEmail;
  password.value=userPassword;
}
void loadData(){
username.value=box.read('username')??"";
email.value=box.read('userEmail')??"";
password.value=box.read('userPassword')??"";
}
void LogOut(){
  box.erase();
  username.value;
  email.value;
  password.value;
}
}