import 'package:aagneya_flutter_app/services/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aagneya_flutter_app/utilities/constants2.dart';
import 'package:aagneya_flutter_app/home_page.dart';
//import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:aagneya_flutter_app/services/authservices.dart';

//List<ListItem> _dropdownItem1 = [];

final SecureStorage secureStorage = SecureStorage();
String finalName = ' ';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Widget _buildNameTF() {
    secureStorage.readSecureData('name').then((value) {
      finalName = value;
      print(finalName);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.grey[500],
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Enter your Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
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

  // List<ListItem> _dropdownItem1 = [
  //   ListItem(1, "Select"),
  //   ListItem(2, "CSE"),
  //   ListItem(3, "ECE"),
  //   ListItem(4, "EEE"),
  //   ListItem(5, "MECH"),
  //   ListItem(6, "CIVIL"),
  // ];
  
  //  List<ListItem> _dropdownItem1 = [
     
  //  ];

   List _data_;
 
  String select_Item_1;
  
  Future<String> getList() async {
    
    Dio dio = new Dio();
    
    var response = await dio.get("http://192.168.43.50:2000/admin/app-get-item-list");
    
    print(response);

   
    setState((){
      
       _data_= response as List;
      
    });
    
    return "success";
  }

  void initState() {
    super.initState();
    getList();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    //_dropdownMenuItem1 = buildDropDownMenuItem1(_dropdownItem1);
    //_selectedItem1 = _dropdownMenuItem1[0].value;
    _dropdownMenuItem2 = buildDropDownMenuItem2(_dropdownItem2);
    _selectedItem2 = _dropdownMenuItem2[0].value;
    _dropdownMenuItem3 = buildDropDownMenuItem3(_dropdownItem3);
    _selectedItem3 = _dropdownMenuItem3[0].value;
    
    // this.getList();
  }


  // List<DropdownMenuItem<ListItem>> _dropdownMenuItem1;
   //ListItem _selectedItem1;

  // List<DropdownMenuItem<ListItem>> buildDropDownMenuItem1(List listItems1) {
  //   List<DropdownMenuItem<ListItem>> items1 = List();
  //   for (ListItem listItem1 in listItems1) {
  //     items1.add(_dropdownItem1
  //       DropdownMenuItem(
  //         child: Text(listItem1.name),
  //         value: listItem1,
  //       ),
  //     );
  //   }
  //   return items1;
  // }

  List<ListItem> _dropdownItem2 = [
    ListItem(1, "Select"),
    ListItem(2, "CSE"),
    ListItem(3, "ECE"),
    ListItem(4, "EEE"),
    ListItem(5, "MECH"),
    ListItem(6, "CIVIL"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItem2;
  ListItem _selectedItem2;

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItem2(List listItems2) {
    List<DropdownMenuItem<ListItem>> items2 = List();
    for (ListItem listItem2 in listItems2) {
      items2.add(
        DropdownMenuItem(
          child: Text(listItem2.name),
          value: listItem2,
        ),
      );
    }
    return items2;
  }

  List<ListItem> _dropdownItem3 = [
    ListItem(1, "Select"),
    ListItem(2, "CSE"),
    ListItem(3, "ECE"),
    ListItem(4, "EEE"),
    ListItem(5, "MECH"),
    ListItem(6, "CIVIL"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItem3;
  ListItem _selectedItem3;

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItem3(List listItems3) {
    List<DropdownMenuItem<ListItem>> items3 = List();
    for (ListItem listItem3 in listItems3) {
      items3.add(
        DropdownMenuItem(
          child: Text(listItem3.name),
          value: listItem3,
        ),
      );
    }
    return items3;
  }

  // String dropdownValue = 'One';
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
                print(_data_);
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
          child: DropdownButton(
                      //itemCount: snapshot.data.length,
                   
                      style: TextStyle(color: Colors.grey[500]),
                      dropdownColor: Colors.grey[350],
                      hint: Text("Select"),
                      value: select_Item_1,
                      items: _data_.map((list){
                        print(list);
                        return DropdownMenuItem(
                          
                          child: Text(list['itemname']),
                          value:list['_id'],
                        
                        );

                      },).toList(),
                      
                      onChanged: (value) {
                        setState(() {
                          select_Item_1 = value;
                          TextStyle(color: Colors.grey);
                        });
                      })
               
            
        ),
      ],
    );
  }

  Widget _buildItem2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Items',
        //   style: kLabelStyle,
        // ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: DropdownButton(
              style: TextStyle(color: Colors.grey[500]),
              dropdownColor: Colors.grey[350],
              value: _selectedItem2,
              items: _dropdownMenuItem2,
              onChanged: (value) {
                setState(() {
                  _selectedItem2 = value;
                  TextStyle(color: Colors.grey);
                });
              }),
        ),
      ],
    );
  }

  Widget _buildItem3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Items',
        //   style: kLabelStyle,
        // ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: DropdownButton(
              style: TextStyle(color: Colors.grey[500]),
              dropdownColor: Colors.grey[350],
              value: _selectedItem3,
              items: _dropdownMenuItem3,
              onChanged: (value) {
                setState(() {
                  _selectedItem3 = value;
                  TextStyle(color: Colors.grey);
                });
              }),
        ),
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
                      _buildItem2(),
                      _buildItem3(),
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
class Items{
  String value;
  String name;
  Items(this.value,this.name);
}