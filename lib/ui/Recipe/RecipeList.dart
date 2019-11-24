import 'package:flutter/material.dart';
import 'RecipeDetails.dart';

class RecipeList extends StatelessWidget {
  final List<String> images = [
    "https://www.inspiredtaste.net/wp-content/uploads/2019/04/Easy-Instant-Pot-Hard-Boiled-Eggs-Recipe-1200.jpg",
    "https://www.inspiredtaste.net/wp-content/uploads/2019/04/Easy-Instant-Pot-Hard-Boiled-Eggs-Recipe-1200.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(height: 30.0),
              _buildHeader(context),
              SizedBox(height: 40.0),
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
                  itemCount: images.length,
                  padding: const EdgeInsets.only(left: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: _buildItem,
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                height: 230,
                child: ListView.builder(
                  itemCount: images.length,

                  padding: const EdgeInsets.only(left: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      _buildItem(context, index, large: true),
                ),
              ),
            ],
          ),

      ],
    ));
  }

  Widget _buildItem(BuildContext context, index, {bool large = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => RecipeDetails(index: index, which: large)));
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
                          images[index],
                        ),
                        fit: BoxFit.cover,
                      )),
                  height: large ? 180 : 150,
                )),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Eggs".toUpperCase(),
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
