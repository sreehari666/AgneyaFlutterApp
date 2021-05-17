
import 'dart:io';

import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

String url_='http://192.168.43.50:2000/app-event-register/';
String _token=token;
bool isLoading=true;
final _key = UniqueKey();


final SecureStorage secureStorage = SecureStorage();

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  @override
  void initState() {

    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFFFF9800)),
        backgroundColor: Colors.grey[200],
      ),
      body:Stack(
        children: <Widget>[
            WebView(
            key: _key,
            initialUrl: url_+_token,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
           isLoading ? Center( child: CircularProgressIndicator(),)
                    : Stack(),
        ],
      )
      
      
      );
    
  }
}


