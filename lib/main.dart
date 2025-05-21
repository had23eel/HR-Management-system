import 'package:employeee/Controller/Theme_service.dart';
import 'package:employeee/View/AdministratorLeave.dart';
import 'package:employeee/View/Allnotification.dart';
import 'package:employeee/View/CarRequest.dart';
import 'package:employeee/View/DeathLeave.dart';
import 'package:employeee/View/Home.dart';
import 'package:employeee/View/IslamPilgrimageLeave.dart';
import 'package:employeee/View/MaternityLeave.dart';
import 'package:employeee/View/MedicalLeave.dart';
import 'package:employeee/View/NotificationScreen.dart';
import 'package:employeee/View/Suggestions.dart';
import 'package:employeee/View/UnpaidLeave.dart';
import 'package:employeee/firebase_options.dart';
import 'package:employeee/methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Controller/Login_Controller.dart';
import 'View/ChristianPilgrimageLeave.dart';
import 'View/HourlyLeave.dart';
import 'View/Login.dart';
import 'View/Splash.dart';
import 'View/MarriedLeave.dart';
final navigatorkey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.instance.getToken().then((value) => _savefcm(value!));
  listtonotification();
  await GetStorage.init();
  runApp(const MyApp());
}
_savefcm(String token)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final key = 'tokenfcm';
  final value = token;
  prefs.setString(key, value);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return GetMaterialApp(
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      initialRoute: '/splash',
      navigatorKey: navigatorkey,
      routes: {
        '/login': (context)=>Login(),
        '/splash':(context)=>Splash(),
        '/homepage':(context)=>HomePage(),
        '/carrequest':(context)=>CarRequest(),
        '/medicalleave':(context)=>MedicalLeave(),
        '/hourlyleave':(context)=>HourlyLeave(),
        '/deathleave':(context)=>DeathLeave(),
        '/administratorleave':(context)=>AdministratorLeave(),
        '/unpaiedleave':(context)=>UnpaiedLeave(),
        '/christianpilgrimageleave':(context)=>ChristianPilgrimageLeave(),
        '/islampilgrimageleave':(context)=>IslamPilgrimageLeave(),
        '/marriedleave':(context)=>UnjustLeave(),
        '/maternityleave':(context)=>MaternityLeave(),
        '/allnotification':(context)=>AllNotification(),
        NotificationScreen.route:(context)=> NotificationScreen(messagetitle: '', messagebody: '',)





        //'/camerapage':(context)=>CameraPage()
      },

      // home:MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (BuildContext context)=>MenuController())
      //   ],
      //
      // ),
    );
  }
}
