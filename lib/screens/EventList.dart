import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:aagneya_flutter_app/utilities/Url.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  Future<List<User>> getUsers() async {
    Dio dio = new Dio();
    List<User> users = [];
    String id;
    String eventname;
    String date;
    String time;
    var usr;
    var user1;
    var res;
    
    res = await dio.get(URL+"/app-getAllEvents");
    var i = 0;
    do {
      print(res.data[i]);
      usr = res.data[i];
      print(usr['eventname']);
      id=usr["_id"];
      eventname = usr["eventname"];
      date = usr["date"];
      time = usr["time"];

      User user = User(id,eventname, date, time);

      users.add(user);

      i = i + 1;
      if (res.data.length == i) {
        user1 = users;
        break;
      }
    } while (res.data[i] != null);

    print(user1);
    return user1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFFFF9800)),
        backgroundColor: Colors.grey[200],
        title: Text(
          'Upcoming Events',
          style: TextStyle(
            color: Colors.grey[900],
            fontFamily: 'OpenSans',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(
                  child: Center(child: CircularProgressIndicator(color: Color(0xFFFF9800))));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int id) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.grey[350],
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                    height: 80,
                                    width:80,
                                    child: CachedNetworkImage(
                                    imageUrl: URL+"/event-images/"+snapshot.data[id].id+".jpg",
                                    placeholder: (context, url) {
                                      return Container(
                                        height: 100.0,
                                        width: 100.0,
                                          child: Image.asset(
                                        'assets/photoloading.gif',
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ));
                                    },
                                    errorWidget: (context, url, error) {
                                      return ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          'assets/nav-bar.jpg',
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      );
                                    },
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                   
                                  ),
                                    // child: Image(
                                    //   image: NetworkImage(
                                    //     URL+"/event-images/"+snapshot.data[id].id+".jpg",
                                    //   ),
                                    // )
                                    ),
                              ),
                            
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              snapshot.data[id].eventname,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontFamily: 'OpenSans',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              snapshot.data[id].date,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontFamily: 'OpenSans',
                                fontSize: 13.0,
                              ),
                            ),
                            Text(
                              snapshot.data[id].time,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontFamily: 'OpenSans',
                                fontSize: 13.0,
                              ),
                            )
                          ],
                        ), //Column
                      ), //Padding
                    ), //SizedBox
                  ); //Card

                },
              );
            }
          },
        ),
      ),
    );
  }
}

class User {
  //final int id;
  final String id;
  final String eventname;
  final String date;
  final String time;

  User(this.id,this.eventname, this.date, this.time);
}
