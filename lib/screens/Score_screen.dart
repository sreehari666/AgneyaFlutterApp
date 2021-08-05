import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aagneya_flutter_app/utilities/Url.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

final SecureStorage secureStorage = SecureStorage();



//var totalCSE,totalECE,totalMECH,totalCIVIL,totalEEE,percentCSE,percentECE,percentMECH,percentCIVIL,percentEEE;

List _score = [];

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  Future getScore() async {
    Dio dio = new Dio();

    var res = await dio.get(URL+"/app-get-score");
    print(res.data);
    print(res.data["civilpoints"]);
    
    Score score = Score(
        res.data['civilpoints'].toDouble(),
        res.data['csepoints'].toDouble(),
        res.data['ecepoints'].toDouble(),
        res.data['eeepoints'].toDouble(),
        res.data['mechpoints'].toDouble(),
        res.data['civilpercent'].toDouble(),
        res.data['csepercent'].toDouble(),
        res.data['ecepercent'].toDouble(),
        res.data['eeepercent'].toDouble(),
        res.data['mechpercent'].toDouble());
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
                var _percent = data[0].percentCSE.toDouble();
                print(data[0].percentCSE);
                double percent_=data[0].percentCSE;
                print(percent_);
                return RoundedProgressBar(
                  childLeft:
                      Text("$_percent%", style: TextStyle(color: Colors.white)),
                  childRight:
                      Text("CSE", style: TextStyle(color: Colors.blue)),
                  percent: percent_,
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
                var _percent = data[0].percentECE.toDouble();
                print(data[0].percentECE);
                double percent_=data[0].percentECE;
                return RoundedProgressBar(
                  childLeft:
                      Text("$_percent%", style: TextStyle(color: Colors.white)),
                  childRight:
                      Text("ECE", style: TextStyle(color: Colors.blue)),
                  percent: percent_,
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
                var _percent = data[0].percentMECH.toDouble();
                print(data[0].percentMECH);
                double percent_=data[0].percentMECH;
                return RoundedProgressBar(
                  childLeft:
                      Text("$_percent%", style: TextStyle(color: Colors.white)),
                  childRight:
                      Text("MECH", style: TextStyle(color: Colors.blue)),
                  percent: percent_,
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
                var _percent = data[0].percentCIVIL.toDouble();
                print(data[0].percentCIVIL);
                double percent_=data[0].percentCIVIL;
                return RoundedProgressBar(
                  childLeft:
                      Text("$_percent%", style: TextStyle(color: Colors.white)),
                  childRight:
                      Text("CIVIL", style: TextStyle(color: Colors.blue)),
                  percent: percent_,
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
                  var _percent = data[0].percentEEE.toString();
                  print(data[0].percentEEE);
                  double percent_=data[0].percentEEE;
                return RoundedProgressBar(
                  childLeft:
                      Text("$_percent%", style: TextStyle(color: Colors.white)),
                  childRight:
                      Text("EEE", style: TextStyle(color: Colors.blue)),
                  percent: percent_,
                  theme: RoundedProgressBarTheme.yellow,
                  borderRadius: BorderRadius.circular(24),
                );
              }
            }));
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFFFF9800)),
        backgroundColor: Colors.grey[200],
        
      ),
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
                                    Center(child: CircularProgressIndicator(color: Color(0xFFFF9800))));
                          } else {
                            var _data=snapshot.data;
                            var csePoint=_data[0].totalCSE.toDouble();
                            var ecePoint=_data[0].totalECE.toDouble();
                            var mechPoint=_data[0].totalMECH.toDouble();
                            var civilPoint=_data[0].totalCIVIL.toDouble();
                            var eeePoint=_data[0].totalEEE.toDouble();
                            print("csepoints");
                            print(csePoint);
                            return Container(
                              height: double.infinity,
                              child: SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40.0,
                                  vertical: 40.0,
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
                                    
                                    _progressBarCIVIL(),
                                    SizedBox(height: 30.0),
                                    _progressBarCSE(),
                                    SizedBox(height: 30.0),
                                    _progressBarECE(),
                                    SizedBox(height: 30.0),
                                    _progressBarEEE(),
                                    SizedBox(height: 30.0),
                                    _progressBarMECH(),
                                    SizedBox(
                                      height: 30.0,
                                    ),
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
                                      child: Text("EEE $eeePoint points",
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
  double percentCSE;
  double percentECE;
  double percentMECH;
  double percentCIVIL;
  double percentEEE;

  double totalCSE;
  double totalECE;
  double totalMECH;
  double totalCIVIL;
  double totalEEE;

  Score(
      this.totalCIVIL,
      this.totalCSE,
      this.totalECE,
      this.totalEEE,
      this.totalMECH,
      
      this.percentCIVIL,
      this.percentCSE,
      this.percentECE,
      this.percentEEE,
      this.percentMECH,
      
      );
}
