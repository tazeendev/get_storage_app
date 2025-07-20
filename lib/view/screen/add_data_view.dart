import 'package:flutter/material.dart';
import 'package:get_storage_app/services/user_stored_data/user_stored_data.dart';
class AddDataView extends StatelessWidget {
   AddDataView({super.key});
  TextEditingController userController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final  UserStoredData userData=UserStoredData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: userController,
            decoration: InputDecoration(
              hintText: 'enter the username'
            ),
          ),

          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                hintText: 'enter the email'
            ),
          ),

          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
                hintText: 'enter the password'
            ),
          ),
          ElevatedButton(onPressed: ()async{
            if(userController!=null && emailController!=null &&passwordController!=null ||userController!=""
                "" &&emailController!=" " &&passwordController!=" "){
              await userData.addName(userController.text);
              await userData.addEmail(emailController.text);
              await userData.addPassword(passwordController.text);
            }
          }, child:Text('login'))
        ],

      ),
    );
  }
}
