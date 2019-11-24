import 'package:flutter/material.dart';
import 'package:fooditup/ViewModel.dart';
import 'package:fooditup/data/Recipe.dart';
import 'package:scoped_model/scoped_model.dart';
import 'RecipeDetails.dart';

class RecipeList extends StatefulWidget{
  _RecipeList createState() => _RecipeList(); 
}
class _RecipeList extends State<RecipeList> {
  List<Recipe> recipes; 
  Widget handleLoad(ViewModel model){
    model.get_recipes_at('/recipe/view').then((value){
      setState(() {
        recipes = value; 
      });
    }); 
    return CircularProgressIndicator(); 
  }
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
      builder: (context, child, model) => recipes == null ? handleLoad(model) :Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xfff12711), Color(0xfff5af19)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50.0),
              _buildHeader(context),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "My Favorites".toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: recipes.length,
                  padding: const EdgeInsets.only(left: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: _buildItem,
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                height: 230,
                child: ListView.builder(
                  itemCount: recipes.length,

                  padding: const EdgeInsets.only(left: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      _buildItem(context, index, large: true),
                ),
              ),
            ],
          ),

      ],
    )));
  }

  Widget _buildItem(BuildContext context, index, {bool large = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => RecipeDetails(index: index, which: large, recipes: recipes[index])));
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        width: large ? 150 : 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
                tag: "$large heroTag $index",
                 child:Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          recipes[index].photoURL,
                        ),
                        fit: BoxFit.cover,
                      )),
                  height: large ? 180 : 150,
                )),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                recipes[index].name.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          color: Colors.white,
          iconSize: 40.0,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 40.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Your customised",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Breakfast".toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
