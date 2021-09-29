import 'dart:io';
import 'package:aagneya_flutter_app/utilities/Url.dart';
import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:flutter/material.dart';


String url_ = URL + '/app-upload-entries/';



final SecureStorage secureStorage = SecureStorage();

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

Future<List<Data_>> getData() async {
  List<Data_> list_ = [];

  list_.add(
      Data_("Thiruvathira jfndjcn chdjc  cdbchbjhdbcdbccdbdbhjhdhc", "yes"));
  list_.add(Data_("Classical music", "no"));
  list_.add(Data_("Pencil drawing", "yes"));

  return list_;
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFFFF9800)),
        backgroundColor: Colors.grey[200],
      ),
      body: Center(
          child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.grey[350],
        child: Container(
            height: 500,
            width: 300,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            //decoration: BoxDecoration(borderRadius: BorderRadiusGeometry()),
            child: FutureBuilder(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot.data);
                  if (snapshot.data == null) {
                    return Container(
                        child: Center(
                            child: CircularProgressIndicator(
                                color: Color(0xFFFF9800))));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: Colors.white,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              padding: EdgeInsets.all(10.0),
                              height: 82.0,
                              child: Column(
                              
                                children: <Widget>[
                                  Row(
                                    
                                    children: [
                                      Flexible(
                                        child: Text(
                                          snapshot.data[index].itemname,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ),

                                     
                                      snapshot.data[index].status == "yes"
                                          ? TextButton(
                                              onPressed: () {print("select file");},
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                elevation: 20,
                                                shadowColor: Colors.black,
                                                color: Colors.orange,
                                                child: Container(
                                                  padding: EdgeInsets.all(10.0),
                                                 
                                                  child: Text(
                                                    'Select file',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                          : Container(padding: EdgeInsets.all(10.0),child: Text(" ")),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                })),
      )),
    );
  }
}

class Data_ {
  late final String itemname;
  late final String status;
  Data_(this.itemname, this.status);
}
