import 'dart:ui';

import 'package:flutter/material.dart';

import '../main.dart';
import 'Login.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();

}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async
  {
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Center(

            child:
            Container(
              child: Image(image: AssetImage('asset/logo.jpg')
                , width:MediaQuery.of(context).size.width*0.7 ,),
            )
        ),
      ),
    );
  }
}
