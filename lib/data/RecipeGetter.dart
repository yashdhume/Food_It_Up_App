import './Recipe.dart';
import 'package:http/http.dart';
import 'dart:convert';
Future<List<Recipe>> getRecipes(String url)async{
  
  Response response = await get(url); 
  List<Recipe> recipes = []; 
  var jsons = jsonDecode(response.body); 
  jsons.forEach((item){
    recipes.add(Recipe.CreateRecipe(item)); 
  }); 
  return recipes; 
} 