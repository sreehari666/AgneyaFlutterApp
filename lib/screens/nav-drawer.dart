import 'package:aagneya_flutter_app/services/authservices.dart';
import 'package:aagneya_flutter_app/utilities/constant3.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Aagneya',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/efe-kurnaz.jpg'))),
          ),
          ListTile(
            leading: Icon(
              Icons.photo,
              color: Color(0xFFFF9800),
            ),
            title: Text('Photo gallery'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.video_collection,
              color: Color(0xFFFF9800),
            ),
            title: Text('Watch videos'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xFFFF9800),
            ),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(
              Icons.border_color,
              color: Color(0xFFFF9800),
            ),
            title: Text('Feedback'),
            onTap: () => {AuthService().launchURL().then((val) {})},
          ),
          (finalLoggedIN == 'ok')?ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Color(0xFFFF9800),
            ),
            title: Text('Logout'),
            onTap: () => {
              Navigator.of(context).pushNamed(HOME),
              print("Routing to Home screen"),
              secureStorage.deleteSecureData('loggedin').then((value) {
                print(value);
              }),
              secureStorage.deleteSecureData('token').then((value) {
                print(value);
              }),
              secureStorage.deleteSecureData('email').then((value) {
                print(value);
              }),
              token = '',
              finalEmail = ' ',
              finalLoggedIN='no',
            },
          ):Text(" "),
        ],
      ),
    );
  }
}
