import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aagneya_flutter_app/utilities/constant3.dart';
import 'package:aagneya_flutter_app/utilities/Url.dart';

import 'package:aagneya_flutter_app/services/authservices.dart';

final SecureStorage secureStorage = SecureStorage();
//String _name='';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Future<User> getData() async {
    var resp;

    try {
      Response response =
          await Dio().post(URL+'/app-getUserData',
              data: {
                "token": token,
              },
              options: Options(contentType: Headers.formUrlEncodedContentType));

      resp = response;
      print(resp);
    } catch (e) {
      print(e);
    }
    print(resp.data['name']);
    User user = User(
        resp.data['name'],
        resp.data['email'],
        resp.data['regno'],
        resp.data['department'],
        resp.data['semester'],
        resp.data['chessno'].toString(),
        resp.data['itemnames']);
    print(user);
    var user2 = user;
    return user2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          iconTheme: IconThemeData(color: Color(0xFFFF9800)),
          backgroundColor: Colors.grey[200],
          title: Text(
            'Account',
            style: TextStyle(
              color: Colors.grey[900],
              fontFamily: 'OpenSans',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
                    child: FutureBuilder(
                        future: getData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          print('snap');
                          print(snapshot.data);
                          // var _list = snapshot.data.itemnames;
                          if (snapshot.data == null) {
                            return Container(
                                child:
                                    Center(child: CircularProgressIndicator(color: Color(0xFFFF9800))));
                          } else {
                            print(snapshot.data);
                            var _list = snapshot.data.itemnames;
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
                                    Center(
                                      /** Card Widget **/
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                        elevation: 50,
                                        shadowColor: Colors.black,
                                        color: Colors.grey[350],
                                        child: SizedBox(
                                          width: double.infinity,
                                          //width: 300,
                                          height: 400,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  snapshot.data.name,
                                                  style: TextStyle(
                                                    color: Colors.grey[900],
                                                    fontFamily: 'OpenSans',
                                                    fontSize: 35.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                (snapshot.data.email != null)
                                                    ? Container(
                                                        child: Text(
                                                        snapshot.data.email,
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[900],
                                                          fontFamily:
                                                              'OpenSans',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ))
                                                    : Container(
                                                        child: Text(
                                                        "  ",
                                                      )),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                (snapshot.data.regno != null &&
                                                        snapshot.data
                                                                .department !=
                                                            null &&
                                                        snapshot.data
                                                                .semester !=
                                                            null &&
                                                        snapshot.data.chessno !=
                                                            null)
                                                    ? SizedBox(height: 1.0)
                                                    : Center(
                                                        child: Container(
                                                            child: Text(
                                                          "You are not registered for any events",
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[900],
                                                            fontFamily:
                                                                'OpenSans',
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )),
                                                      ),
                                                (snapshot.data.regno != null)
                                                    ? Container(
                                                        child: Text(
                                                        snapshot.data.regno,
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[900],
                                                          fontFamily:
                                                              'OpenSans',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ))
                                                    : Container(
                                                        child: Text(
                                                        "  ",
                                                      )),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                (snapshot.data.department !=
                                                            null &&
                                                        snapshot.data
                                                                .semester !=
                                                            null)
                                                    ? Container(
                                                        child: Text(
                                                        snapshot.data
                                                                .department +
                                                            "  " +
                                                            snapshot
                                                                .data.semester,
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[900],
                                                          fontFamily:
                                                              'OpenSans',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ))
                                                    : Container(
                                                        child: Text(
                                                        "  ",
                                                      )),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                (snapshot.data.chessno == null)
                                                    ? Container(
                                                        child: Text(
                                                        "  ",
                                                      ))
                                                    : Container(
                                                        child: Text(
                                                        "Your Chest No: " +
                                                            snapshot
                                                                .data.chessno,
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[900],
                                                          fontFamily:
                                                              'OpenSans',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                (snapshot.data.itemnames !=
                                                        null)
                                                    ? Container(
                                                        child: Text(
                                                        'Registered Items',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[900],
                                                          fontFamily:
                                                              'OpenSans',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ))
                                                    : Text(" "),
                                                SizedBox(height: 10.0),
                                                (snapshot.data.itemnames !=
                                                        null)
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: _list.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Center(
                                                              child: Text(
                                                            _list[index],
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .grey[900],
                                                              fontFamily:
                                                                  'OpenSans',
                                                              fontSize: 15.0,
                                                            ),
                                                          ));
                                                        },
                                                      )
                                                    : Container(
                                                        child: Text(
                                                        "  ",
                                                      )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    GestureDetector(
                                        onTap: () {
                                          AuthService().logout().then((value) {
                                            print(value);
                                          });
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
                                          secureStorage
                                              .deleteSecureData('email')
                                              .then((value) {
                                            print(value);
                                          });
                                          token = '';
                                          finalEmail = ' ';
                                          finalLoggedIN = 'no';
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
                        }))
              ],
            )));
  }
}

class User {
  String name;
  String email;
  String regno;
  String department;
  String semester;
  String chessno;
  List itemnames;
  User(this.name, this.email, this.regno, this.department, this.semester,
      this.chessno, this.itemnames);
}
