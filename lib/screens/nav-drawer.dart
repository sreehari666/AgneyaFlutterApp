import 'package:aagneya_flutter_app/services/authservices.dart';
import 'package:aagneya_flutter_app/utilities/constant3.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Athene Arts',
            style: GoogleFonts.dancingScript(
             textStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    
                    image: AssetImage("assets/nav-bar.jpg")
                    )
                    ),
          ),
           ListTile(
            leading: Icon(
              Icons.login,
              color: Color(0xFFFF9800),
            ),
            title: (finalLoggedIN == 'ok')?Text('Account'):Text('Login'),
            onTap: () => {
              (finalLoggedIN == 'ok')?Navigator.of(context).pushNamed(ACCOUNT):Navigator.of(context).pushNamed(SIGN_IN),
            },
          ),
           ListTile(
            leading: Icon(
              Icons.app_registration,
              color: Color(0xFFFF9800),
            ),
            title: Text('Register'),
            onTap: () => {
              (finalLoggedIN == 'ok')? Navigator.of(context).pushNamed(REGISTER):Navigator.of(context).pushNamed(SIGN_IN),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.photo,
              color: Color(0xFFFF9800),
            ),
            title: Text('Photo gallery'),
            onTap: () => {
              Navigator.of(context).pushNamed(GALLERY),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.video_collection,
              color: Color(0xFFFF9800),
            ),
            title: Text('Watch videos'),
            onTap: () => {Navigator.of(context).pushNamed(VIDEO_LIST_SCREEN),},
          ),
          ListTile(
            leading: Icon(
              Icons.upload,
              color: Color(0xFFFF9800),
            ),
            title: Text('Upload your works'),
            onTap: () => {(finalLoggedIN == 'ok')? Navigator.of(context).pushNamed(UPLOAD_SCREEN):Navigator.of(context).pushNamed(SIGN_IN),
},
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
              AuthService().logout().then((value){
                print(value);
                
              }),
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
              finalEmail = 'null',
              finalLoggedIN='no',
            },
          ):Text(" "),
        ],
      ),
    );
  }
}
