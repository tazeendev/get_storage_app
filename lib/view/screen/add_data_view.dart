import 'package:flutter/material.dart';
import 'package:get_storage_app/services/user_stored_data/user_stored_data.dart';
import 'package:get_storage_app/view/screen/remove_data_view.dart';
class AddDataView extends StatefulWidget {
   AddDataView({super.key});

  @override
  State<AddDataView> createState() => _AddDataViewState();
}

class _AddDataViewState extends State<AddDataView> {
  TextEditingController userController=TextEditingController();

  TextEditingController emailController=TextEditingController();

  TextEditingController passwordController=TextEditingController();

  final  UserStoredData userData=UserStoredData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Add Data',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23,color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 50,
              child: TextFormField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'enter the username'
                ),
              ),
            ),
          ),

          Container(
            height: 50,
            width: 300,
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'enter the email'
              ),
            ),
          ),
SizedBox(height: 20,),
          Container(
            height: 50,
            width: 300,
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'enter the password'
              ),
            ),
          ),
          SizedBox(height: 35,),
          ElevatedButton(onPressed: ()async{
            if(userController.text.isEmpty&&emailController.text.isEmpty&&passwordController.text.isEmpty){
              await userData.addName(userController.text);
              await userData.addEmail(emailController.text);
              await userData.addPassword(passwordController.text);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RemoveDataView()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fill all fields',style: TextStyle(color: Colors.white),)));
             // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields")));
            }
          }, child:Text('login',style: TextStyle(color: Colors.blue),))
        ],

      ),
    );
  }
}
