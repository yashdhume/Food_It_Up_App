import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class Auth{
  final String url; 
  String token; 
  Auth({this.url}); 
  Future<bool> signIn(String _email, String _password) async{
    String endpoint = "/signin"; 
    var response = await http.post(url + endpoint, body: {'email': _email, 'password': _password}); 
    print(response.body); 
  }
  Future<bool> signUp(String _email, String _password) async{
    String endpoint = "/signup"; 
    var response = await http.post(url + endpoint, body: {'email' : _email, 'password': _password}); 
    print(response); 

  }
  
  Future<bool> hasToken()async{
    final storage = new FlutterSecureStorage();
    String t =  await storage.read(key: 'token');
    if (t != null){
      token = t; 
      return true; 
    }
    return false; 
  }
}