import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fooditup/ui/Recipe/RecipeSteps.dart';
import 'package:fooditup/data/Recipe.dart';
class RecipeDetails extends StatelessWidget {
  int index;
  bool which;
  Recipe recipes;
  RecipeDetails({this.index, this.which, this.recipes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 350,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xfff12711), Color(0xfff5af19)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                )),
            Positioned(
              top: 350,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Text(
                      recipes.name.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30.0),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      recipes.ingredients.map((item) => item + '\n').toList().toString(),
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 50.0),
                    SizedBox(
                      height: 30.0,
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.white),
                          SizedBox(width: 5.0),
                          Text(
                            "5",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          Spacer(),
                          VerticalDivider(color: Colors.white),
                          Spacer(),
                          Text(
                            recipes.author,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          Spacer(),
                          VerticalDivider(color: Colors.white),
                          Spacer(),
                          Icon(FontAwesomeIcons.stopwatch, color: Colors.white),
                          SizedBox(width: 5.0),
                          Text(
                            recipes.total_time.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 380,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.black38, blurRadius: 50.0)
              ]),
              child: SizedBox(
                height: 350,
                child: Hero( tag: "$which heroTag $index",child:Image.network(
                    recipes.photoURL,
                    fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: 325,
              left: 20,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: IconButton(
                    color: Color(0xfff12711),
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                    )),
              ),
            ),
            Positioned(
              top: 325,
              right: 20,
              child: RaisedButton(
                child: Text(
                  "Read More".toUpperCase(),
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RecipeDetailsPage(recipe: recipes)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
