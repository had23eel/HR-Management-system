

import 'package:employeee/Controller/Compliant_Controller.dart';
import 'package:employeee/Controller/Logout_Controller.dart';
import 'package:employeee/Controller/SuggsetionsController.dart';
import 'package:employeee/Controller/Theme_service.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:employeee/View/Home.dart';
class SideBarWidget extends StatelessWidget {
  const SideBarWidget({Key? key, required SidebarXController controller}) :_controller=controller, super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {

    final reasoncontroller = TextEditingController();
    final _formfield = GlobalKey<FormState>();
    return SidebarX(

        controller: _controller,
        theme:  SidebarXTheme(

        decoration: BoxDecoration(

        color: ThemeService().isSavedDarkMode()?Color(0xFF0e2433):Color(0xFF014380),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),)
    ),
          iconTheme: IconThemeData(
            color:ThemeService().isSavedDarkMode()?Colors.blue.shade600: Color(0xFF87CEEB)
          ),
          selectedIconTheme: IconThemeData(
            color: Colors.orange
          ),
          textStyle: TextStyle(color:Color(0xFF87CEEB)),
          selectedTextStyle: TextStyle(color: Colors.orange),
    ),
      extendedTheme: SidebarXTheme(

        width: 175 ,

      ),

      footerDivider: Divider(color: Colors.white60,height: 1,),
      items: [

        SidebarXItem(icon: Icons.car_rental,label: "   Leave Request",onTap:(){
          Navigator.pushNamed(context, '/splash');
        } ),
        SidebarXItem(icon: Icons.car_crash,label: "   Car Request",onTap:(){
          Navigator.pushNamed(context, '/carrequest');
        }),
        SidebarXItem(icon: Icons.account_balance_wallet,label: "   All Leaves",onTap:(){
         showDialog(context: context, builder: (context)=> AlertDialog(
           title:Text('All Leaves') ,
           content: Container(
             height: MediaQuery.of(context).size.height/2,
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('What kind of leave you need ?'),
                   Divider(height: 1,),
                   TextButton(onPressed: (){
                     Navigator.pop(context);
                     Navigator.pushNamed(context, '/medicalleave');
                     },
                     child: Text('Medical Leave'),),
                   TextButton(onPressed: (

                       ){
                     Navigator.pop(context);
                     Navigator.pushNamed(context, '/hourlyleave');
                     },
                     child: Text('Hourly Leave'),),

                   TextButton(onPressed: (){
                     Navigator.pop(context);
                     Navigator.pushNamed(context, '/administratorleave');
                     },
                     child: Text('Administrative Leave'),),
                   TextButton(onPressed: (){Navigator.pop(context);
                     Navigator.pushNamed(context, '/deathleave');
                   }, child: Text('Death Leave'),),
                   TextButton(onPressed: (){
                     Navigator.pop(context);
                     Navigator.pushNamed(context, '/unpaiedleave');
                     }, child: Text('Unpaid Leave'),),
                   TextButton(onPressed: (){Navigator.pop(context);
                     Navigator.pushNamed(context, '/christianpilgrimageleave');
                     }, child: Text('Christian Pilgrimage Leave'),),
                   TextButton(onPressed: (){Navigator.pop(context);
                   Navigator.pushNamed(context, '/islampilgrimageleave');
                   }, child: Text('Islam pilgrimage Leave'),),
                   TextButton(onPressed: (){Navigator.pop(context);
                   Navigator.pushNamed(context, '/marriedleave');
                   }, child: Text('Married Leave'),),
                   TextButton(onPressed: (){Navigator.pop(context);
                   Navigator.pushNamed(context, '/maternityleave');
                   }, child: Text('maternity Leave'),),

                 ],
               ),
             ),
           ),
         ));
        }),
        SidebarXItem(icon: Icons.wifi,label: "   ADSL Request"),
        SidebarXItem(icon: Icons.settings_accessibility,label: "   Offer Suggestion", onTap: (){
          showDialog(context: context, builder: (context)=>AlertDialog(
actions: [
  TextButton(onPressed: (){
    if(_formfield.currentState!.validate())
    {  Suggestions_Controller sug = Suggestions_Controller();
    sug.Suggsetions(reasoncontroller.text);
      print("${reasoncontroller.text}");

    }

    }, child: Text('Add')),
  TextButton(onPressed: (){Navigator.pop(context);



            }, child: Text('Cancel'))

],
            title: Text('Add Suggestion'),
            content: Container(
              height: MediaQuery.of(context).size.height/3,
              child: Form(
                key: _formfield,
                child: Column(

                  children: [
                    TextFormField(
                      maxLines: 9,
                      keyboardType: TextInputType.emailAddress,
                      controller: reasoncontroller,
                      decoration: InputDecoration(
                          labelText: "Enter your Suggsetions",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.type_specimen),
                        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/3)
                      ),
                      validator: (value)
                      {

                        if(value!.isEmpty)
                        {
                          return"Fill with your Suggsetion";
                        }

                      },
                    ),

                  ],
                ),
              ),
            ),
          ));
        }),
        SidebarXItem(icon: Icons.announcement,label: "   Add A Complaint", onTap: (){
          showDialog(context: context, builder: (context)=>AlertDialog(
            actions: [
              TextButton(onPressed: (){
                if(_formfield.currentState!.validate())
                {
                  print("send to api");
                  Compliant_Controller comp = Compliant_Controller();
                  comp.Compliant(reasoncontroller.text);
                  print("${reasoncontroller.text}");
                }

              }, child: Text('Add')),
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))

            ],
            title: Text('Add Complaint'),
            content: Container(
              height: MediaQuery.of(context).size.height/3,
              child: Form(
                key: _formfield,
                child: Column(

                  children: [
                    TextFormField(
                      maxLines: 9,
                      keyboardType: TextInputType.emailAddress,
                      controller: reasoncontroller,
                      decoration: InputDecoration(
                          labelText: "Enter your Complaint",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.type_specimen),
                          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/3)
                      ),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return"Fill with your Compliant";
                        }

                      },
                    ),

                  ],
                ),
              ),
            ),
          ));
        }),

        SidebarXItem(icon: Icons.dark_mode ,label: "   Dark / Light Mode",
            onTap: (){
          ThemeService().changeTheme();
            }),
        SidebarXItem(icon: Icons.exit_to_app ,label: "   LogOut",
            onTap: (){
              LogOutController logout = new LogOutController();
              logout.logout();
              Navigator.of(context).pushNamed('/login');

            }),

      ],

    );
  }
}
