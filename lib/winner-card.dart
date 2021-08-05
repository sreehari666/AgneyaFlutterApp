import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:aagneya_flutter_app/utilities/Url.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WinnerScreen extends StatefulWidget {
  @override
  _WinnerScreenState createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  Future<List<Winner>> getWinners() async {
    Dio dio = new Dio();
    List<Winner> winners = [];

    String _name;
    String department;
    String semester;
    String winnerid;
    String assetN;
    String description;
    var usr;
    var user1;
    var res;
    res = await dio.get(URL + "/app-get-winner");
    var i = 0;
    do {
      print(res.data[i]);
      usr = res.data[i];
      print(usr['name']);

      _name = usr["name"];
      department = usr["department"];
      semester = usr["semester"];

      winnerid = usr["_id"];
      assetN = URL + "/winner-images/" + winnerid + ".jpg";
      description = usr["description"];
      Winner winnerObj = Winner(
          i.toString(), _name, department, semester, assetN, description);

      winners.add(winnerObj);

      i = i + 1;
      if (res.data.length == i) {
        user1 = winners;
        break;
      }
    } while (res.data[i] != null);

    print(user1);
    return user1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: getWinners(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Center(
                  heightFactor: 1.5,
                  child: Card(
                    shadowColor: Colors.grey,
                    child: Center(
                        child: Image.asset(
                      'assets/photoloading.gif',
                      height: 320,
                    )),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ));
            } else {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),

                //height: MediaQuery.of(context).size.height * 0.55,
                height: 407.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          color: Colors.grey[200],
                          child: Column(children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 407.0 / 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot.data[index].imgPath,
                                    placeholder: (context, url) {
                                      return Container(
                                          child: Image.asset(
                                        'assets/photoloading.gif',
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.topCenter,
                                      ));
                                    },
                                    errorWidget: (context, url, error) {
                                      return Container(
                                        child: Image.asset(
                                          'assets/default_person.jpg',
                                          fit: BoxFit.fitWidth,
                                          alignment: Alignment.topCenter,
                                        ),
                                      );
                                    },
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.topCenter,
                                  ),
                                )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              snapshot.data[index].name,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              snapshot.data[index].department +
                                  "  " +
                                  snapshot.data[index].semester,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontFamily: 'OpenSans',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 1.0,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                              child: Text(
                                snapshot.data[index].description,
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontFamily: 'OpenSans',
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.bold,
                                  
                                ),
                              ),
                            )
                          ]),
                        ),
                      );
                    }),
              );
            }
          },
        ),
      ),
    );
  }
}

class Winner {
  //final int id;
  final String id;
  final String name;
  final String department;
  final String semester;
  final String imgPath;
  final String description;

  Winner(this.id, this.name, this.department, this.semester, this.imgPath,
      this.description);
}
