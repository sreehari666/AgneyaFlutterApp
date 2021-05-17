import 'package:aagneya_flutter_app/screens/DetailsVideoPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String url = "http://192.168.43.50:2000";

class VideoListScreen extends StatelessWidget {
  Future<List<Video_>> getLinks() async {
    Dio dio = new Dio();
    List<Video_> _links = [];

    String _link;

    var usr;
    var user1;
    var res;

    res = await dio.get("http://192.168.43.50:2000/app-get-youtube-links");
    var i = 0;
    do {
      print(res.data[i]);
      usr = res.data[i];
      _link = usr["ytlink"];

      var yt = YoutubeExplode();
      var video = await yt.videos.get(_link);

      print('Title: ${video.title}');
      var title_ = video.title;
      // Close the YoutubeExplode's http client.
      yt.close();

      String video_Id = _link.substring(_link.length - 11);

      Video_ linkObj = Video_(_link, title_, video_Id);

      _links.add(linkObj);

      i = i + 1;
      if (res.data.length == i) {
        user1 = _links;
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
                if (snapshot.data == null) {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
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
                                child: Text(
                                  snapshot.data[index].title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        );
                        

                        // return ListTile(
                        //   tileColor: Colors.grey[200],
                        //   leading: CircleAvatar(backgroundImage: NetworkImage('https://img.youtube.com/vi/$videoid/0.jpg'),),
                        //   title: Text(snapshot.data[index].title),
                        //   onTap: (){
                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsVideoPage(snapshot.data[index].link)));
                        //   },
                        // );
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
