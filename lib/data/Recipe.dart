import 'dart:convert';
class Recipe{
  final String id, description, photoURL, name, author; 
  final int index, prep_time, review_count, total_time, cook_time;
  final double rating; 
  final List<String> ingredients, instructions; 
  final Map<String, double> ingredient_count; 

  Recipe({this.id, this.description, this.photoURL, this.name, this.author, this.index, this.prep_time, this.review_count, 
  this.total_time, this.rating, this.ingredients, this.instructions,this.cook_time,this.ingredient_count});

  factory Recipe.CreateRecipe(Map<String, dynamic> json){
    Map<String, double> temp = jsonDecode(json['ingredient_count']); 
    return Recipe(
      id: json['_id'], 
      index: json['index'],
      prep_time: json['prep_time'], 
      review_count: json['review_count'], 
      description: json['description'],  
      ingredients: json['ingredients'], 
      total_time: json['total_time'], 
      cook_time: json['cook_time'],
      rating: json['ratings'],
      author: json['author'],
      name: json['name'], 
      photoURL: json['photo_url'],    
      instructions: json['instructions'], 
      ingredient_count: temp
    );
  }

 

}