import 'package:aagneya_flutter_app/screens/Account.dart';
import 'package:aagneya_flutter_app/screens/EventRegister.dart';
import 'package:aagneya_flutter_app/screens/Gallery.dart';
import 'package:aagneya_flutter_app/screens/Score_screen.dart';
import 'package:aagneya_flutter_app/screens/VideoList.dart';
//import 'package:aagneya_flutter_app/screens/Video_screen.dart';
import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:aagneya_flutter_app/winner-card.dart';
import 'package:flutter/material.dart';
import 'package:aagneya_flutter_app/home_page.dart';
import 'package:aagneya_flutter_app/screens/login_screen.dart';
import 'package:aagneya_flutter_app/screens/signin_screen.dart';
import 'package:aagneya_flutter_app/screens/EventList.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:aagneya_flutter_app/utilities/constant3.dart';
import 'dart:async';


// import 'package:animated_splash/animated_splash.dart';
final SecureStorage secureStorage = SecureStorage();

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    secureStorage.readSecureData('loggedin').then((value){
      print("value");
      print(value);
      finalLoggedIN = value;
    });
    secureStorage.readSecureData('token').then((value){
     token = value;
    });
    secureStorage.readSecureData('email').then((value){
     finalEmail= value;
    });
    return MaterialApp(
      title: 'Aagneya',
       theme: ThemeData(fontFamily: 'SF Pro Display'),
      debugShowCheckedModeBanner: false,
      //home: LoginScreen(),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        //SPLASH_SCREEN: (BuildContext context) =>  SplashScreen(),
        HOME:(BuildContext context) =>  HomePage(),
        SIGN_IN: (BuildContext context) =>  LoginScreen(),
        SIGN_UP: (BuildContext context) =>  SignupScreen(),
        REGISTER: (BuildContext context) =>  RegisterScreen(),
        EVENT_SCREEN: (BuildContext context) =>  EventScreen(),
        ACCOUNT:(BuildContext context) => AccountScreen(),
        SCORE:(BuildContext context) => ScoreScreen(),
        GALLERY:(BuildContext context) => GalleryPage(),
        //VIDEO_SCREEN:(BuildContext context) => VideoScreen(),
        WINNER_SCREEN:(BuildContext context) => WinnerScreen(),
        VIDEO_LIST_SCREEN:(BuildContext context) => VideoListScreen(),
      },
    );
    
  }

}
