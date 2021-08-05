import 'dart:io';
import 'package:aagneya_flutter_app/utilities/Url.dart';
import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String url_=URL+'/app-upload-entries/';

bool isLoading=true;
final _key = UniqueKey();


final SecureStorage secureStorage = SecureStorage();

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
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
      body:Stack(
        children: <Widget>[
           WebviewScaffold(
              url: url_+token,
              withJavascript: true,
              withLocalStorage: true,
              withZoom: false,
            )
        ],
      )
      
      
      );
    
  }
}


