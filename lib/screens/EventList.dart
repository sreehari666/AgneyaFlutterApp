
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';



class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  
  Future<List<User>> getUsers() async {
    Dio dio = new Dio();
    List<User> users = [];
    String eventname;
    String date;
    String time;
    var usr;
    var user1;
    var res;
    res = await dio.get("http://192.168.43.50:2000/app-getAllEvents");
    var i=0;
    do {
      print(res.data[i]);
      usr=res.data[i];
      print(usr['eventname']);
      eventname=usr["eventname"];
      date =usr["date"];
      time =usr["time"];
    
      User user =  User(eventname,date,time);
      
      users.add(user);
      
      i=i+1;
      if(res.data.length==i){
        user1=users;
        break;
      }
      
      
    }while(res.data[i]!=null);
    
    print(user1);
    return user1;
  }



    @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      
      body: Container(
          child: FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              print(snapshot.data);
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(

                    )
                  )
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int id ) {
                    return ListTile(
                      leading: CircleAvatar(
                        
                        backgroundImage: NetworkImage(
                          "https://english.mathrubhumi.com/polopoly_fs/1.1450009.1485010942!/image/image.jpg_gen/derivatives/landscape_728_450/image.jpg",
                        ),
                      ),
                      trailing: Text(snapshot.data[id].time),
                      title: Text(snapshot.data[id].eventname),
                      subtitle: Text(snapshot.data[id].date),
                      
                      
                      onTap: (){

                        // Navigator.push(context, 
                        //   new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                        // );

                      },
                    );
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
  final String eventname;
  final String date;
  final String time;

  User(this.eventname, this.date, this.time);

}