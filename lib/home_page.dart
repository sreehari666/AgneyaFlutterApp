

import 'package:aagneya_flutter_app/services/authservices.dart';
import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:aagneya_flutter_app/sliding_cards.dart';

import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:dio/dio.dart';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



final SecureStorage secureStorage = SecureStorage();

String finalLoggedin;
List<ListItem> _dropdownItem1 = [];
//ListItem _selectedItem1;
class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();


   
}



   

  Future<List<ListItem>> getList() async {
    Dio dio = new Dio();
    
    String itemname;
    
    var usr;
    
    var res;
    
    res = await dio.get("http://192.168.43.50:2000/admin/app-get-item-list");
    //var respon=res.data;
    
    int i = 0;
    do {
      //print(res.data[i]);
      usr = res.data[i];
      //print(usr['itemname']);
      itemname = usr["itemname"];
      //print(itemname);
      //
      int j=i+1;
      //
      ListItem item = ListItem(j, itemname);
      // print(i);print(res.data[0]);print(res.data[0]);
      // print(item.name);
      _dropdownItem1.add(item);

      i = i + 1;
      if (res.data.length == i) {
        _dropdownItem1 = _dropdownItem1;
        void initState() {
    initState();
    
    _dropdownMenuItem1 = buildDropDownMenuItem1(_dropdownItem1);
    _selectedItem1 = _dropdownMenuItem1[0].value;
   
  }
        print(_dropdownItem1);
        break;
      }
      
    } while (res.data[i] != null);

    
    print('items');
    print(_dropdownItem1);
    return _dropdownItem1;
  }

  void initState() {
    initState();
    
    _dropdownMenuItem1 = buildDropDownMenuItem1(_dropdownItem1);
    _selectedItem1 = _dropdownMenuItem1[0].value;
   
  }


  List<DropdownMenuItem<ListItem>> _dropdownMenuItem1;
  ListItem _selectedItem1;

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItem1(List listItems1) {
    List<DropdownMenuItem<ListItem>> items1 = List();
    for (ListItem listItem1 in listItems1) {
      items1.add(
        DropdownMenuItem(
          child: Text(listItem1.name),
          value: listItem1,
        ),
      );
    }
    return items1;
  }


class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {

    getList();
    // secureStorage.readSecureData('loggedin').then((value){
    //  finalLoggedin = value;
    // });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                Header(),
                SizedBox(height: 40),
                Tabs(),
                SizedBox(height: 20),
                SlidingCardsView(),
                 SizedBox(height: 35),
                 EventBtn(),

                
              ],
            ),
          ),
        
          //ScrollableExhibitionSheet(),
          //ExhibitionBottomSheet(), //use this or ScrollableExhibitionSheet
        ],
      ),
    );
  }
}

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();


}


class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    secureStorage.readSecureData('loggedin').then((value){
     finalLoggedin = value;
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'IES Art Fest',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
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