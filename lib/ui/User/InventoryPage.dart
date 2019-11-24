import 'package:flutter/material.dart';
import 'package:fooditup/ViewModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swipedetector/swipedetector.dart';
import '../../ViewModel.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
class InventoryPage extends StatefulWidget {
  _InventoryPage createState() => _InventoryPage();
}

class _InventoryPage extends State<InventoryPage> {
  //Timer timer;
  void initState(){
    //timer=Timer.periodic(Duration(seconds: 1), (Timer t)=>)
  }
  Map<String, int> inventory;

  Future<void> getImage(ViewModel model) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    List<String> ingredientsFound = await model.analyzeImage(image);
    Map<String, int> temp = new Map<String, int>();
    print('Ingredients Found ' + ingredientsFound.length.toString()); 
    ingredientsFound.forEach((item) {
      print(item);
      temp[item] = 1;
    });
    setState(() {
      inventory = temp;
    });
    print('Ingredients Found ' + inventory.length.toString()); 
  }

  List<Widget> ShowOptions(ViewModel model, BuildContext context) {
    List<Widget> options = [];
    if (inventory == null) {
      return []..add(Text('Add items'));
    }
    inventory.forEach((key, value) {
      options.add(buildList(context, key));
    });

    return options;
  }
  String enter(String text) {
    return text.replaceAll(' ', "\n");
  }

  Widget buildList(BuildContext context, String key){
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
                    onPressed: (){
                      setState(() {
                        inventory[key]--; 
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: key
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Text(inventory[key].toString())

                    ],

                  ),
                  OutlineButton(
                    color: Colors.white,
                    child: Text("+", style: TextStyle(color: Color(0xfff12711)) ),
                    onPressed: (){
                      setState(() {
                        inventory[key]++; 
                      });
                    },
                  ),
                ],
              ),
            ),

          ],
        ),
      ));
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
                          child: ListView(
                            children: ShowOptions(model, context),
                          )

                    ),
                  ]), //..addAll(ShowOptions(model)),
                ]),
              ),
              floatingActionButton: SpeedDial(
                  animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.send, color: Colors.white,),
              backgroundColor: Color(0xffFF416C),
              label: 'Submit',

              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => model.sendInventory(inventory)
            ),
            SpeedDialChild(
              child: Icon(Icons.add_a_photo, color: Colors.white),
                backgroundColor: Color(0xffFF416C),
              label: 'Camera',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => getImage(model)
            ),
    
          ],
        

              ),
            /*  floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () => getImage(model),
                child: Icon(Icons.add_a_photo, color: Color(0xfff12711)),
              ),*/
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
