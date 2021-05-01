import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aagneya_flutter_app/utilities/constants2.dart';
import 'package:aagneya_flutter_app/home_page.dart';
//import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:aagneya_flutter_app/services/authservices.dart';
import 'package:aagneya_flutter_app/utilities/constant3.dart';

final SecureStorage secureStorage = SecureStorage();


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
   
  Widget _buildNameTF() {
    return Container(
         child:Text(
                  finalEmail,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontFamily: 'OpenSans',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              
            );
    
  }

  List<ListItem> _dropdownItems = [
    ListItem(1, "Select"),
    ListItem(2, "CSE"),
    ListItem(3, "ECE"),
    ListItem(4, "EEE"),
    ListItem(5, "MECH"),
    ListItem(6, "CIVIL"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  

  // ignore: non_constant_identifier_names
  List<Items_> _data_ = [];
  List<Items_> _data_1 = [];

List<Items_> _data_2 = [];


  String selectName1 ;
  String selectName2;
  String selectName3;

  Future<List<Items_>> getList() async {
    Dio dio = new Dio();

    String itemname;

    var usr;

    var res;

    res = await dio.get("http://192.168.43.50:2000/admin/app-get-item-list");
    //var respon=res.data;
    print(res.data[0]);
    var tem=res.data[0];
    print(tem['itemname']);
    
    int i = 0;
    do {
      usr = res.data[i];

      itemname = usr["itemname"];
      int j=i+1;
      String k=j.toString();
      Items_ item = Items_(k, itemname);


      _data_.add(item);

      i = i + 1;
      if (res.data.length == i) {
        _data_ = _data_;

        print(_data_);
        break;
      }
    } while (res.data[i] != null);

    print('items');
    print(_data_[0].name);
    return _data_;
  }
  Future<List<Items_>> getList1() async {
    Dio dio = new Dio();

    String itemname;

    var usr;

    var res;

    res = await dio.get("http://192.168.43.50:2000/admin/app-get-item-list");
    //var respon=res.data;

    int i = 0;
    do {
      usr = res.data[i];

      itemname = usr["itemname"];
      int j = i+1;
      String k=j.toString();
      Items_ item = Items_(k, itemname);

      //int j = i + 1;
      //
      //Items_ item = Items_(j, itemname);

      _data_1.add(item);

      i = i + 1;
      if (res.data.length == i) {
        _data_1 = _data_1;

        print(_data_1);
        break;
      }
    } while (res.data[i] != null);

    print('items');
    print(_data_1[0].name);
    return _data_1;
  }
  Future<List<Items_>> getList2() async {
    Dio dio = new Dio();

    String itemname;

    var usr;

    var res;

    res = await dio.get("http://192.168.43.50:2000/admin/app-get-item-list");
    //var respon=res.data;

    int i = 0;
    do {
      usr = res.data[i];

      itemname = usr["itemname"];

      int j = i + 1;
      String k=j.toString();
      Items_ item = Items_(k, itemname);

      _data_2.add(item);

      i = i + 1;
      if (res.data.length == i) {
        _data_2 = _data_2;

        print(_data_2);
        break;
      }
    } while (res.data[i] != null);

    print('items');
    print(_data_2[0].name);
    return _data_2;
  }

  void initState() {
    super.initState();

     _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
     _selectedItem = _dropdownMenuItems[0].value;
     

  }

  Widget _buildDepartment() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Department',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: DropdownButton(
              style: TextStyle(color: Colors.grey[500]),
              dropdownColor: Colors.grey[350],
              value: _selectedItem,
              items: _dropdownMenuItems,
              onChanged: (value) {
                
                setState(() {
                  _selectedItem = value;
                  TextStyle(color: Colors.grey);
                });
              }),
        ),
      ],
    );
  }

  Widget _buildItem1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Items',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
            alignment: Alignment.center,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: FutureBuilder(
                future: getList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print('snap');
                  print(snapshot.data);
                  //selectName1=snapshot.data[0].name;
                  
                  if (snapshot.data == null) {
                    return Container(
                        child: Center(child: CircularProgressIndicator()));
                  } else {
                    return DropdownButton(
                        
                        style: TextStyle(color: Colors.grey[500]),
                        dropdownColor: Colors.grey[350],
                        value: selectName1 ,
                        hint: Text("Select"),
                        items:snapshot.data
                            .map<DropdownMenuItem<String>>(
                                (value) => new DropdownMenuItem<String>(
                                      value: (value.value).toString(),
                                      child: new Text(value.name),
                                    ))
                            .toList(),
                        onChanged: (value) {
                          print("value");
                          print(value);
                          print( snapshot.data[value].name);
                          int _value=value;
                          String selectN = snapshot.data[value].name;
                          print(selectN);
                          setState(() {
                            
                            selectName1 = selectN;
                            TextStyle(color: Colors.grey);
                          });
                        });
                  }
                })),
      ],
    );
  }

  Widget _buildItem2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Items',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
            alignment: Alignment.center,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: FutureBuilder(
                future: getList1(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print('snap');
                  print(snapshot.data);
                  
                  if (snapshot.data == null) {
                    return Container(
                        child: Center(child: CircularProgressIndicator()));
                  } else {
                    return DropdownButton(
                        
                        style: TextStyle(color: Colors.grey[500]),
                        dropdownColor: Colors.grey[350],
                        hint: Text("Select"),
                        value: selectName2,
                        items: snapshot.data
                            .map<DropdownMenuItem<String>>(
                                (value) => new DropdownMenuItem<String>(
                                      value: (value.value).toString(),
                                      child: new Text(value.name),
                                    ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectName2 = value;
                            TextStyle(color: Colors.grey);
                          });
                        });
                  }
                })),
      ],
    );
  }

  Widget _buildItem3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Items',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
            alignment: Alignment.center,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: FutureBuilder(
                future: getList2(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print('snap');
                  print(snapshot.data);
                 
                  if (snapshot.data == null) {
                    return Container(
                        child: Center(child: CircularProgressIndicator()));
                  } else {
                    return DropdownButton(
                       

                        style: TextStyle(color: Colors.grey[500]),
                        dropdownColor: Colors.grey[350],
                        hint: Text("Select"),
                        value: selectName3,
                        items: snapshot.data
                            .map<DropdownMenuItem<String>>(
                                (value) => new DropdownMenuItem<String>(
                                      value: (value.value).toString(),
                                      child: new Text(value.name),
                                    ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectName3 = value;
                            TextStyle(color: Colors.grey);
                          });
                        });
                  }
                })),
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {
          // AuthService().signup(name,email,password).then((val){
          //   print('val is here');
          //   print(val);
          //   if(val.data['success']==true){
          //     Navigator.of(context).pushNamed(SIGN_IN);
          //   }
          // if(val.data['success']){
          //   //token = val.data['token'];
          //   Fluttertoast.showToast(
          //     msg: 'Signup success!!!',
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     backgroundColor: Colors.green,
          //     textColor: Colors.white,
          //     fontSize: 16.0
          //   );
          // }
          // }),
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'REGISTER',
          style: TextStyle(
            color: Color(0xFFFF9800),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFAFAFA),
                      Color(0xFFF5F5F5),
                      Color(0xFFEEEEEE),
                      Color(0xFFE0E0E0),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
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
                        'Register for events',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildNameTF(),
                      SizedBox(height: 30.0),
                      _buildDepartment(),
                      SizedBox(height: 30.0),
                      _buildItem1(),
                       //_buildItem2(),
                       //_buildItem3(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildRegisterBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

// ignore: camel_case_types
class Items_ {
  String value;
  String name;
  Items_(this.value, this.name);
}
class Email{
  String email;
  Email(this.email);
}
    