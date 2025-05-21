import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:employeee/Controller/Theme_service.dart';
import 'package:employeee/View/SideBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import 'Profile.dart';
import 'Request.dart';
import 'Suggestions.dart';
import 'Work.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = SidebarXController(selectedIndex: 0,extended: true);
  final _key = GlobalKey<ScaffoldState>();
  Widget currentScreen=Work();
final PageStorageBucket bucket = PageStorageBucket();
  int selectitem = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
   final List<Widget> screens = [
      Work(),
      Request(),
      Suggestions(),
      Profile(),

    ];
    return Builder(
      builder: (context) {
        final isSmallScreen = width < 600 ;

        return Scaffold(
          key: _key,

          appBar: isSmallScreen ? AppBar(
            leading: IconButton(
              onPressed: (){
                _key.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu),),
            actions: [
              IconButton(
                onPressed: (){
                  //notifications

                },
                icon: Icon(Icons.notifications),),
            ],
          ):null,

          drawer: SideBarWidget(controller: _controller),

          body:  PageStorage(
            bucket: bucket,
            child: currentScreen,
          ) ,
         bottomNavigationBar: CurvedNavigationBar(
           color: Color(0xFFef7d00),
           backgroundColor: ThemeService().isSavedDarkMode()?Colors.grey.shade900: Color(0xFFFFFFFF),
           height: 70,
           animationDuration: Duration(
             milliseconds: 100,
           ),
index: selectitem,

           items: [
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.home,size:30,color:  (selectitem==0)?Colors.white:Colors.white54),
                 Text("home",style: TextStyle(color:   (selectitem==0)?Colors.white:Colors.white54,fontSize:8,fontWeight: FontWeight.bold,),)
               ],
             ),
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.request_page_outlined,size:30,color:  (selectitem==1)?Colors.white:Colors.white54,),
                 Text("Requests",style: TextStyle(color:  (selectitem==1)?Colors.white:Colors.white54,fontSize:8,fontWeight: FontWeight.bold),)
               ],
             ),
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.settings_suggest_outlined,size:30,color: (selectitem==2)?Colors.white:Colors.white54,),
                 Text("Opinions",style: TextStyle(color:  (selectitem==2)?Colors.white:Colors.white54,fontSize:8,fontWeight: FontWeight.bold,),)
               ],
             ),
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.person,size:30,color: (selectitem==3)?Colors.white:Colors.white54,),
                 Text("Profile",style: TextStyle(color: (selectitem==3)?Colors.white:Colors.white54,fontSize:8,fontWeight: FontWeight.bold,),)
               ],
             ),
           ],
           onTap: (currentTab){
             if(currentTab==0){
               setState(() {
                 currentScreen= Work() ;
                 selectitem=currentTab;
               });}
             if(currentTab==1) {
               setState(() {
                 currentScreen = Request();
                 selectitem=currentTab;
               });
             }
             if(currentTab==2) {
               setState(() {
                 currentScreen = Suggestions();
                 selectitem = currentTab ;
               });
             }
             if(currentTab==3) {
               setState(() {
                 currentScreen = Profile();
                 selectitem = currentTab ;
                 print(selectitem);
               });
             }
           },
         ),
         /* bottomNavigationBar: Container(
           color: Colors.black,
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(),
              child: GNav(
                iconSize: MediaQuery.of(context).size.width <280?12:20,
                duration: Duration(milliseconds: 500),
                onTabChange: (index)
                {
                  setState(() {
                  _index=index;
                });
                  },
                backgroundColor: Colors.blue,
                color: Colors.white60,
                activeColor: Colors.deepOrange,
                tabBackgroundColor: Colors.lightBlueAccent,

                gap:0
                ,tabs: [
                  if(MediaQuery.of(context).size.width >365)
                GButton(icon: Icons.wallet,text:'Work',textStyle: TextStyle(fontSize: 10,color: Colors.deepOrange)),
                if(MediaQuery.of(context).size.width >365)
                  GButton(icon: Icons.real_estate_agent_outlined,text: 'suggsetions',textStyle: TextStyle(fontSize: 10,color: Colors.deepOrange)),
                if(MediaQuery.of(context).size.width >365)
                  GButton(icon: Icons.security_update_good,text: 'complanance',textStyle: TextStyle(fontSize: 10,color: Colors.deepOrange)),
                if(MediaQuery.of(context).size.width >365)
                  GButton(icon: Icons.person,text:'Profile',textStyle: TextStyle(fontSize: 10,color: Colors.deepOrange),),
                if(MediaQuery.of(context).size.width <365)
                  GButton(icon: Icons.wallet,textStyle: TextStyle(fontSize: 10,color: Colors.deepOrange)),
                if(MediaQuery.of(context).size.width <365)
                  GButton(icon: Icons.real_estate_agent_outlined,textStyle: TextStyle(fontSize: 10,color: Colors.deepOrange)),
                if(MediaQuery.of(context).size.width <365)
                  GButton(icon: Icons.security_update_good,textStyle: TextStyle(fontSize: 10,color: Colors.deepOrange)),
                if(MediaQuery.of(context).size.width <365)
                  GButton(icon: Icons.person,textStyle: TextStyle(fontSize: 10,color: Colors.deepOrange),),

              ],

              ),
            ),
          ),*/

        );
      }
    );
  }
}
/*
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab=0;
  final List<Widget> Screen=[
    Show(),
    Request(),
    Suggetion(),
    ProfilePage(),
  ];
  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=Show();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFFFFC26C),
        backgroundColor: Color(0xFFFFE0B5),
        height: 70,
        animationDuration: Duration(
          milliseconds: 100,
        ),
        items: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home,size:30,color: Colors.grey,),
              Text("home",style: TextStyle(fontSize:8,fontWeight: FontWeight.bold,),)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.request_page_outlined,size:30,color: Colors.grey,),
              Text("Requests",style: TextStyle(fontSize:8,fontWeight: FontWeight.bold),)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.settings_suggest_outlined,size:30,color:Colors.grey,),
              Text("Suggetion",style: TextStyle(fontSize:8,fontWeight: FontWeight.bold,),)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person,size:30,color: Colors.grey,),
              Text("Profile",style: TextStyle(fontSize:8,fontWeight: FontWeight.bold,),)
            ],
          ),
        ],
        onTap: (currentTab){
          if(currentTab==0){
            setState(() {
              currentScreen= Show() ;
            });}
          if(currentTab==1) {
            setState(() {
              currentScreen = Request();
            });
          }
          if(currentTab==2) {
            setState(() {
              currentScreen = Suggetion();
            });
          }
          if(currentTab==3) {
            setState(() {
              currentScreen = ProfilePage();
            });
          }
        },
      ),
    );
  }
}*/
