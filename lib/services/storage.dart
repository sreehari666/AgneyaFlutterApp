//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SecureStorage{

  //final _storage = FlutterSecureStorage();
 
  Future writeSecureData(String key,String value) async {

     SharedPreferences prefs = await SharedPreferences.getInstance();

     prefs.setString(key, value);

     return true;

    // var writeData = await _storage.write(key: key, value: value);

    // return writeData;

  }

  Future readSecureData(String key) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var readData = prefs.getString(key);

    return readData;

    // var readData = await _storage.read(key: key);

    // return readData;

  }

  Future deleteSecureData(String key) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(key);

    return true;

    // var deleteData = await _storage.delete(key: key);

    // return deleteData;

  }

}