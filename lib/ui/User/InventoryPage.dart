import 'package:flutter/material.dart';
import 'package:fooditup/ViewModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swipedetector/swipedetector.dart';
import '../../ViewModel.dart';

class InventoryPage extends StatefulWidget {
  _InventoryPage createState() => _InventoryPage();
}

class _InventoryPage extends State<InventoryPage> {
  Map<String, int> inventory;

  Future<void> getImage(ViewModel model) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    List<String> ingredientsFound = await model.analyzeImage(image);
    Map<String, int> temp = new Map<String, int>();
    ingredientsFound.forEach((item) {
      print(item);
      temp[item] = 1;
    });
    setState(() {
      inventory = temp;
    });
  }

  /*List<Widget> ShowOptions(ViewModel model) {
    List<Widget> options = [];
    if (inventory == null) {
      return []..add(Text('Add items'));
    }
    inventory.forEach((key, value) {
      options.add(Row(
        children: <Widget>[
          FloatingActionButton(
              heroTag: key,
              onPressed: () {
                setState(() {
                  inventory[key]--;
                });
              }),
          Text(
            key + ": " + value.toString(),
            style: TextStyle(fontSize: 20),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                inventory[key]++;
              });
            },
          )
        ],
      ));
    });
    return options;
  }*/
  String enter(String text) {
    return text.replaceAll(' ', "\n");
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
        rebuildOnChange: true,
        builder: (context, child, model) => Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xfff12711), Color(0xfff5af19)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                    ),
                    new Column(children: [
                      SizedBox(height: 50.0),
                      _buildHeader(context),
                      new Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                              itemBuilder: (context, int index) =>buildList(context, index),
                          )

                    ),
                  ]), //..addAll(ShowOptions(model)),
                ]),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () => getImage(model),
                child: Icon(Icons.add_a_photo, color: Color(0xfff12711)),
              ),
            ));
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
                "Inventory".toUpperCase(),
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
buildList(BuildContext context, int index){
  return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  OutlineButton(
                    color: Colors.white,
                    child: Text("-", style: TextStyle(color: Color(0xfff12711)) ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter you item"
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Text("0")

                    ],

                  ),
                  OutlineButton(
                    color: Colors.white,
                    child: Text("+", style: TextStyle(color: Color(0xfff12711)) ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ));
}
