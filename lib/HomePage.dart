import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'NavigationDrawer.dart';
import 'RecipeList.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Tile.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  StaggeredTile.count(3, 4),
  StaggeredTile.count(1, 4),
  StaggeredTile.count(4, 2),
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 2)
];

List<Widget> _tiles = <Widget>[
  Tile(Color(0xfff12711), Icons.fastfood, "Meals", RecipeList()),
  Tile(Color(0xfff5af19), Icons.people, "Freinds", RecipeList()),
  Tile(Color(0xfff5af19), Icons.camera_alt, "Add Inventory", RecipeList()),
  Tile(Color(0xfff5af19), Icons.settings, "Settings", RecipeList()),
  Tile(Color(0xfff12711), FontAwesomeIcons.info, "Info", RecipeList()),
];

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }

  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: buildDrawer(),
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: new Image.asset('assets/y1.png'),
          ),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Color(0xfff12711), Color(0xfff5af19)]),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black,
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]),
        ),
        preferredSize: new Size(MediaQuery.of(context).size.width, 150.0),
      ),
      body: new Container(
          child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: new StaggeredGridView.count(
                crossAxisCount: 4,
                staggeredTiles: _staggeredTiles,
                children: _tiles,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                padding: const EdgeInsets.all(4.0),
              ))),
    );
  }
}
