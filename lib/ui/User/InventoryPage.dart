import 'package:flutter/material.dart';
import 'package:fooditup/ViewModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../ViewModel.dart';

class InventoryPage extends StatefulWidget{
  _InventoryPage createState ()=> _InventoryPage();
}
class _InventoryPage extends State<InventoryPage>{
  Map<String, int> inventory;  
  Future<void> getImage(ViewModel model) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    List<String> ingredientsFound = await model.analyzeImage(image);
    Map<String, int> temp = new Map<String, int>(); 
    ingredientsFound.forEach((item){
      print(item);
      temp[item] = 1; 
    });
    setState(() {
      inventory = temp; 
    });
  }
  List<Widget> ShowOptions(ViewModel model){
    List<Widget> options = []; 
    if (inventory == null){
      return []..add(Text('Add items')); 
    }
    inventory.forEach((key, value){
      options.add(
        Row(children: <Widget>[
          FloatingActionButton(
            heroTag: key,
            onPressed: (){
              setState(() {
                inventory[key]--; 
              });
            }
          ), 
          Text(key + ": " + value.toString(), style: TextStyle(fontSize: 20),), 
          FloatingActionButton(
            onPressed: (){
              setState(() {
                inventory[key]++; 
              });
            },
          )
        ],)
      );
    });
    return options; 
  }
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>( 
      rebuildOnChange: true,
      builder: (context, child, model) => SafeArea(child:Scaffold(
        body: Center(child:Column(children: <Widget>[]..addAll(ShowOptions(model)),),),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getImage(model),
        child: Icon(Icons.add_a_photo),
      ),
    )));
  }
}