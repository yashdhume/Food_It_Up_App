import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class Auth{
  final String url; 
  String token; 
  String uid; 
  Auth({this.url}); 
  Future<bool> signIn(String email, String password) async{
    String endpoint = "/signin";
    Map<String, String> json = {'email' : email, 'password': password};
    Response response = await post(url + endpoint, body: jsonEncode(json));
    print(response.body); 
    token = jsonDecode(response.body)['token']; 
    uid = jsonDecode(response.body)['uid']; 
    return true; 
  }
  Future<bool> signUp(String email, String password) async{
    String endpoint = "/signup";
    Map<String, String> json = {'email' : email, 'password': password};
    Response response = await post(url + endpoint, body: jsonEncode(json));
    token = jsonDecode(response.body)['token']; 
    print(token); 
    uid = jsonDecode(response.body)['uid']; 
    return true; 
  }
  Future<bool> storeToken()async {
    if (token != null){
      final storage = new FlutterSecureStorage();
      await storage.write(key: 'token', value: this.token);
      return true; 
    }
    return false; 
  }
  Future<bool> removeToken()async{
    final storage = new FlutterSecureStorage();
    await storage.deleteAll();
    return true; 
  }
  Future<bool> hasToken() async{
    final storage = new FlutterSecureStorage();
    String t =  await storage.read(key: 'token');
    if (t != null){
      token = t; 
      return true; 
    }
    return false; 
  }
}