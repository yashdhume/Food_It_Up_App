import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ViewModel.dart';

class Tile extends StatelessWidget {
  Tile(this.backgroundColor, this.iconData, this.itemName, this.navigator);

  final Color backgroundColor;
  final IconData iconData;
  final String itemName;
  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) => Card(
              color: backgroundColor,
              child: new InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => navigator));
                },
                child: new Center(
                  child: new Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            iconData,
                            color: Colors.white,
                          ),
                          new Text(
                            itemName,
                            style: TextStyle(
                                fontFamily: 'Franklin',
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )),
                ),
              ),
            ));
  }
}
