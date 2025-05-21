import 'dart:io';

import 'package:employeee/Controller/Login_Controller.dart';
import 'package:employeee/Model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:image_picker/image_picker.dart';
import 'SideBarWidget.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
XFile? imageFile;
class _ProfileState extends State<Profile> {
  LoginController data = Get.put(LoginController());
  final _controller = SidebarXController(selectedIndex: 0,extended: false);
  UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    double size=MediaQuery.of(context).size.width;
    String _name = "${data.logInModel?.userModel.first_name}";
    String _email = "${data.logInModel?.userModel.email}";
    String _number="${data.logInModel?.userModel.number}";
    ScreenUtil.init(context);
    double width = MediaQuery.of(context).size.width;

    final isSmallScreen = width < 600 ;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: Stack(
          children: [
            Positioned(child: CircleAvatar(
              radius:MediaQuery.of(context).size.width*0.5, backgroundColor: Color(0xFFF0F8FF),),
              right: 200,
              top: -70,),
            Positioned(child: CircleAvatar(
              radius: MediaQuery.of(context).size.width*0.4, backgroundColor: Color(0xFFFFF0DA),),
              left: 250,
              bottom: -30,),
            ListView.builder(
              padding: EdgeInsets.all(30),
              itemCount: 1,
              itemBuilder: (context, i) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setHeight(350).toDouble(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          InkWell(
                            onTap: () {
                              //_showImagePicker();
                            },
                            child: CircleAvatar(
                              radius: ScreenUtil().setWidth(100).toDouble(),
                              backgroundColor: Colors.grey,
                              child: (imageFile!=null)?Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 2,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(200.0),
                                  border: Border.all(width: 8, color: Colors.black12),
                                  image :DecorationImage(image: Image.file(File(imageFile!.path)).image),
                                ),
                              ): Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width /1.2,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(200.0),
                                    border: Border.all(width: 8, color: Colors.black12)
                                ),
                                child: const Text(
                                  '', style: TextStyle(fontSize: 26),),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(20).toDouble()),
                          Text(
                            _name,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(24).toDouble(),
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: ScreenUtil().setHeight(10).toDouble()),
                          Text(
                            _email,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14).toDouble(),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(10).toDouble()),
                          Text(
                            _number.toString(),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14).toDouble(),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10).toDouble()),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20).toDouble(),
                        vertical: ScreenUtil().setHeight(10).toDouble(),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                           /*   Text(
                                'Department',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(18).toDouble(),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),*/
                              SizedBox(height: ScreenUtil()
                                  .setHeight(15)
                                  .toDouble()),
                              /*Text(
                                _department.toString(),
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14).toDouble(),
                                  color: Color(0xFF014380),
                                ),
                              ),*/
                            ],
                          ),
                          /*Column(
                            children: <Widget>[
                              Text(
                                'Job Title',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(18).toDouble(),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                              SizedBox(height: ScreenUtil()
                                  .setHeight(15)
                                  .toDouble()),
                              Text(
                                _jobtitle.toString(),
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14).toDouble(),
                                  color: Color(0xFF014380),
                                ),
                              ),
                            ],
                          ),*/

                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(50).toDouble()),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(80).toDouble(),
                        vertical: ScreenUtil().setHeight(10).toDouble(),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Edit Profile'),
                            onTap: () {
_showImagePicker();                              // Do something
                            },
                          ),

                          ListTile(
                            leading: Icon(Icons.logout),
                            title: Text('Logout'),
                            onTap: () {
                              // Do something
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );},

            ),
          ],
        )


    );
  }
  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () async {
                  getImage(source: ImageSource.camera);
                  // Do something
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () async {
getImage(source: ImageSource.gallery);                  // Do something
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void getImage({required ImageSource source})async{
    final file = await ImagePicker().pickImage(source: source);
    if(file?.path !=null){
      setState(() {
        imageFile = XFile(file!.path);
      });
    }
  }
}
