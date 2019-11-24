import 'package:flutter/material.dart';
import 'package:fooditup/data/Recipe.dart';
class RecipeDetailsPage extends StatelessWidget {
  Recipe recipe;
  RecipeDetailsPage({this.recipe});
  List<Widget> createInstructions(){
    int count = 0;
    List<Widget> a = [] ; 
    recipe.instructions.forEach((item){
      a.add(_buildStep(
          leadingTitle: "0" + count.toString(),
          title: "Step".toUpperCase(),
          content:
          item),); 
      a.add(SizedBox(
        height: 30.0,
      ),);
    });
    return a; 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          Icon(Icons.favorite,  color: Color(0xfff12711)),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Text(
                  recipe.name.toUpperCase(),
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                    recipe.description),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 30,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(recipe.rating.toString())
                          ],
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: Text(
                          recipe.author,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.timer),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(recipe.total_time.toString())
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ]..addAll(createInstructions())
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep({String leadingTitle, String title, String content}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Color(0xfff12711),
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Text(leadingTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0)),
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              SizedBox(
                height: 10.0,
              ),
              Text(content),
            ],
          ),
        )
      ],
    );
  }
}
