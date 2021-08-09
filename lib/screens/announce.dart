import 'dart:io';
import 'package:aagneya_flutter_app/screens/pdf-view.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:aagneya_flutter_app/utilities/Url.dart';
import 'package:dio/dio.dart';

// import 'package:flowder/flowder.dart';
// import 'package:path_provider/path_provider.dart';

String url_ = URL + '/app-announce';

class AnnounceScreen extends StatefulWidget {
  @override
  _AnnounceScreenState createState() => _AnnounceScreenState();
}

class _AnnounceScreenState extends State<AnnounceScreen> {
  Future<List<Data_>> getList() async {
    Dio dio = new Dio();
    List<Data_> _list = [];

    String _id;
    String time;

    var usr;
    var user1;
    var res;

    res = await dio.get(url_);

    print(res.data);
    var myList = res.data;
    for (var i = 0; i < myList.length / 2; i++) {
      var temp = myList[i];
      myList[i] = myList[myList.length - 1 - i];
      myList[myList.length - 1 - i] = temp;
    }

    var i = 0;
    do {
      print(res.data[i]);
      usr = myList[i];
      _id = usr["_id"];
      time = usr["time"];

      Data_ Obj = Data_(_id, time);

      _list.add(Obj);

      i = i + 1;
      if (res.data.length == i) {
        user1 = _list;
        break;
      }
    } while (myList[i] != null);

    print(user1);
    return user1;
  }

  Future<File> getFile(String url) async {
    final file = await PDFApi.loadNetwork(url);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFFFF9800)),
        backgroundColor: Colors.grey[200],
        title: Text(
          'Announcements',
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
              future: getList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(
                      child: Center(
                          child: CircularProgressIndicator(
                              color: Color(0xFFFF9800))));
                } else {
                  print(snapshot.data);

                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var _id = snapshot.data[index].id;
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          padding: EdgeInsets.all(10.0),
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 1),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  snapshot.data[index].time,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),

                              SizedBox(width: 10.0),
                              FutureBuilder(
                                  future: getFile(
                                      URL + '/announce-data/' + _id + '.pdf'),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    print(snapshot.data);
                                    if (snapshot.data == null) {
                                      return Container(
                                          child: Center(
                                              child: CircularProgressIndicator(
                                                  color: Color(0xFFFF9800))));
                                    } else {
                                      return ElevatedButton(
                                        onPressed: () async {
                                          // final file = await PDFApi.loadNetwork(URL+'/announce-data/'+snapshot.data[index].id+'.pdf');
                                          // print(file);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfPage(snapshot.data)));
                                        },
                                        child: Text('View'),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFFF9800),
                                        ),
                                      );
                                    }
                                  })
                              // ElevatedButton(onPressed: () async{

                              //     final file = await PDFApi.loadNetwork(URL+'/announce-data/'+snapshot.data[index].id+'.pdf');
                              //     print(file);
                              //     Navigator.push(context, MaterialPageRoute(builder: (context) => PdfPage(file)));
                              // }, child: Text('View'))
                            ],
                          ),
                        );
                      });
                }
              })),
    );
  }
}

class Data_ {
  final String id;
  final String time;

  Data_(
    this.id,
    this.time,
  );
}
