import './Recipe.dart';
import 'package:http/http.dart';
import 'dart:convert';
Future<List<Recipe>> getRecipes(String url, String token)async{
  
  Response response = await get(url, headers: {'authorization': '$token'});
  List<Recipe> recipes = []; 
  var jsons = jsonDecode(response.body); 
  if (jsons == null){
    return []; 
  }
  jsons.forEach((item){
    recipes.add(Recipe.CreateRecipe(item)); 
  }); 
  return recipes; 
} 
