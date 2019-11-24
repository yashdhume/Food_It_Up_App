import 'dart:convert';

import 'package:http/http.dart';
Future<Map<String, int>> getInventory(String url, String token) async{
  Response response = await get(url, headers: {'authorization' : token}); 
  return jsonDecode(response.body); 
}
Future<bool> PostInventory(String url , String token, Map<String, int> inventory)async{
    print('sending');
    Map<String, dynamic> stuff = new Map<String, dynamic>(); 
    inventory.forEach((key, value){
      stuff['ingredientName'] = key; 
      stuff['quantity'] = value; 
    }); 
    Map<String, dynamic> root = new Map<String, dynamic>(); 
    root['inventory'] = stuff; 
    Map<String, dynamic> head = new Map<String, dynamic>(); 
    head['user'] = root; 
    print(head); 
    Response response = await post(url, headers: {'authorization' : token}, body: jsonEncode(head));
    print(response.body);  
    return true; 
}