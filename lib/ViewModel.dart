import 'package:fooditup/data/Auth.dart';
import 'package:scoped_model/scoped_model.dart';

class ViewModel extends Model {
  Auth auth; 
  void Initialization(){
    auth = Auth(url:'https://something.com'); 
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
}
