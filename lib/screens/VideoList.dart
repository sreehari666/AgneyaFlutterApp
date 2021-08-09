import 'package:aagneya_flutter_app/screens/DetailsVideoPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:aagneya_flutter_app/utilities/Url.dart';



class VideoListScreen extends StatelessWidget {
  Future<List<Video_>> getLinks() async {
    Dio dio = new Dio();
    List<Video_> _links = [];

    String _link;

    var usr;
    var user1;
    var res;
    

    res = await dio.get(URL+"/app-get-youtube-links");

    print(res.data);
    var myList= res.data;
    for (var i=0;i<myList.length/2;i++){
      var temp = myList[i];
        myList[i] = myList[myList.length-1-i];
        myList[myList.length-1-i] = temp;
    }

    var i = 0;
    do {

      print(res.data[i]);
      usr = myList[i];
      _link = usr["ytlink"];

      String embedUrl = "https://www.youtube.com/oembed?url=$_link&format=json";

      var resDetails = await dio.get(embedUrl);

      print(resDetails);

      print(resDetails.data["title"]);

      var title_=resDetails.data["title"];


      String video_Id = _link.substring(_link.length - 11);
      print(video_Id);

      Video_ linkObj = Video_(_link, title_, video_Id);

      _links.add(linkObj);

      i = i + 1;
      if (res.data.length == i) {
        user1 = _links;
        break;
      }
    } while (myList[i] != null);

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
          'Watch Events',
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
              future: getLinks(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(
                      child: Center(child: CircularProgressIndicator(color: Color(0xFFFF9800))));
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var videoid = snapshot.data[index].video_Id;
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsVideoPage(snapshot.data[index].link)));
                          },
                      child: 
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          padding: EdgeInsets.all(10.0),
                          height: 140.0,
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
                              Image(
                                width: 150.0,
                                image: NetworkImage(
                                    'https://img.youtube.com/vi/$videoid/0.jpg'),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: new SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child:Text(
                                  snapshot.data[index].title,
                                  
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                ),
                                )
                                
                              ),
                            ],
                          ),
                        )
                        );
                        
                      });
                }
              })),
    );
  }
}

class Video_ {
  final String link;
  final String title;
  final String video_Id;

  Video_(
    this.link,
    this.title,
    this.video_Id,
  );
}
