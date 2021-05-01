import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

final SecureStorage secureStorage = SecureStorage();

var percent = 50.0;

//var totalCSE,totalECE,totalMECH,totalCIVIL,totalEEE,percentCSE,percentECE,percentMECH,percentCIVIL,percentEEE;

List _score = [];

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  Future getScore() async {
    Dio dio = new Dio();

    var res = await dio.get("http://192.168.43.50:2000/app-get-score");
    print(res.data['totalCSE']);
    Score score = Score(
        res.data['totalCSE'],
        res.data['totalECE'],
        res.data['totalMECH'],
        res.data['totalCIVIL'],
        res.data['totalEEE'],
        res.data['percentCSE'],
        res.data['percentECE'],
        res.data['percentMECH'],
        res.data['percentCIVIL'],
        res.data['percentEEE']);
    _score.add(score);
    print(_score);
    
    return _score;
  }

  
  Widget _progressBarCSE() {
    return 
         FutureBuilder(
            future: getScore(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // var _percent=snapshot.data.percentCSE;
              
              if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.yellow),)));
              } else {
                print("snaps");
                var data = snapshot.data;
                var _percent = data[0].percentCSE;
                print(data[0].percentCSE);
                return RoundedProgressBar(
                  childLeft:
                      Text("$_percent%", style: TextStyle(color: Colors.white)),
                  childRight:
                      Text("CSE", style: TextStyle(color: Colors.blue)),
                  percent: data[0].percentCSE,
                  theme: RoundedProgressBarTheme.yellow,
                  borderRadius: BorderRadius.circular(24),
                );
              }
            });
  }

  Widget _progressBarECE() {
    return 
         FutureBuilder(
            future: getScore(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // var _percent=snapshot.data.percentCSE;
              
              if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.yellow),)));
              } else {
                print("snaps");
                var data = snapshot.data;
                var _percent = data[0].percentECE;
                print(data[0].percentECE);
                return RoundedProgressBar(
                  childLeft:
                      Text("$_percent%", style: TextStyle(color: Colors.white)),
                  childRight:
                      Text("ECE", style: TextStyle(color: Colors.blue)),
                  percent: data[0].percentECE,
                  theme: RoundedProgressBarTheme.yellow,
                  borderRadius: BorderRadius.circular(24),
                );
              }
            });
  }

  Widget _progressBarMECH() {
    return FutureBuilder(
            future: getScore(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // var _percent=snapshot.data.percentCSE;
              
              if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.yellow),)));
              } else {
                print("snaps");
                var data = snapshot.data;
                var _percent = data[0].percentMECH;
                print(data[0].percentMECH);
                return RoundedProgressBar(
                  childLeft:
                      Text("$_percent%", style: TextStyle(color: Colors.white)),
                  childRight:
                      Text("MECH", style: TextStyle(color: Colors.blue)),
                  percent: data[0].percentMECH,
                  theme: RoundedProgressBarTheme.yellow,
                  borderRadius: BorderRadius.circular(24),
                );
              }
            });
  }

  Widget _progressBarCIVIL() {
    
        return FutureBuilder(
            future: getScore(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
             
              if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.yellow),)));
              } else {
                print("snaps");
                var data = snapshot.data;
                var _percent = data[0].percentCIVIL;
                print(data[0].percentCIVIL);
                return RoundedProgressBar(
                  childLeft:
                      Text("$_percent%", style: TextStyle(color: Colors.white)),
                  childRight:
                      Text("CIVIL", style: TextStyle(color: Colors.blue)),
                  percent: data[0].percentCIVIL,
                  theme: RoundedProgressBarTheme.yellow,
                  borderRadius: BorderRadius.circular(24),
                );
              }
            });
  }

  Widget _progressBarEEE() {
    return Container(
        child: FutureBuilder(
            future: getScore(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              // var _percent=snapshot.data.percentCSE;
              
              if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.yellow),)));
              } else {
                 print("snaps");
                  var data =  snapshot.data;
                  var _percent = data[0].percentEEE;
                  print(data[0].percentEEE);
                return RoundedProgressBar(
                  childLeft:
                      Text("$_percent%", style: TextStyle(color: Colors.white)),
                  childRight:
                      Text("EEE", style: TextStyle(color: Colors.blue)),
                  percent: data[0].percentEEE,
                  theme: RoundedProgressBarTheme.yellow,
                  borderRadius: BorderRadius.circular(24),
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
                
                    FutureBuilder(

                        future: getScore(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                              print(snapshot.data);
                          if (snapshot.data == null) {
                            return Container(
                                child:
                                    Center(child: CircularProgressIndicator()));
                          } else {
                            var _data=snapshot.data;
                            var csePoint=_data[0].totalCSE;
                            var ecePoint=_data[0].totalECE;
                            var mechPoint=_data[0].totalMECH;
                            var civilPoint=_data[0].totalCIVIL;
                            var eeePoint=_data[0].totalEEE;
                            
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
                                    Text(
                                      'Score Updates',
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                        fontFamily: 'OpenSans',
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    _progressBarCSE(),
                                    SizedBox(height: 30.0),
                                    _progressBarECE(),
                                    SizedBox(height: 30.0),
                                    _progressBarMECH(),
                                    SizedBox(height: 30.0),
                                    _progressBarCIVIL(),
                                    SizedBox(height: 30.0),
                                    _progressBarEEE(),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Container(
                                      child: Text("CSE $csePoint points",
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                        fontFamily: 'OpenSans',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      child: Text("ECE $ecePoint points",
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                        fontFamily: 'OpenSans',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      child: Text("MECH $mechPoint points",
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                        fontFamily: 'OpenSans',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      child: Text("CIVIL $civilPoint points",
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                        fontFamily: 'OpenSans',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      child: Text("EEE $eeePoint points",
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                        fontFamily: 'OpenSans',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        })
            
            
              ],
            )));
  }
}

class Score {
  var percentCSE;
  var percentECE;
  var percentMECH;
  var percentCIVIL;
  var percentEEE;

  var totalCSE;
  var totalECE;
  var totalMECH;
  var totalCIVIL;
  var totalEEE;

  Score(
      this.totalCSE,
      this.totalECE,
      this.totalMECH,
      this.totalCIVIL,
      this.totalEEE,
      this.percentCSE,
      this.percentECE,
      this.percentMECH,
      this.percentCIVIL,
      this.percentEEE);
}
