


import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';

final SecureStorage secureStorage = SecureStorage();


class AuthService {
  String key = "@fdjjjJHDMNXZHHhVXGA899XBHHN^878(&?wshdhshGhghBVDD";
  // Response response;
  //var loggedIn=false;
  //final URL="http://192.168.43.50:2000";
  var response;
  Dio dio = new Dio();

  login(email, password) async {

    var res;
    print(email);
    print(password);
    secureStorage.writeSecureData('email', email);
    
    try {
      Response response = await dio.post('http://192.168.43.50:2000/app-student-login',
          data: {
            "key": key,
            "email": email,
            "password": password,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
          res=response;
          print(response.data['success']);
          
          print(response.data['token']);
          // var token = response.data['data'];
          if(response.statusCode==200){
            print(response.data['msg']);
          }
          

          if(response.data['success']==true){
            secureStorage.writeSecureData('loggedin', 'ok');
            secureStorage.writeSecureData('token', response.data['token']);
            secureStorage.readSecureData('token').then((value){
              token = value;
              });

          }else{
            secureStorage.writeSecureData('loggedin', 'no');
          }
          

          // if(response.data['success']==true){
          //   TOKEN=res.data['token'];
          //   LOGGEDIN=true;
          //   Fluttertoast.showToast(
          //   msg: "login success",
          //   toastLength: Toast.LENGTH_SHORT,
          //   gravity: ToastGravity.BOTTOM,
          //   backgroundColor: Colors.green,
          //   textColor: Colors.white,
          //   fontSize: 16.0);

          // }
          
    } catch(e){
      
    }
      
    // } on DioError catch (e) {
    //   Fluttertoast.showToast(
    //       msg: e.response.data['msg'],
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // }
    
    
   return res;
  }

  
  signup(name, email, password) async {
    var res;
    print(name);
    print(email);
    print(password);

    // secureStorage.writeSecureData('email', email);
    // secureStorage.writeSecureData('name', name);

    try {
      Response response =
          await dio.post('http://192.168.43.50:2000/app-student-signup',
              data: {
                "key": key,
                "name": name,
                "email": email,
                "password": password,
              },
              options: Options(contentType: Headers.formUrlEncodedContentType));

              res=response;
              if(response.statusCode==200){
                print(response);
              }
                if(response.data['successs']==false){
                  Fluttertoast.showToast(
                  msg: "You already have an account",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
                }

              if(response.data['success']==true){
            Fluttertoast.showToast(
            msg: "signup success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
          }
          if(response.data['success']==false){
            Fluttertoast.showToast(
            msg: "signup failed, something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
          }
         

      
      
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return res;
  }
  getEvent() async{
     var res;
    try{
      Response response = await Dio().get('http://192.168.43.50:2000/app-getAllEvents');
      //print(response.data[1]);
      res=response;

    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return res;
  }

  getUserData(var _token) async{
     var resp;
     
    try{
      
      Response response = await Dio().post('http://192.168.43.50:2000/app-getUserData',data:{
        "token":_token,
      },options: Options(contentType: Headers.formUrlEncodedContentType));
      
      resp=response;
      
    } catch(e){
      print(e);
    }
    print(resp);
    return resp;
  }
  
}
