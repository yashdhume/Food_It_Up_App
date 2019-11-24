import 'dart:convert';

import 'package:http/http.dart';
Future<Map<String, int>> getInventory(String url, String token) async{
  Response response = await get(url, headers: {'authorization' : token}); 
  return jsonDecode(response.body); 
}
Future<bool> PostInventory(String url , String token, Map<String, int> inventory)async{
    print('sending');
    Response response = await post(url, headers: {'authorization' : token}, body: inventory); 
    return true; 
}