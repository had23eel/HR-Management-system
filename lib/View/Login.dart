import 'dart:ui';

import 'package:employeee/Controller/Login_Controller.dart';
import 'package:employeee/Controller/Theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController log = Get.put(LoginController());
   _Ontap(){
    log.login(emailController.text,passwordController.text);
    if(_formfield.currentState!.validate())
    {

      Navigator.pushNamed(context, '/homepage');
      print("send to api");
    }
  }

  final _formfield = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeService().isSavedDarkMode()? Colors.grey.shade500:CupertinoColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:50),
          child: Center(
            child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 25.0,
                        color: Colors.black38
                    )
                  ]
              ),
              child: Container(
                color: ThemeService().isSavedDarkMode()? Colors.grey.shade800:Colors.white,
                width: MediaQuery.of(context).size.width*0.9,
                
                child: Column(
                  children: [
                    Container(
                      color: ThemeService().isSavedDarkMode()? Colors.white:Colors.white,
                      width: MediaQuery.of(context).size.width,

                      child:Form(
                        key: _formfield,
                        child: Container(
                          decoration: BoxDecoration(
                            color:(ThemeService().isSavedDarkMode())? Colors.black54:Colors.orange.shade300,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF014380),
                                    borderRadius: BorderRadius.circular(0)
                                ),
                                height: MediaQuery.of(context).size.width,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(

                                    image: AssetImage('asset/loginshow.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),

                              ),//image-----------------------------------------------

                              Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                decoration: BoxDecoration(
                                  color: Color(0xFF014380),
                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))
                                ),
                                child: Center(
                                  child: Text('Login',
                                      style: TextStyle(
                                          fontSize:24 ,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)
                                  ),
                                ),
                              ),//login ----------------------------------------------
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('to login to your administrator account please enter your name and password',
                                    style: TextStyle(
                                        fontSize:16 ,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)
                                ),
                              ),
                              Text('User Name :',
                                  style: TextStyle(
                                      fontSize:20 ,
                                      fontWeight: FontWeight.normal,
                                  color: Colors.white)
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(color: Colors.white),
                                    fillColor: Colors.white,
                                      hintStyle: TextStyle(color: Colors.white),
                                      labelText: "Email",
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.email ,color: Colors.white)
                                  ),
                                  validator: (value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return"Enter Email";
                                    }
                                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}]+@scs+\.org+").hasMatch(value);
                                    if(!emailValid){
                                      return "this not type of an email : Name@scs.org";
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Password :',
                                  style: TextStyle(
                                      fontSize:20 ,
                                      fontWeight: FontWeight.normal,
                                  color: Colors.white)
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: passwordController,
                                  obscureText: passToggle,
                                  validator: (value)
                                  {
                                    if(value!.isEmpty){
                                      return "Enter Password";
                                    }
                                    else if(passwordController.text.length < 6)
                                    {
                                      return "Not Able To Password(less than 6)";
                                    }
                                  },
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    focusColor: Colors.white,
                                    fillColor: Colors.white,

                                      labelText: "Password",
                                      border: OutlineInputBorder(),
                                      prefixIconColor: Colors.white,
                                      labelStyle: TextStyle(color: Colors.white),
                                      prefixIcon: Icon(Icons.lock),
                                      suffix: InkWell(
                                        onTap: (){
                                          setState(() {
                                            passToggle = !passToggle;
                                          });
                                        },
                                        child: Icon(passToggle ? Icons.visibility:Icons.visibility_off,color: Colors.white,),
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 70),
                                child: InkWell(
                                  onTap: (){
_Ontap();
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF014380),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.arrow_forward_ios_rounded,size: 24,color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: Text('all the accounts right here provided by the administrator dashboard only'
                                  ,
                                  style: TextStyle(color: Colors.white),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ) ,
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
