import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aagneya_flutter_app/utilities/constants2.dart';

import 'package:aagneya_flutter_app/services/authservices.dart';

final SecureStorage secureStorage = SecureStorage();
String _name;

 
class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
   
  Future<User> getData() async {
    var resp;
    
     
    try {
      Response response =
          await Dio().post('http://192.168.43.50:2000/app-getUserData',
              data: {
                "token": token,
              },
              options: Options(contentType: Headers.formUrlEncodedContentType));

      resp = response;
    } catch (e) {
      print(e);
    }
    print(resp);
    User user = User(resp.data['name'], resp.data['email']);
    
    return user;
  }

   

  Widget _nameWidget() {
    
    print(_name);
    return Container(
        child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print('snapshot is here');
              print(snapshot.data);
              if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              } else {
                return Text(
                  snapshot.data.name,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontFamily: 'OpenSans',
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
            }));

  }

  Widget _emailWidget() {
    print(_name);
    
    return Container(
        child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print('snapshot is here');
              print(snapshot.data);
              if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              } else {
                return Text(
                  snapshot.data.email,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontFamily: 'OpenSans',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
            }));

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFAFAFA),
                    Color(0xFFF5F5F5),
                    Color(0xFFEEEEEE),
                    Color(0xFFE0E0E0),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
              child:FutureBuilder(
              future: getData(),
             builder: (BuildContext context, AsyncSnapshot snapshot) {
             if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              } else {
             return Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    _nameWidget(),
                    SizedBox(height: 10.0),
                    _emailWidget(),
                    SizedBox(height: 30.0),
                    // _buildNameTF(),
                    SizedBox(height: 30.0),
                    // _buildDepartment(),
                    SizedBox(height: 30.0),
                    // _buildItem1(),
                    // _buildItem2(),
                    // _buildItem3(),
                    SizedBox(
                      height: 30.0,
                    ),
                    // _buildRegisterBtn(),
                    //
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(HOME);
                          print("Routing to Home screen");
                          secureStorage
                              .deleteSecureData('loggedin')
                              .then((value) {
                            print(value);
                          });
                          secureStorage
                              .deleteSecureData('token')
                              .then((value) {
                            print(value);
                          });
                          token='';
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
            );
             }
            }
            )
            )
          ],
            )
            )
            );
      
        
   
    
  }
}

class User {
  String name;
  String email;
  User(this.name, this.email);
}
