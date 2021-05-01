

import 'package:aagneya_flutter_app/screens/nav-drawer.dart';
import 'package:aagneya_flutter_app/services/authservices.dart';
import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:aagneya_flutter_app/sliding_cards.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

final SecureStorage secureStorage = SecureStorage();

String finalLoggedin;
class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();

}



class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    secureStorage.readSecureData('loggedin').then((value){
     finalLoggedin = value;
    });

    return Scaffold(
       drawer: NavDrawer(),
       appBar: AppBar(
         shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFFFF9800)),
        backgroundColor: Colors.grey[200],
        title: Text(
        'Aagneya',
        style: GoogleFonts.dancingScript(
          textStyle: TextStyle(color: Colors.grey[600], fontSize: 24,fontWeight: FontWeight.w900,),
        ),
      ),
       ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Tabs(),
                SizedBox(height: 20),
                SlidingCardsView(),
                 SizedBox(height: 5),
                 EventBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}


class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          // child: ListView(

          children: <Widget>[
            Expanded(
                child: GestureDetector(
              onTap: () {
                //Navigator.of(context).pushNamed(SIGN_UP);
                secureStorage.readSecureData('token').then((value) {
                    AuthService().getUserData(value).then((val) async{
                    print(val);
                  });
                });
                
                print("Routing to Sign up screen");
              },
              child: Text(
                'Home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF616161),
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationThickness: 1.5,
                ),
              ),
            )),
            Expanded(
              child:GestureDetector(

              onTap: () {
                Navigator.of(context).pushNamed(SCORE);
              },  
              
              child: Text(
                'Scores',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF616161),
                ),
              ),
               )
            ),
            Expanded(
              
                child: GestureDetector(
              onTap: () {
                
               (finalLoggedin == 'ok')? Navigator.of(context).pushNamed(REGISTER):Navigator.of(context).pushNamed(SIGN_IN);
                print("Routing to Register screen");
                if(finalLoggedin != 'ok'){
                    Fluttertoast.showToast(
                    msg: "Please login to continue registeration ",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    //backgroundColor: Colors.green,
                    textColor: Colors.black,
                    fontSize: 16.0);
                }
                
              },
              child: Text(
                'Register',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF616161),
                ),
              ),
            )),
            
            Expanded(
              
                child: GestureDetector(
              onTap: () {
                (finalLoggedin == null)?Navigator.of(context).pushNamed(SIGN_IN):Navigator.of(context).pushNamed(ACCOUNT);
                
                print("Routing to login screen");
              },
              
              child:(finalLoggedin == null)?Text(
                'Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF616161),
                ),
                
              ):Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF616161),
                ),
              ),
            )),
       

          ],
        )
        );
  }
  

}
class EventBtn extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}
class _EventState extends State<EventBtn> {

@override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0,horizontal: 25.0),
      width: double.infinity,
      
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {
          Navigator.of(context).pushNamed(EVENT_SCREEN),
          
      
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Show Upcoming Events',
          style: TextStyle(
            color: Color(0xFFFF9800),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}