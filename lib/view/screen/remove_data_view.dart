import 'package:flutter/material.dart';
import 'package:get_storage_app/services/user_stored_data/user_stored_data.dart';
import 'package:get_storage_app/view/screen/add_data_view.dart';
class RemoveDataView extends StatefulWidget {
  const RemoveDataView({super.key});

  @override
  State<RemoveDataView> createState() => _RemoveDataViewState();
}

class _RemoveDataViewState extends State<RemoveDataView> {
  final UserStoredData userData=UserStoredData();
  String?name;
  String?emil;
  String?password;
  void initState(){
    super.initState();
    name=userData.getName();
    emil=userData.getEmail();
    password=userData.getPassword();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
Text("Name:${name??""}"),
          Text('Email"${emil??""}'),
        Text("Password:${password??""}"),
          ElevatedButton(onPressed: ()async{
           await userData.clearAll();
           Navigator.pushAndRemoveUntil(
             context,
             MaterialPageRoute(builder: (context) => AddDataView()),
                 (route) => false,
           );
          },
              child:Text('logout')),
        ],
      ),
    );
  }
}
