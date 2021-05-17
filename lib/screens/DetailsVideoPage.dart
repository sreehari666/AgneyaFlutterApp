import 'package:aagneya_flutter_app/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsVideoPage extends StatelessWidget {
  final String link_;
  DetailsVideoPage(this.link_);

  @override
  Widget build(BuildContext context) {
    var vid_Id = YoutubePlayer.convertUrlToId(link_);
    print(vid_Id);

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: vid_Id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey[900],
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
      body: Center(
        child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
              progressColors: ProgressBarColors(handleColor:Colors.red,playedColor: Colors.red,backgroundColor: Colors.white),
            ),
            builder: (context, player) {
              return Column(
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) / 3.8,
                  ),
                  Center(
                    child: player,
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: (MediaQuery.of(context).size.width) / 2,
                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: () => {
                          AuthService().launchYouTubeURL(link_).then((val) {
                            print(val);
                          })
                        },
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.black,
                        child: Text(
                          'Watch on YouTube',
                          style: TextStyle(
                            color: Colors.red,
                            letterSpacing: 1.5,
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
