import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
class UserStoredData {
static const String userId='userid';
static const String userName='username';
static const String userEmail='useremail';
static const String userPassword='userpassword';
final GetStorage storage=GetStorage();
Future<void>addId(int id)async{
  await storage.write(userId, id);
}
Future<void>addName(String name)async{
  await storage.write(userName, name);
}
Future<void>addEmail(String email)async{
  await storage.write(userEmail, email);
}
Future<void>addPassword(String password)async{
  await storage.write(userPassword, password);
}
Future<void>addToken(String token) async{
  return storage.write('token', token);
}
int?getId(){
  return storage.read(userId);
}
String?getName() {
  return storage.read(userName);
}
String?getEmail() {
  return storage.read(userEmail);
}
String? getPassword(){
  return storage.read(userPassword);
}
String?getToken() {
  return storage.read('token');
}
Future<void>removeId()async{
  await storage.remove(userId);
}
Future<void>removeName()async{
  await storage.remove(userName);
}
Future<void>removeEmail()async{
  await storage.remove(userEmail);
}
Future<void>removePassword()async{
  await storage.remove(userPassword);
}
Future<void>removeToken()async{
  await storage.remove('token');
}
Future<void> clearAll() async {
  await storage.erase();
}
}