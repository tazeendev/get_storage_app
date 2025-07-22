import 'package:flutter/material.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
Container(
  height:screenHeight*1 ,
  width: screenWidth*1,
  decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage('assets/images/sweet.jpg'),fit: BoxFit.cover),
  ),
),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('')
                    ],
                  )
                ],
              ),
            )],
          )
        ],
      ),
    );
  }
}
