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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Read Data',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Center(child: Text("Name :${name??""}",style: TextStyle(color: Colors.blue,fontSize: 15),)),
          SizedBox(height: 20,),
          Text('Email :${emil??""}',style: TextStyle(color: Colors.blue,fontSize: 15),),
          SizedBox(height: 20,),
        Text("Password :${password??""}",style: TextStyle(color: Colors.blue,fontSize: 15),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async{
           await userData.clearAll();
           Navigator.pushAndRemoveUntil(
             context,
             MaterialPageRoute(builder: (context) => AddDataView()),
                 (route) => false,
           );
          },
              child:Text('logout',style: TextStyle(color: Colors.blue),)),
        ],
      ),
    );
  }
}
