import 'package:fooditup/data/Auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fooditup/data/watson.dart';
import 'dart:io';
class ViewModel extends Model {
  Auth auth; 
  Map<String, int> inventory; 
  void Initialization(){
    auth = Auth(url:'https://something.com'); 
    inventory = Map<String, int>(); 
    notifyListeners(); 
  }
  bool isSignedIn(){
    if (auth.token != null){
      return true; 
    }
    return false; 
  }

  Future<bool> signin(String email, String password) async{
    return await auth.signIn(email, password); 
  }
  Future<bool> signup(String email, String password) async{
    return await auth.signUp(email, password); 
  }
  Future<bool> hasToken()async{
    //return await auth.hasToken(); 
    return Future.value(true); 
  }
  Future<List<String>> analyzeImage(File image)async{
    var objectsFound = await visualRecognitionFile(image); 
    List<String> values = await ParseIngredients(objectsFound); 
    return values; 
  }
}
