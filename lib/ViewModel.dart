import 'package:fooditup/data/Auth.dart';
import 'package:fooditup/data/Recipe.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fooditup/data/watson.dart';
import 'package:fooditup/data/RecipeGetter.dart';
import 'package:fooditup/data/InventorySend.dart';
import 'dart:io';
class ViewModel extends Model {
  Auth auth; 
  Map<String, int> inventory; 
  void Initialization(){
    auth = Auth(url:'https://learned-shell-260005.appspot.com'); 
    inventory = Map<String, int>(); 
    getInventory(auth.url + '/inventory/view', auth.token).then((onValue) => inventory = onValue); 
    print('Initialized Viewmodel');
    notifyListeners(); 
  }
  bool isSignedIn(){
    if (auth.token != null){
      return true; 
    }
    return false; 
  }
  Future<List<Recipe>> get_recipes_at(String endpoint) async{
    return await getRecipes(auth.url + endpoint, auth.token); 
  }
  Future<bool> signin(String email, String password) async{
    return await auth.signIn(email, password); 
  }
  Future<bool> signup(String email, String password) async{
    return await auth.signUp(email, password); 
  }
  Future<bool> signout() async{
    return await auth.removeToken();
  }
  Future<bool> hasToken()async{
    return await auth.hasToken(); 
  }
  Future<bool> sendInventory(Map<String, int> addedInventory)async{
    inventory.addAll(addedInventory); 
    return await PostInventory(auth.url + '/inventory/update', auth.token, inventory); 
  }
  Future<List<String>> analyzeImage(File image)async{
    var objectsFound = await visualRecognitionFile(image); 
    List<String> values = await ParseIngredients(objectsFound); 
    return values; 
  }
}
