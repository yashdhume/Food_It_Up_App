import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'RecipeSteps.dart';

class RecipeDetails extends StatelessWidget {
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
                      "Eggs".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30.0),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "In a Sauce pan, add,\nwater till it bois \nadd egs\nlet it boil for 5 min \nenjoy",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 50.0),
                    SizedBox(
                      height: 30.0,
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.fire, color: Colors.white),
                          SizedBox(width: 5.0),
                          Text(
                            "65%",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          Spacer(),
                          VerticalDivider(color: Colors.white),
                          Spacer(),
                          Text(
                            "Non-Vegitarian",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          Spacer(),
                          VerticalDivider(color: Colors.white),
                          Spacer(),
                          Icon(FontAwesomeIcons.stopwatch, color: Colors.white),
                          SizedBox(width: 5.0),
                          Text(
                            "10 min",
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
                child: Image.network(
                    "https://www.inspiredtaste.net/wp-content/uploads/2019/04/Easy-Instant-Pot-Hard-Boiled-Eggs-Recipe-1200.jpg",
                    fit: BoxFit.cover),
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
                      Icons.play_arrow,
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
                      MaterialPageRoute(builder: (_) => RecipeDetailsPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
