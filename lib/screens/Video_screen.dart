// import 'package:aagneya_flutter_app/services/authservices.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// String url = "http://192.168.43.50:2000";

// class VideoScreen extends StatefulWidget {
//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   Future<List<Video_>> getLinks() async {
//     Dio dio = new Dio();
//     List<Video_> _links = [];

//     String _link;

//     var usr;
//     var user1;
//     var res;
//     res = await dio.get("http://192.168.43.50:2000/app-get-youtube-links");
//     var i = 0;
//     do {
//       print(res.data[i]);
//       usr = res.data[i];

//       _link = usr["ytlink"];

//       Video_ linkObj = Video_(_link);

//       _links.add(linkObj);

//       i = i + 1;
//       if (res.data.length == i) {
//         user1 = _links;
//         break;
//       }
//     } while (res.data[i] != null);

//     print(user1);
//     return user1;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[800],
//         appBar: AppBar(
//           shadowColor: Colors.black,
//           iconTheme: IconThemeData(color: Color(0xFFFF9800)),
//           backgroundColor: Colors.grey[200],
//           title: Text(
//             'Watch Events',
//             style: TextStyle(
//               color: Colors.grey[900],
//               fontFamily: 'OpenSans',
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: Container(
//           child: FutureBuilder(
//             future: getLinks(),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               String videoId;

//               print(snapshot.data);
//               if (snapshot.data == null) {
//                 return Container(
//                     child: Center(child: CircularProgressIndicator()));
//               } else {
//                 return Container(
//                   padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
//                   height: MediaQuery.of(context).size.height,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (context, index) {
//                         videoId = YoutubePlayer.convertUrlToId(
//                             snapshot.data[index].link);
//                         print(videoId);

//                         YoutubePlayerController _controller =
//                             YoutubePlayerController(
//                           initialVideoId: videoId,
//                           flags: YoutubePlayerFlags(
//                             autoPlay: false,
//                             mute: false,
                            
//                           ),
//                         );

//                         return Container(
//                           width: MediaQuery.of(context).size.width,
//                           child: Card(
//                             // shape: RoundedRectangleBorder(
//                             //     borderRadius: BorderRadius.circular(32)),
//                             color: Colors.grey[900],
//                             child: YoutubePlayerBuilder(
//                                 player: YoutubePlayer(
//                                   controller: _controller,
//                                   showVideoProgressIndicator: true,
//                                   progressIndicatorColor: Colors.blueAccent,
                                  
//                                 ),
//                                 builder: (context, player) {
//                                   return Column(
//                                     children: [
//                                       SizedBox(
//                                         height: (MediaQuery.of(context)
//                                                 .size
//                                                 .height) /
//                                             3.8,
//                                       ),
//                                       Center(
//                                         child: player,
//                                       ),
//                                       Center(
//                                       child:
//                                       Container(
//                                         padding: EdgeInsets.symmetric(
//                                             vertical: 25.0),
//                                         width: (MediaQuery.of(context).size.width)/2,
//                                         child: RaisedButton(
//                                           elevation: 5.0,
//                                           onPressed: () => {
//                                             AuthService().launchYouTubeURL(snapshot.data[index].link).then((val) {print(val);})
//                                           },
//                                           padding: EdgeInsets.all(15.0),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(30.0),
//                                           ),
//                                           color: Colors.black,

//                                           child: Text(
//                                             'Watch on YouTube',
                                            
//                                             style: TextStyle(
//                                               color: Colors.red,
//                                               letterSpacing: 1.5,
//                                               fontSize: 11.0,
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'OpenSans',
//                                             ),
//                                           ),
                                          
//                                         ),
//                                       ),)
                                      
//                                     ],
//                                   );
//                                 }),
                            
//                           ),
//                         );
//                       }),
//                 );
//               }
//             },
//           ),
//         ));
//   }
// }

// class Video_ {
//   final String link;

//   Video_(
//     this.link,
//   );
// }
